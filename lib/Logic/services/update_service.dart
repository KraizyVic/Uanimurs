import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static const MethodChannel _platform = MethodChannel('app.updater/channel');

  static Future<void> checkForUpdates(BuildContext context) async {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = info.version;

    const githubApiUrl = 'https://api.github.com/repos/KraizyVic/Uanimurs/releases/latest';
    final response = await http.get(Uri.parse(githubApiUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final latestVersion = data['tag_name'];
      final changelog = data['body'];
      final apkUrl = data['assets'][0]['browser_download_url'];

      final isNew = VersionHelper.isNewVersionAvailable(currentVersion, latestVersion);

      if (isNew) {
        _showUpdateSheet(context, latestVersion, changelog, apkUrl);
      }else{
        showDialog(
          context: context,
          builder: (context){
            return AlertDialog(
              title: Text("No updates available"),
              content: Text("You are on the latest version."),
            );
          }
        );
      }
    } else {
      print('Failed to fetch latest release');
    }
  }

  static void _showUpdateSheet(BuildContext context, String latestVersion, String changelog, String apkUrl) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text('New Update Available!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 8),
              Center(child: Text('Version: $latestVersion')),
              const SizedBox(height: 8),
              Text('Changelog:', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
              const SizedBox(height: 8),
              SingleChildScrollView(child: Text(changelog)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Later")
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        downloadAndInstallApk(apkUrl, "app_release.apk");
                      },
                      child: const Text('Download & Install'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  static Future<void> downloadAndInstallApk(String url, String apkFileName) async {
    // Request permission for storage
    final status = await Permission.storage.request();
    final notificationStatus = await Permission.notification.request();
    if (notificationStatus.isDenied) {
      print("Notification permission denied");
      await Permission.notification.request();
      return;
    }
    if (status.isPermanentlyDenied) {
      print("Storage permission permanently denied");
      return;
    }
    if (status.isDenied) {
      print("Storage permission denied");
      await Permission.storage.request();
    }

    final dir = await getExternalStorageDirectory();
    final savePath = "${dir!.path}/$apkFileName";

    Dio dio = Dio();

    // Initialize notifications plugin
    await _notificationsPlugin.initialize(const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    ));

    try {
      await dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = ((received / total) * 100).floor();
            _showDownloadProgressNotification(progress);
          }
        },
        deleteOnError: true,
      );

      // Show download complete notification
      await _showDownloadCompleteNotification();

      // Install APK
      await installApk(savePath);
    } catch (e) {
      print("Download failed: $e");
      await _showErrorNotification("Download Failed", "An error occurred while downloading the update.");
    }
  }

  static Future<void> installApk(String filePath) async {
    try {
      await _platform.invokeMethod('installApk', {'filePath': filePath});
    } on PlatformException catch (e) {
      print("Failed to install APK: '${e.message}'");
      await _showErrorNotification("Install Failed", "There was an error while installing the update.");
    }
  }

  static Future<void> _showDownloadProgressNotification(int progress) async {
    final android = AndroidNotificationDetails(
      'update_channel',
      'App Updates',
      channelDescription: 'Progress of app update',
      importance: Importance.low,
      priority: Priority.low,
      showProgress: true,
      enableVibration: true,
      onlyAlertOnce: true,
      enableLights: true,
      maxProgress: 100,
      progress: progress,
    );

    await _notificationsPlugin.show(
      0,
      'Downloading update...',
      '$progress%',
      NotificationDetails(android: android),
    );
  }

  static Future<void> _showDownloadCompleteNotification() async {
    final android = AndroidNotificationDetails(
      'update_complete',
      'Download Complete',
      channelDescription: 'Update download finished',
      importance: Importance.high,
      priority: Priority.high,
    );

    await _notificationsPlugin.show(
      1,
      'Update Ready',
      'Tap to install the update.',
      NotificationDetails(android: android),
    );
  }

  static Future<void> _showErrorNotification(String title, String body) async {
    final android = AndroidNotificationDetails(
      'error_channel',
      'Download Error',
      channelDescription: 'Error during update process',
      importance: Importance.high,
      priority: Priority.high,
    );

    await _notificationsPlugin.show(
      2,
      title,
      body,
      NotificationDetails(android: android),
    );
  }
}

class VersionHelper {
  static bool isNewVersionAvailable(String currentVersion, String latestVersion) {
    final current = currentVersion.replaceAll("v", "").trim();
    final latest = latestVersion.replaceAll("v", "").trim();
    return current != latest;
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class UpdateService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();
  static const MethodChannel _platform = MethodChannel('app.updater/channel');

  static Future<void> checkForUpdates(BuildContext context, bool isManualCheck) async {
    final info = await PackageInfo.fromPlatform();
    final currentVersion = info.version;

    const githubApiUrl = 'https://api.github.com/repos/KraizyVic/Uanimurs/releases/latest';
    if(!context.mounted){
      return ;
    }
    isManualCheck ? showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context)=>AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Checking for updates...",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    )
    ) : null;
    final response = await http.get(Uri.parse(githubApiUrl));
    isManualCheck ? Navigator.pop(context) : null;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final latestVersion = data['tag_name'];
      final changelog = data['body'];
      final apkUrl = data['assets'][0]['browser_download_url'];

      final isNew = VersionHelper.isNewVersionAvailable(currentVersion, latestVersion);

      if (isNew) {
        _showUpdateSheet(context, latestVersion, changelog, apkUrl);
      } else if (isManualCheck) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("No updates available"),
            content: Row(
              children: [
                Image.asset("lib/Database/assets/thumbs_up.png", width: 100, height: 100, fit: BoxFit.cover),
                const SizedBox(width: 10),
                const Expanded(child: Text("You are using the latest version of Uanimurs")),
              ],
            ),
          ),
        );
      }
    } else {
    }
  }

  static void _showUpdateSheet(BuildContext context, String latestVersion, String changelog, String apkUrl) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text('New Update Available!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),
                Center(child: Text('Version: $latestVersion')),
                const SizedBox(height: 8),
                Text('Changelog:', style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                const SizedBox(height: 8),
                Expanded(child: SingleChildScrollView(child: Text(changelog))),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: const Text("Later"),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(50),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await downloadWithDownloadManager(apkUrl, "app_release.apk");
                        },
                        child: const Text('Download & Install'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> downloadWithDownloadManager(String url, String fileName) async {

    await _showAppNotification("Download started", "Download begun and is being handled by the system download manager. Please wait...");
    try {
      await _platform.invokeMethod('startDownload', {
        'url': url,
        'fileName': fileName,
      });
    } catch (e) {
      await _showAppNotification("Download Failed", "Could not start system download manager.");
    }
  }

  static Future<void> _showAppNotification(String title, String body) async {
    await _notificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/hellow'),
      ),
    );

   await Permission.notification.request();
    if (await Permission.notification.isPermanentlyDenied) {
      await openAppSettings();
    }else{
      await Permission.notification.request();
    }

    const android = AndroidNotificationDetails(
      'error_channel',
      'Download Error',
      channelDescription: 'Error during update process',
      importance: Importance.high,
      priority: Priority.high,
    );

    await _notificationsPlugin.show(
      0,
      title,
      body,
      const NotificationDetails(android: android),
    );
  }

}

class VersionHelper {
  static bool isNewVersionAvailable(String currentVersion, String latestVersion) {
    final current = currentVersion.replaceAll(RegExp(r'[^\d]'), '');
    final latest = latestVersion.replaceAll(RegExp(r'[^\d]'), '');
    return int.tryParse(latest)! > int.tryParse(current)!;
  }
}
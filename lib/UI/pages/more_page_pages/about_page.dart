import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../Logic/services/update_service.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appVersion = '';
  String appName = '';
  String appBuildNumber = '';

  @override
  void initState() {
    super.initState();
    _loadAppInfo();
  }

  Future<void> _loadAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
      appName = packageInfo.appName;
      appBuildNumber = packageInfo.buildNumber;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 200,
              scrolledUnderElevation: 0,
              backgroundColor: Theme.of(context).colorScheme.surface,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("About App"),
              )
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  ListTile(
                    title: Text("App name"),
                    trailing: Text(appName),
                  ),
                  ListTile(
                    title: Text("App version"),
                    trailing: Text(appVersion),
                  ),
                  ListTile(
                    title: Text("App build number"),
                    trailing: Text(appBuildNumber),
                  ),
                  TextButton(
                    onPressed: (){
                      UpdateService.checkForUpdates(context);
                    },
                    child: Text("Check for updates")
                  ),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}

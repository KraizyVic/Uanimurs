import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uanimurs/Logic/models/github_model.dart';

import '../../../Logic/bloc/app_cubit.dart';
import '../../../Logic/global_functions.dart';
import '../../../Logic/services/github_service.dart';
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
                  /*ListTile(
                    title: Text("Number of accounts"),
                    trailing: Text("Null"),
                  ),*/
                  ListTile(
                    title: Text("App version"),
                    trailing: Text(appVersion),
                  ),
                  ListTile(
                    title: Text("App build number"),
                    trailing: Text(appBuildNumber),
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About Uanimurs"),
                    trailing: Text(""),
                    onTap: (){
                      Future<RepositoryModel> fetchRepo = GithubService().getRepository();
                      showRepositoryData(context, fetchRepo);
                    }
                  ),
                  ListTile(
                    leading: Icon(Icons.person_2_outlined),
                    title: Text("About Developer"),
                    trailing: Text(""),
                    onTap: (){
                      Future<DeveloperModel> fetchDeveloper = GithubService().getDeveloper();
                      showDeveloperData(context, fetchDeveloper);
                    }
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip_outlined),
                    title: Text("Privacy Policy"),
                    trailing: Text(""),
                    onTap: (){
                      showPrivacyPolicy(context);
                    }
                  ),
                  ListTile(
                    leading: Icon(Icons.format_align_left_sharp),
                    title: Text("Terms of Service"),
                    trailing: Text(""),
                    onTap: ()=> showTermsOfService(context),
                  ),
                  ListTile(
                    leading: Icon(Icons.contact_support_outlined),
                    title: Text("Contact Us"),
                    trailing: Text(""),
                    onTap: (){}
                  ),
                  ListTile(
                    leading: Icon(Icons.feedback_outlined),
                    title: Text("Feedback"),
                    trailing: Text(""),
                    onTap: (){}
                  ),
                  TextButton(
                    onPressed: (){
                      UpdateService.checkForUpdates(context,true);
                    },
                    child: Text("Check for updates")
                  ),
                  SizedBox(height: 100,),
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../pages/more_page_pages/about_page.dart';
import '../../pages/more_page_pages/appearance_page.dart';
class FunctionalSettings extends StatelessWidget {
  const FunctionalSettings({super.key});

  @override

  Widget build(BuildContext context) {
    double borderRadius = 10.0;
    return ClipRRect(
      //borderRadius: BorderRadius.circular(borderRadius),
      child: Column(
        children: [
          ListTile(
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(borderRadius), topRight: Radius.circular(borderRadius))),
            leading: Icon(Icons.color_lens_outlined),
            title: Text("Appearance"),
            subtitle: Text("Change Looks"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AppearancePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.grid_view_outlined),
            title: Text("Layout"),
            subtitle: Text("Change between grid and list view"),
            onTap: () {
              //Navigator.pushNamed(context, "/appearance");
            },
          ),
          ListTile(
            leading: Icon(Icons.subtitles),
            title: Text("Subtitle Setting"),
            subtitle: Text("Tweak subtitle settings"),
            onTap: () {
              //Navigator.pushNamed(context, "/appearance");
            },
          ),
          ListTile(
            //shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.only(bottomLeft: Radius.circular(borderRadius), bottomRight: Radius.circular(borderRadius))),
            leading: Icon(Icons.play_circle_outlined),
            title: Text("Player"),
            subtitle: Text("Customize player experience"),
            onTap: () {
              //Navigator.pushNamed(context, "/appearance");
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text("About"),
            subtitle: Text("About Uanimurs"),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()))
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,),
            child: ListTile(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              tileColor: Theme.of(context).colorScheme.primary.withAlpha(50),
              leading: Icon(Icons.coffee),
              title: Text("Buy me Ko-Fi"),
              subtitle: Text("Support this project on Ko-fi"),
              onTap: () async{
                if (!await launchUrl(Uri.parse("https://ko-fi.com/kraizyvic"))) {
                  showSnackBar(context, "Could not launch https://ko-fi.com/kraizyvic");
                  throw Exception('Could not launch https://ko-fi.com/kraizyvic');

                }
              }
            ),
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    )
  );
}

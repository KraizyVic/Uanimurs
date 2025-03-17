import 'package:flutter/material.dart';
import 'package:uanimurs/UI/pages/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "lib/UI/assets/in_a_hall_looking_at_screen.webp",
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface.withAlpha(70),
                  Theme.of(context).colorScheme.surface.withAlpha(255),
                ],
                begin: Alignment(0, -0.5),
                end: Alignment(0, 0.7),
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Uanimurs", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Home of Anime", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      //SizedBox(width: MediaQuery.of(context).size.width * 0.5, child: LinearProgressIndicator()),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: MaterialButton(
                  onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage())),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,),
                      child: Center(child: Text("Get started")),
                    ),
                  ),),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/UI/custom_widgets/buttons.dart';
import 'package:uanimurs/UI/pages/auth_page.dart';
import 'package:uanimurs/main.dart';

Widget welcomeScreen({
  required BuildContext context,
}){
  return Stack(
    children: [
      SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("YOKOSO !",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                  Text("",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                  Text("UANIMURS",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                  Text("",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                ],
              ),
            ),
          ],
        ),
      ),
      Image.asset(
        "lib/Database/assets/welcome/aizen with sword.png",
        fit: BoxFit.contain,
        alignment: Alignment.bottomCenter,
        width: double.maxFinite,
        height: double.maxFinite,
      ),
      SizedBox(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
              Row(
                children: [
                  Text("Watashi no",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                  Spacer()
                ],
              ),
              Text("",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
              Row(
                children: [
                  Spacer(),
                  Text("Society",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget welcomeScreenButtonArea({
  required BuildContext context,
  required PageController screenController,
  required PageController screenButtonController,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(),
    child: SizedBox(
      height: 250,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "lib/Database/assets/welcome/aizen.png",
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          SizedBox(width: 20,),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("WELCOME !",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                Text("To",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                Text("Uanimurs",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                SizedBox(height: 20,),
                customTextButton(
                  context: context,
                  buttonName: "Next",
                  onTap: (){
                    screenController.nextPage(
                      duration: Duration(milliseconds: 600),
                      curve: Curves.ease,
                    );
                    screenButtonController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  isFilled: true
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}



Widget appAndDeveloperScreen({
  required BuildContext context,
}){
  return Column(
    children: [
      Expanded(
        child: Row(
          children: [
            Image.asset(
              "lib/Database/assets/welcome/pink hair girl.png",
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Heads UP !",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                    SizedBox(height: 10,),
                    Text("Blah blah blah something inspiring here, if none then uuuhh... Read disclaimer and move on sheesh !! ",textAlign: TextAlign.end,),
                  ],
                ),
              ),
            )
          ],
        )
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Disclaimer",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                    SizedBox(height: 10,),
                    Text("We, NO, I ( since I'm one dev ),No, UANIMURS does not host any data provided or have any affiliations with the providers of the provided content",maxLines: 5,overflow: TextOverflow.ellipsis,),
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              title: Text("Disclaimer",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("We, NO, I ( since I'm one dev ),NO, UANIMURS does not host any data provided or have any affiliations with the providers of the provided content"),
                                  Row(
                                    children: [
                                      Spacer(),
                                      TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Cancel"))
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        );
                      },
                      child: Text("Read more",style: TextStyle(color: Colors.blue),),
                    )
                  ],
                ),
              )
            ),
            Image.asset(
                "lib/Database/assets/welcome/stop.png",
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ],
        )
      ),
    ],
  );
}

Widget appDeveloperScreenButtonArea({
  required BuildContext context,
  required PageController screenController,
  required PageController screenButtonController,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(),
    child: SizedBox(
      height: 250,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "lib/Database/assets/welcome/77_by_dinocozero_d92wmft.png",
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          SizedBox(width: 20,),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                Text("Read",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                Text("Nothing !",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: customTextButton(
                        context: context,
                        buttonName: "Previous",
                        onTap: (){
                          screenController.previousPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.ease,
                          );
                          screenButtonController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: customTextButton(
                          context: context,
                          buttonName: "Next",
                          onTap: (){
                            screenController.nextPage(
                              duration: Duration(milliseconds: 600),
                              curve: Curves.ease,
                            );
                            screenButtonController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          isFilled: true
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}


Widget accountScreen({
  required BuildContext context,
}){
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.red.withAlpha(50),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Image.asset(
          "lib/Database/assets/welcome/darling in the franxx.png",
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Hold UP !!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                SizedBox(height: 10,),
                Text("Do you have a Uanimurs Account ? ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                Text("It is recommended to have an online account to prevent data loss and SYNC your data across devices",textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                customTextButton(
                  context: context,
                  buttonName: "Login",
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthPage(isFromWelcomeScreens: true,)));
                  }
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

Widget accountScreenButtonArea({
  required BuildContext context,
  required PageController screenController,
  required PageController screenButtonController,
}){
  return Padding(
    padding: const EdgeInsets.symmetric(),
    child: SizedBox(
      height: 250,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                "lib/Database/assets/welcome/satoru_gojo_render.png",
                fit: BoxFit.contain,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          SizedBox(width: 20,),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Start",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                Text("Exploring",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: customTextButton(
                        context: context,
                        buttonName: "Previous",
                        onTap: (){
                          screenController.previousPage(
                            duration: Duration(milliseconds: 550),
                            curve: Curves.ease,
                          );
                          screenButtonController.previousPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: customTextButton(
                        context: context,
                        buttonName: "Explore",
                        onTap: (){
                          BlocProvider.of<AppCubit>(context).setNotFirstTime();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                        },
                        isFilled: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
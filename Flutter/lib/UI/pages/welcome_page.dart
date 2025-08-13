import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Database/constants.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import '../../main.dart';
import '../custom_widgets/pages_items/welcome_screens.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  int pageIndex = 0;
  PageController screensController = PageController();
  PageController screensButtonController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppModel?>(
      builder: (context,state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          //extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              TextButton(
                onPressed: (){
                  BlocProvider.of<AppCubit>(context).setNotFirstTime();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                },
                child: Text("Skip")
              )
            ],
          ),
          body: Stack(
            children: [
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
                children: [
                  Row(
                    children: [

                    ],
                  ),
                  Expanded(
                    child: PageView(
                      controller: screensController,
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (value){
                        setState(() {
                          pageIndex = value;
                        });
                      },
                      children: [
                        welcomeScreen(context: context),
                        appAndDeveloperScreen(context: context),
                        accountScreen(context: context),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary.withAlpha(50),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: SizedBox(
                        height: 250,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10,top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: pageIndex == 0 ? Theme.of(context).colorScheme.primary : Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: pageIndex == 1 ? Theme.of(context).colorScheme.primary : Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      color: pageIndex == 2 ? Theme.of(context).colorScheme.primary : Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: PageView(
                                controller: screensButtonController,
                                physics: NeverScrollableScrollPhysics(),
                                onPageChanged: (value){
                                  setState(() {
                                    pageIndex = value;
                                  });
                                },
                                children: [
                                  welcomeScreenButtonArea(
                                    context: context,
                                    screenController: screensController,
                                    screenButtonController: screensButtonController
                                  ),
                                  appDeveloperScreenButtonArea(
                                    context: context,
                                    screenController: screensController,
                                    screenButtonController: screensButtonController
                                  ),
                                  accountScreenButtonArea(
                                    context: context,
                                    screenController: screensController,
                                    screenButtonController: screensButtonController
                                  ),
                                ]
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}



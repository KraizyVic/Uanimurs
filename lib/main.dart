import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Database/secrets.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';
import 'package:uanimurs/Logic/services/http_overrides.dart';
import 'package:uanimurs/UI/pages/welcome_page.dart';

import 'Logic/bloc/app_cubit.dart';
import 'Logic/models/anime_model.dart';
import 'Logic/services/aniwatch_services.dart';
import 'Logic/services/update_service.dart';
import 'UI/custom_widgets/bottom_nav_bar_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      // Add these to ensure transparency
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness:
      Brightness.dark, // Or Brightness.light depending on your theme
    ),
  );

  // Edge-to-edge after the overlay style
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    AppModelSchema,
    WatchHistorySchema,
    AnimeModelSchema,
  ],directory: dir.path);

  runApp(
    BlocProvider(
      create: (_) => AppCubit(isar: isar)..loadAppModel(),
      child: MyApp(isar: isar),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Isar isar;
  const MyApp({super.key, required this.isar});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Safely check for updates after build is complete
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppModel?>(
      builder: (context, state) {
        if (state == null) {
          return Container();
        }
        return MaterialApp(
          themeMode: state.settings.appearance.themeMode == 0 ? ThemeMode.system : state.settings.appearance.themeMode == 1 ? ThemeMode.light : ThemeMode.dark,
          theme: ThemeData(
            useMaterial3: state.settings.appearance.useMaterialUI,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(state.settings.appearance.primaryColor),
              primary: Color(state.settings.appearance.primaryColor),
              tertiary: Colors.black,
              brightness: Brightness.light,
              //surface: state.settings.appearance.amoledBackground ? Colors.white : Theme.of(context).colorScheme.surface,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: state.settings.appearance.useMaterialUI,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Color(state.settings.appearance.primaryColor),
              primary: Color(state.settings.appearance.primaryColor),
              tertiary: Colors.white,
              brightness: Brightness.dark,
              surface: state.settings.appearance.amoledBackground ? Colors.black : null,
            ),
          ),
          title: 'Uanimurs',
          home: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
            ),
            child: AuthenticationGate(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class AuthenticationGate extends StatefulWidget {
  const AuthenticationGate({super.key});

  @override
  State<AuthenticationGate> createState() => _AuthenticationGateState();
}

class _AuthenticationGateState extends State<AuthenticationGate> {

  late Future pingApp ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pingApp = AniWatchService().pingApp();
    BlocProvider.of<AppCubit>(context).authState(isLoggedIn: Supabase.instance.client.auth.currentUser != null);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: pingApp,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("lib/Database/assets/hellow.png",width: 100,),
                  SizedBox(height: 10),
                  SizedBox(width: 100,child: LinearProgressIndicator()),
                ],
              ),
            ),
          );
        }
        if (asyncSnapshot.hasError) {
          //ScaffoldMessenger(child: SnackBar(content: Text("Error Loading Check your internet connection and try again later")));
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Error !",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                  SizedBox(height: 10,),
                  Text("Error Loading Check your internet connection and RETRY"),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.error_outline,color: Theme.of(context).colorScheme.primary,),
                      SizedBox(width: 10,),
                      Expanded(child: Text(asyncSnapshot.error.toString(),style: TextStyle(color: Theme.of(context).colorScheme.primary),)),

                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                          onPressed: (){
                            setState(() {
                              pingApp = AniWatchService().pingApp();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              foregroundColor: Theme.of(context).colorScheme.tertiary
                          ),
                          child: Text("Retry")
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return StreamBuilder<AuthState>(
          stream: Supabase.instance.client.auth.onAuthStateChange,
          builder: (context, snapshot) {
            return MainPage(); // render UI, separate from side effects
          },
        );
      }
    );
  }
}


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  int exitTapCount = 0;

  @override
  void initState() {
    super.initState();
    UpdateService.checkForUpdates(context, false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppModel?>(
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (!didPop) {
              if (pageIndex != 0) {
                setState(() {
                  pageIndex = 0;
                });
              } else {
                exitTapCount++;
                bool exitConfirmed = exitTapCount >= 2;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Center(
                      child: Text(
                        'Press back again to exit',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    duration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                );

                // Wait 2 seconds then reset count
                await Future.delayed(Duration(seconds: 2));
                exitTapCount = 0;

                if (exitConfirmed) {
                  SystemNavigator.pop().then((value) => exit(0));
                }
              }
            } else {
              debugPrint("Screen popped with result: $result");
            }
          },
          child: AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              systemNavigationBarColor: Colors.transparent,
            ),
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                fixedColor: Theme.of(context).colorScheme.primary,
                currentIndex: pageIndex,
                onTap: changePage,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(pageIndex == 0 ? Icons.home : Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      pageIndex == 1 ? Icons.search : Icons.search_outlined,
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      pageIndex == 2 ? Icons.folder : Icons.folder_outlined,
                    ),
                    label: 'My list',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      pageIndex == 3
                          ? Icons.more_horiz
                          : Icons.more_horiz_outlined,
                    ),
                    label: 'More',
                  ),
                ],
              ),
              body: mainPages[pageIndex],
            ),
          ),
        );
      },
    );
  }

  void changePage(int index) {
    setState(() {
      if (index != 0) {
        exitTapCount = 0;
      }
      pageIndex = index;
    });
  }
}

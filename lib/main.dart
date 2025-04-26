import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uanimurs/Logic/models/settings_model.dart';
import 'package:uanimurs/Logic/models/watch_history.dart';

import 'Logic/bloc/account_cubit.dart';
import 'Logic/models/account_model.dart';
import 'Logic/models/anime_model.dart';
import 'Logic/services/update_service.dart';
import 'UI/custom_widgets/bottom_nav_bar_pages.dart';
import 'UI/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Make the navigation bar transparent, not white
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      // Add these to ensure transparency
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark, // Or Brightness.light depending on your theme
    ),
  );

  // Edge-to-edge after the overlay style
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [AccountModelSchema, AnimeModelSchema,WatchHistorySchema,],
    directory: dir.path,
  );

  runApp(
    BlocProvider(
      create: (context) => AccountCubit(isar),
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
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
      builder: (context,state) {
        if(state.isEmpty && state != null){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0xFFFF9F00),
                primary: Color(0xFFFF9F00),
                brightness: Brightness.light,
                tertiary: Colors.black,
              ),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0xFFFF9F00),
                //surface: state!.settings.appearance.amoledBackground ? Colors.black : ,
                primary: Color(0xFFFF9F00),
                brightness: Brightness.dark,
                tertiary: Colors.white,
              ),
              useMaterial3: true,
            ),
            title: 'Uanimurs',
            home: WelcomePage(),
          );
        }else if(state.length == 1){
          Color color = Color(context.watch<AccountCubit>().activeAccount?.settings.appearance.primaryColor ?? 0xFFFF1493);
          AccountModel activeAccount = context.watch<AccountCubit>().activeAccount ?? AccountModel(username: "Unknown",settings: SettingsModel()) ;
          ThemeMode themeMode = ThemeMode.system;
          if(context.watch<AccountCubit>().activeAccount?.settings.appearance.themeMode == 1){
            themeMode = ThemeMode.light;
          }else if(context.watch<AccountCubit>().activeAccount?.settings.appearance.themeMode == 2){
            themeMode = ThemeMode.dark;
          }
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: color,
                  primary: color,
                  brightness: Brightness.light,
                  tertiary: Colors.black,
                ),
                useMaterial3: activeAccount.settings.appearance.useMaterialUI,
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: color,
                  surface: activeAccount.settings.appearance.amoledBackground ? Colors.black : null,
                  primary: color,
                  brightness: Brightness.dark,
                  tertiary: Colors.white,
                ),
                useMaterial3: activeAccount.settings.appearance.useMaterialUI,

              ),
              title: 'Uanimurs',
              home: MainPage(),
            ),
          );
        }else if (state.length > 1){
          Color color = Color(context.watch<AccountCubit>().activeAccount?.settings.appearance.primaryColor ?? 0xFFFF1493);
          AccountModel activeAccount = context.watch<AccountCubit>().activeAccount ?? AccountModel(username: "Unknown",settings: SettingsModel()) ;
          ThemeMode themeMode = ThemeMode.system;
          if(context.watch<AccountCubit>().activeAccount?.settings.appearance.themeMode == 1){
            themeMode = ThemeMode.light;
          }else if(context.watch<AccountCubit>().activeAccount?.settings.appearance.themeMode == 2){
            themeMode = ThemeMode.dark;
          }
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeMode,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: color,
                  primary: color,
                  brightness: Brightness.light,
                  tertiary: Colors.black,
                ),
                useMaterial3: activeAccount.settings.appearance.useMaterialUI,
              ),
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: color,
                  surface: activeAccount.settings.appearance.amoledBackground ? Colors.black : null,
                  primary: color,
                  brightness: Brightness.dark,
                  tertiary: Colors.white,
                ),
                useMaterial3: activeAccount.settings.appearance.useMaterialUI,

              ),
              title: 'Uanimurs',
              home: SelectAccountPage(),
            ),
          );
        }else{
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            home: Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          );
        }
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
    UpdateService.checkForUpdates(context,false);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
      builder: (context,state) {
        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) async {
            if (!didPop) {
              if(pageIndex != 0){
                setState(() {
                  pageIndex = 0;
                });
              }else{
                exitTapCount++;
                bool exitConfirmed = exitTapCount >= 2;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    content: Center(child: Text('Press back again to exit',style: TextStyle(color: Theme.of(context).colorScheme.tertiary))),
                    elevation: 0,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    duration: Duration(seconds: 2),
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  )
                );

                // Wait 2 seconds then reset count
                await Future.delayed(Duration(seconds: 2));
                exitTapCount = 0;

                if (exitConfirmed) {
                  SystemNavigator.pop();
                }
              }
            } else {
              debugPrint("Screen popped with result: $result");
            }
          },
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              fixedColor: Theme.of(context).colorScheme.primary,
              currentIndex: pageIndex,
              onTap: changePage,
              items: [
                BottomNavigationBarItem(icon: Icon(pageIndex == 0 ? Icons.home : Icons.home_outlined), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(pageIndex == 1 ? Icons.search : Icons.search_outlined), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(pageIndex == 2 ? Icons.folder : Icons.folder_outlined), label: 'My list'),
                BottomNavigationBarItem(icon: Icon(pageIndex == 3 ? Icons.more_horiz : Icons.more_horiz_outlined), label: 'More'),
              ],
            ),
            body: mainPages[pageIndex],
          ),
        );
      }
    );
  }

  void changePage(int index) {
    setState(() {
      if(index != 0){
        exitTapCount = 0;
      }
      pageIndex = index;
    });
  }
}

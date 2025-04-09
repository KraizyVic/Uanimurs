import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uanimurs/Logic/models/settings_model.dart';
import 'package:uanimurs/UI/pages/home_page.dart';
import 'package:uanimurs/UI/pages/more_page.dart';
import 'package:uanimurs/UI/pages/my_list_page.dart';
import 'package:uanimurs/UI/pages/search_page.dart';

import 'Logic/bloc/account_cubit.dart';
import 'Logic/models/account_model.dart';
import 'Logic/models/anime_model.dart';
import 'Logic/services/update_service.dart';
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
    [AccountModelSchema, AnimeModelSchema],
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdates();
    });
  }

  void _checkForUpdates() async {
    await UpdateService.checkForUpdates(context); // Now context is safe to use
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
      builder: (context,state) {
        if(state.isEmpty){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Color(0xFFFF1493),
                primary: Color(0xFFFF1493),
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
        }else{
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
  void changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  final List<Widget> pages = [
    Homepage(),
    SearchPage(),
    MyListPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
      builder: (context,state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            fixedColor: Theme.of(context).colorScheme.primary,
            currentIndex: pageIndex,
            onTap: changePage,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'My list'),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
            ],
          ),
          body: pages[pageIndex],
        );
      }
    );
  }
}

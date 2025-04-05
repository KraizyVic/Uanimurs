import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uanimurs/UI/pages/home_page.dart';
import 'package:uanimurs/UI/pages/more_page.dart';
import 'package:uanimurs/UI/pages/my_list_page.dart';
import 'package:uanimurs/UI/pages/search_page.dart';

import 'Logic/bloc/account_cubit.dart';
import 'Logic/models/account_model.dart';
import 'Logic/models/anime_model.dart';
import 'UI/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Enable full edge-to-edge mode
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  // Set transparent system UI
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      systemNavigationBarContrastEnforced: false, // Important for Android
      systemStatusBarContrastEnforced: false,
    ),
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
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,AccountModel?>(
      builder: (context,state) {
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
              seedColor: Color(0xFFFF1493),
              primary: Color(0xFFFF1493),
              brightness: Brightness.dark,
              tertiary: Colors.white,
            ),
            useMaterial3: true,
          ),
          title: 'Uanimurs',
          home: state == null ? WelcomePage() : MainPage(),
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.pink,
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
}

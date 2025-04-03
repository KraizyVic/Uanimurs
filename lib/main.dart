import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Logic/bloc/my_list_cubit.dart';
import 'UI/custom_widgets/bottom_nav_bar_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge, overlays:[SystemUiOverlay.top]
  );
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent
    )
  );

  runApp(
      const MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;
  void changePage(int index){
    setState(() {
      pageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>WatchListCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Uanimurs',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFE01B1),brightness: Brightness.light,primary: Color(0xFFFE01B1),tertiary: Colors.black,),
          useMaterial3: true
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFFE01B1),brightness: Brightness.dark,primary: Color(0xFFFE01B1),tertiary: Colors.white),
          useMaterial3: true
        ),
        home: Scaffold(
          body: mainPages[pageIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: changePage,
            currentIndex: pageIndex,
            selectedItemColor: Color(0xFFFE01B1),
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.folder),label: "My List"),
              BottomNavigationBarItem(icon: Icon(Icons.menu),label: "More"),
            ]
          ),
        ),
      ),
    );
  }
}
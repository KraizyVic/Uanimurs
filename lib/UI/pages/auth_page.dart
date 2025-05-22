import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_widgets/pages_items/auth_page_items.dart';

class AuthPage extends StatefulWidget {
  final bool isFromWelcomeScreens;
  const AuthPage({super.key,this.isFromWelcomeScreens = false});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
        ),
        child: Stack(
          children: [
            Image.asset(
              "lib/Database/assets/nezuko and tanjiro.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              opacity: AlwaysStoppedAnimation(.5),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.centerRight,
                  colors: [
                    Theme.of(context).colorScheme.primary.withAlpha(100),
                    Theme.of(context).colorScheme.surface,
                  ]
                )
              ),
            ),
            Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                ),
                Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [
                      loginScreen(
                        context: context,
                        emailController: emailController,
                        passwordController: loginPasswordController,
                        pageController: pageController,
                        isFromWelcomePage: widget.isFromWelcomeScreens
                      ),
                      signUpScreen(
                        context: context,
                        emailController: emailController,
                        uesenameController: userNameController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        pageController: pageController
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}

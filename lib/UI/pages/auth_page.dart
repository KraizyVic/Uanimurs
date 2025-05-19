import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_widgets/pages_items/auth_page_items.dart';

class LoginOrSignUpPage extends StatefulWidget {
  const LoginOrSignUpPage({super.key});

  @override
  State<LoginOrSignUpPage> createState() => _LoginOrSignUpPageState();
}

class _LoginOrSignUpPageState extends State<LoginOrSignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
        ),
        child: Stack(
          children: [
            /*Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset("lib/Database/assets/nezuko and tanjiro.png",fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
                      Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Theme.of(context).colorScheme.surface.withAlpha(100),
                                  Theme.of(context).colorScheme.surface,
                                ]
                            )
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(height: 100,),
              ],
            ),*/
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

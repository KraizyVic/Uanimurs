import 'package:flutter/material.dart';
import 'package:uanimurs/Logic/services/authentication_service.dart';
import 'package:uanimurs/UI/custom_widgets/widgets.dart';

import '../buttons.dart';

Widget loginScreen({
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController passwordController,
  required PageController pageController,
  bool isFromWelcomePage = false
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Center(child: Text("Welcome Back !",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),
      Expanded(
        flex: 2,
        child: SingleChildScrollView(
          child: Container(
            color: Colors.red.withAlpha(00),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MyTextField(
                    borderRadius: 10,
                    controller: emailController,
                    hintText: "Email",
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress
                  ),
                  const SizedBox(height: 10,),
                  MyTextField(
                    borderRadius: 10,
                    controller: passwordController,
                    hintText: "Password",
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.visibility_off,
                    isPassword: true,
                    onPressSuffix: (){
                      //toggle password visibility

                    },
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Spacer(),
                      GestureDetector(
                        onTap: (){},
                        child: Text("Forgot Password?",style: TextStyle(color: Colors.blueAccent),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: (){
                          pageController.animateToPage(
                            1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text("Sign Up",style: TextStyle(color: Colors.blueAccent),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Center(
                      child: customTextButton(
                        context: context,
                        isFilled: true,
                        onTap: (){
                          AuthenticationService().loginWithPassword(
                            context: context,
                            email: emailController.text,
                            password: passwordController.text,
                            isFromWelcomePage: isFromWelcomePage
                          );
                        },
                        buttonName: "Login",
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget signUpScreen({
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController uesenameController,
  required TextEditingController passwordController,
  required TextEditingController confirmPasswordController,
  required PageController pageController,
}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Center(child: Text("Welcome to\nUanimurs !",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))),
      Expanded(
        flex: 2,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyTextField(
                    borderRadius: 10,
                    controller: uesenameController,
                    hintText: "Username",
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.name
                ),
                const SizedBox(height: 10,),
                MyTextField(
                  borderRadius: 10,
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress
                ),
                const SizedBox(height: 10,),
                MyTextField(
                  borderRadius: 10,
                  controller: passwordController,
                  hintText: "Password",
                  isPassword: true,
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 10,),
                MyTextField(
                  borderRadius: 10,
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  isPassword: true,
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: (){
                        pageController.animateToPage(
                          0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text("Login",style: TextStyle(color: Colors.blueAccent),),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: customTextButton(
                      context: context,
                      isFilled: true,
                      onTap: (){
                        if(passwordController.text != confirmPasswordController.text){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match")));
                          return;
                        }
                        AuthenticationService().signUpWithPassword(
                          context: context,
                          email: emailController.text,
                          userName: uesenameController.text,
                          password: passwordController.text,
                          pageControler:  pageController
                        );
                      },
                      buttonName: "Sign Up",
                    ),
                  ),
                )
              ]
            ),
          ),
        )
      )
    ]
  );
}

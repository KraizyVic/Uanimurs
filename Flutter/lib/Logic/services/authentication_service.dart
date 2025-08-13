import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:uanimurs/UI/custom_widgets/widgets.dart';
import 'package:uanimurs/main.dart';

import '../bloc/app_cubit.dart';

class AuthenticationService {
  final SupabaseClient _supabaseClient = Supabase.instance.client; // It's good practice to make this final if it's not reassigned

  // Log in with password
  Future<AuthResponse> loginWithPassword({
    required BuildContext context,
    required String email,
    required String password,
    bool isFromWelcomePage = false
  }) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context)=>AlertDialog(
          backgroundColor: Colors.transparent,
          content: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logging in...",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        )
      );
      final response = await _supabaseClient.auth.signInWithPassword(email: email, password: password);
      if(!context.mounted){
        return response;
      }
      Navigator.pop(context);
      Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
      BlocProvider.of<AppCubit>(context).authState(isLoggedIn: true);
      isFromWelcomePage ? BlocProvider.of<AppCubit>(context).setNotFirstTime() : null;

      return response;
    } on AuthException catch (e) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        snackBar(context: context, message: e.message.toString(),isError: true)
      ); // It's better to use a proper logger in a real app
      rethrow;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('An unexpected error occurred: $e')));
      rethrow; // Or handle it as a generic error
    }
  }

  // Signing up
  Future<AuthResponse> signUpWithPassword({
    required BuildContext context,
    required String email,
    required String userName,
    required String password,
    required PageController pageControler
  }) async {
    // Consider adding similar try-catch error handling here as well
    try {
      final response = await _supabaseClient.auth.signUp(email: email, password: password);
      try {
        await _supabaseClient.from("profiles").insert(
            {
              "user_id": response.user?.id,
              "email":email,
              "user_name": userName,
              "created_at": response.user?.createdAt,
              "pfp_id": 1,
              "is_admin": false,
            }
        );
        if(context.mounted){
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context)=>AlertDialog(
              title: Text("Confirmation"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      "Confirmation message sent to $email, please confirm account and log in"
                  ),
                  Row(
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                          pageControler.previousPage(duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                        },
                        child: Text("Login"),
                      )
                    ],
                  )
                ],
              ),
            )
          );
        }

      }catch(e){
        if(context.mounted){
          ScaffoldMessenger.of(context).showSnackBar(snackBar(context: context, message: "Failed to add user to database",isError: true));
        }
      }
      return response;

    } on AuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar(context: context, message: e.message.toString(),isError: true));
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthResponse> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    return _supabaseClient.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }

  // Logging out
  void logout(BuildContext logoutContext){
    showDialog(
      context: logoutContext,
      builder: (context){
        return AlertDialog(
          title: Text("Log out",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Are you sure you want to log out?"),
              SizedBox(height: 10,),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () async{
                      Navigator.pop(context);
                      try {
                        showDialog(
                            context: logoutContext,
                            barrierDismissible: false,
                            builder: (context)=>AlertDialog(
                              backgroundColor: Colors.transparent,
                              content: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Logging out...",
                                      style: TextStyle(
                                          color: Theme.of(context).colorScheme.tertiary,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                        );
                        await GoogleSignIn().signOut();
                        final response = await _supabaseClient.auth.signOut();
                        if(!logoutContext.mounted){
                          return;
                        }
                        Future.delayed(Duration(seconds: 1));
                        Navigator.pop(logoutContext);
                        BlocProvider.of<AppCubit>(logoutContext).authState(isLoggedIn: false);
                        return response;
                      } catch (e) {
                        rethrow;
                      }
                    },
                    child: Text("Logout"),
                  ),
                ]
              ),
            ],
          )
        );
      }
    );
  }
}
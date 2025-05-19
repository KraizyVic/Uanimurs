import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:uanimurs/main.dart';

import '../bloc/app_cubit.dart';

class AuthenticationService {
  final SupabaseClient _supabaseClient = Supabase.instance.client; // It's good practice to make this final if it's not reassigned

  // Log in with password
  Future<AuthResponse> loginWithPassword({
    required BuildContext context,
    required String email,
    required String password
  }) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(email: email, password: password);
      if(!context.mounted){
        return response;
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
      BlocProvider.of<AppCubit>(context).authState(isLoggedIn: true);
      return response;
    } on AuthException catch (e) {
      // Handle different authentication errors
      // For example, you can check e.message or e.statusCode
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message))); // It's better to use a proper logger in a real app
      // You might want to re-throw the exception or return a custom error response
      // depending on how you want to handle this in your UI.
      // For now, let's re-throw it so the caller can handle it.
      rethrow;
    } catch (e) {
      // Handle any other unexpected errors
      print('An unexpected error occurred: $e');
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
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to add user")));
      }
      print("User Id = ${response.user!.id}");
      return response;

    } on AuthException catch (e) {
      print('Sign Up Error: ${e.message}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString())));
      rethrow;
    } catch (e) {
      print('An unexpected sign up error occurred: $e');
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
  Future<void> logout(BuildContext logoutContext) async {
    try {
      final response = await _supabaseClient.auth.signOut();
      //Navigator.pushReplacement(logoutContext, MaterialPageRoute(builder: (context)=>LoginSignupPage()));
      if(!logoutContext.mounted){
        return;
      }
      BlocProvider.of<AppCubit>(logoutContext).authState(isLoggedIn: false);;
      return response;
    } on AuthException catch (e) {
      print('Logout Error: ${e.message}');
      rethrow;
    } catch (e) {
      print('An unexpected logout error occurred: $e');
      rethrow;
    }
  }
}
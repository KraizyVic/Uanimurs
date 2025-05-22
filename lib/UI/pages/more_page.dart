// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart' show AppCubit;
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Logic/models/supabase_models.dart';
import 'package:uanimurs/Logic/services/authentication_service.dart';
import 'package:uanimurs/Logic/services/supabase_services.dart';
import 'package:uanimurs/UI/pages/auth_page.dart';
import 'package:uanimurs/UI/pages/welcome_page.dart';
import '../../Database/constants.dart';
import '../custom_widgets/pages_items/more_page_items.dart';
import 'more_page_pages/account_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppModel?>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            forceMaterialTransparency: true,
            /*actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,)),
              IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage())), icon: Icon(Icons.logout))
            ],*/
          ),
          body: Column(
            children: [
              Expanded(
                child: state!.isLoggedIn ? StreamBuilder(
                  stream: AccountService().fetchAccount(),
                  builder: (context,snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }
                    if(snapshot.hasError){
                      return Text("Error: ${snapshot.error}");
                    }
                    SupabaseAccountModel account = snapshot.data!;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary.withAlpha(100),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context).colorScheme.primary.withAlpha(100),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 0), // changes position of shadow
                            )
                          ]
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(100),
                                backgroundImage: pfps[account.avatarId] != null ? AssetImage(pfps[account.avatarId]!) : null,
                                child: pfps[account.avatarId] == null ? Icon(Icons.person):null,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(account.username,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                                    Text(account.email),
                                  ],
                                )
                              )
                            ],
                          ),
                          onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage(accountModel: snapshot.data!,))),
                        ),
                      ),
                    );
                  }
                ):Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      //color: Theme.of(context).colorScheme.primary.withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1,
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.primary.withAlpha(50),
                          Theme.of(context).colorScheme.primary.withAlpha(100),
                          Theme.of(context).colorScheme.primary.withAlpha(50),
                        ],
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("My profile", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                                    Text("Log in to manage your account", style: TextStyle(fontSize: 15,)),
                                  ],
                                ),
                              ),
                              Image.asset("lib/Database/assets/hellow.png"),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Spacer(),
                            MaterialButton(
                              onPressed:(){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AuthPage()));
                              },
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              color: Theme.of(context).colorScheme.primary.withAlpha(150),
                              child: Text("Log in"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              FunctionalSettings(),
              Expanded(
                child: Center(
                  child: !state.isLoggedIn ? Container() : ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Log out"),
                    onTap: (){
                      AuthenticationService().logout(context);
                    }//Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage())),
                  ),
                ),
              )
            ],
          )
        );
      }
    );
  }
}

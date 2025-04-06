import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/UI/pages/welcome_page.dart';

import '../../../Logic/bloc/account_cubit.dart';
import '../../../Logic/models/account_model.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            forceMaterialTransparency: true,
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                },
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 5,),
                      Text("Add Account")
                    ],
                  )
              )
            ],
          ),
          body: Center(
            child: Column(
              children: [
                //Text(state?.username ?? ""),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage(context.read<AccountCubit>().activeAccount?.pfp ?? ""),
                      ),
                      SizedBox(height: 10,),
                      Text(context.read<AccountCubit>().activeAccount?.username ?? "",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                ListTile(
                  title: Text("Account Type"),
                  trailing: Text(context.read<AccountCubit>().activeAccount?.accountType ?? ""),
                ),
                ListTile(
                  title: Text("Created"),
                  trailing: Text(context.read<AccountCubit>().activeAccount?.created ?? ""),
                ),
                ListTile(
                  title: Text("Watchlist"),
                  trailing: Text(context.read<AccountCubit>().activeAccount?.watchList.length.toString() ?? 0.toString()),
                ),
                ListTile(
                  title: Text("Watchlist history"),
                  trailing: Text(context.read<AccountCubit>().activeAccount?.watchHistory.length.toString() ?? 0.toString()),
                ),
                ListTile(
                  title: Text("Favourites"),
                  trailing: Text(context.read<AccountCubit>().activeAccount?.favorites.length.toString() ?? 0.toString()),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text("Edit Account"),
                        onTap: () {}
                    ),
                      ListTile(
                        leading: Icon(Icons.clear),
                        title: Text("Clear Account Data"),
                        onTap: () {}
                      ),

                      ListTile(
                        leading: Icon(Icons.delete,color: Colors.red,),
                        title: Text("Delete Account",style: TextStyle(color: Colors.red),),
                        onTap: (){}
                      ),
                    ],
                  ),
                )
              ]
            ),
          ),
        );
      }
    );
  }
}


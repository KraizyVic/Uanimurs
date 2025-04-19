import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/UI/pages/welcome_page.dart';

import '../../../Logic/bloc/account_cubit.dart';
import '../../../Logic/models/account_model.dart';
import '../../custom_widgets/widgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  TextEditingController _deleteControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
      builder: (context,state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
              ),
              IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage())), icon: Icon(Icons.logout))
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
                  title: Text("Watched animes"),
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
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            useSafeArea: true,
                            builder: (context) {
                              return UpdateAccountModal(
                                onUpdate: () async {
                                  await context.read<AccountCubit>().updateAccount();
                                }
                              );
                            },
                          );
                        }
                    ),
                      ListTile(
                        leading: Icon(Icons.clear),
                        title: Text("Clear Account Data"),
                        onTap: () {}
                      ),

                      ListTile(
                        leading: Icon(Icons.delete,color: Colors.red,),
                        title: Text("Delete Account",style: TextStyle(color: Colors.red),),
                        onTap: ()async{
                          showDialog(
                            context: context,
                            builder: (context){
                              return AlertDialog(
                                title: Text("Delete Account ?"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Warning: This action cannot be undone",style: TextStyle(color: Colors.red),),
                                    SizedBox(height: 10,),
                                    Text("Enter username  to confirm deletion"),
                                    const SizedBox(height: 10),
                                    TextField(
                                      controller: _deleteControler,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        hintText: 'Username',
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: (){
                                            Navigator.pop(context);
                                          },
                                          child: Text("Cancel")
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: TextStyle(
                                              color: Theme.of(context).colorScheme.tertiary,
                                            )
                                          ),
                                          onPressed: () async{
                                            if(_deleteControler.text != context.read<AccountCubit>().activeAccount?.username){
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect username")));
                                              return;
                                            }
                                            await context.read<AccountCubit>().deleteAccount();
                                            state.isNotEmpty ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage() )) : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                          },
                                          child: Text("Delete",)
                                        )
                                      ],
                                    ),
                                  ]
                                )

                              );
                            }
                          );
                        }
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


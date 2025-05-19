import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Database/constants.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Logic/models/supabase_models.dart';
import 'package:uanimurs/UI/pages/welcome_page.dart';

import '../../../Logic/bloc/app_cubit.dart';
import '../../custom_widgets/widgets.dart';

class AccountPage extends StatefulWidget {

  final SupabaseAccountModel accountModel;
  const AccountPage({
    super.key,
    required this.accountModel,
  });

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _deleteControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppModel?>(
      builder: (context,state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            forceMaterialTransparency: true,
            actions: [
              //IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage())), icon: Icon(Icons.logout))
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
                        backgroundImage: pfps[widget.accountModel.avatarId] != null ? AssetImage(pfps[widget.accountModel.avatarId]!) : null,
                        child: pfps[widget.accountModel.avatarId] == null ? Icon(Icons.person,size: 70,) : null,
                      ),
                      SizedBox(height: 10,),
                      Text(widget.accountModel.username,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                ListTile(
                  title: Text("Email"),
                  trailing: Text(widget.accountModel.email),
                ),
                ListTile(
                  title: Text("Created at"),
                  trailing: Text("${widget.accountModel.createdAt?.day} / ${widget.accountModel.createdAt?.month} / ${widget.accountModel.createdAt?.year}"),
                ),
                ListTile(
                  title: Text("Watchlist"),
                  trailing: Text("${widget.accountModel.watchListCount}"),
                ),
                ListTile(
                  title: Text("Watched animes"),
                  trailing: Text("${widget.accountModel.watchHistoryCount}"),
                ),
                ListTile(
                  title: Text("Favourites"),
                  trailing: Text("${widget.accountModel.favoritesCount}"),
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
                              return Padding(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                child: SingleChildScrollView(
                                  child: UpdateAccountModal(
                                    onUpdate: (){},
                                    accountModel: widget.accountModel,
                                  ),
                                ),
                              );
                            },
                          );
                        }
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
                                            /*if(_deleteControler.text != context.read<AccountCubit>().activeAccount?.username){
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect username")));
                                              return;
                                            }
                                            await context.read<AccountCubit>().deleteAccount();
                                            state.isNotEmpty ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage() )) : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RegistrationPage()));*/
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



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';
import 'package:uanimurs/Logic/models/supabase_models.dart';
import 'package:uanimurs/Logic/services/supabase_services.dart';

import '../../Logic/models/ani_watch_model.dart';
import '../../Logic/models/anime_model.dart';
import '../../Logic/models/app_model.dart';
import '../../Database/constants.dart';
import '../../Logic/models/watch_history.dart';
import '../../Logic/services/aniwatch_services.dart';
import '../pages/auth_page.dart';
import '../pages/buffer_page.dart';

class UpdateAccountModal extends StatefulWidget {
  final VoidCallback onUpdate;
  final SupabaseAccountModel accountModel;
  const UpdateAccountModal({super.key, required this.onUpdate, required this.accountModel});

  @override
  State<UpdateAccountModal> createState() => _UpdateAccountModalState();
}

class _UpdateAccountModalState extends State<UpdateAccountModal> {
  late String tempUsername;
  String? tempPfp;
  int selectedPfpIndex = -1;
  TextEditingController? _usernameController;

  @override
  void initState() {
    super.initState();
    // Initialize from the BloC
    final activeAccount = widget.accountModel;
    tempUsername = activeAccount.username;
    tempPfp = pfps[activeAccount.avatarId];
    selectedPfpIndex = pfps.indexOf(tempPfp);
    _usernameController = TextEditingController(text: tempUsername);
  }

  @override
  void dispose() {
    _usernameController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppModel?>(
      builder: (context,state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Update Account', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: tempPfp != null ? AssetImage(tempPfp!) : null,
                      child: tempPfp == null ? Icon(Icons.person,size: 50,) : null,
                    ),
                    SizedBox(height: 10,),
                    Text(tempUsername,style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text("Enter a new username",style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Enter your username',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear,),
                    onPressed: () {
                      _usernameController?.clear();
                    },
                  )
                ),
                controller: _usernameController,
                onChanged: (value)=>setState(() {tempUsername = value;}),
              ),
              const SizedBox(height: 10),
              Text('Select Profile Picture', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pfps.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPfpIndex = index;
                          tempPfp = pfps[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: pfps[index] != null ? AssetImage(pfps[index]!) : null,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selectedPfpIndex == index ? Colors.black26: null,
                            ),
                            child: Center(
                              child: Stack(
                                children: [
                                  ?pfps[index] == null ? Icon(Icons.person,size: 50,): null,
                                  ?selectedPfpIndex == index ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary,size: 50,) : null,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    onPressed: (){
                      AccountService().updateAccount(
                        context: context,
                        account: widget.accountModel.copyWith(username: tempUsername,avatarId: selectedPfpIndex)
                      );
                      //Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      }
    );
  }
}

class MyTextField extends StatefulWidget {
  final bool?autofocus;
  final double? borderRadius;
  final bool? isPassword;
  final VoidCallback? onPressSuffix;
  final VoidCallback? onChanged;
  final VoidCallback? onSubmit;
  final TextEditingController controller;
  final String hintText;
  final IconData?suffixIcon;
  final IconData?prefixIcon;
  final TextInputType? keyboardType;

  const MyTextField({
    super.key,
    this.autofocus,
    this.borderRadius,
    this.isPassword,
    this.onPressSuffix,
    this.onChanged,
    this.onSubmit,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      autofocus: widget.autofocus ?? false,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ?? false ? !showPassword : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 20.0),
        ),
        prefixIcon: Icon(widget.prefixIcon,size: 20,color: Theme.of(context).colorScheme.tertiary.withAlpha(150),),
        suffixIcon: IconButton(
          icon: widget.isPassword ?? false ? showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off) : Icon(widget.suffixIcon),
          onPressed: widget.isPassword ?? false ? (){
            setState(() {
              showPassword = !showPassword;
            });
          }:widget.onPressSuffix,
        ),
      ),
      onChanged: (value){},
      onSubmitted: (value){},
    );
  }
}

Widget loginTile({
  required BuildContext context,
  String? title,
  String? body,
}){
  return Padding(
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
                      Text(title ?? "Log in to manage your account", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      Text(body ?? "Log in to manage your account", style: TextStyle(fontSize: 15,)),
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
  );
}

void showEpisodeModal({
  required BuildContext context,
  required Future<Episodes> episodes,
  required Anime anime,
  required AnimeModel animeModel,
  required WatchHistory? watchHistory,

}){
  showModalBottomSheet(
      context: context,
      //backgroundColor: Colors.blue[100],
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      enableDrag: true,
      useSafeArea: true,
      builder: (context){
        return SizedBox(
            height: MediaQuery.of(context).size.height*0.35,
            child: Center(
              child: FutureBuilder(
                future: episodes,
                builder: (context,snapshot){
                  if (snapshot.hasData){
                    Future servers = Future.delayed(Duration(seconds: 2),()=>AniWatchService().getServers(snapshot.data!.episodes[watchHistory!.watchingEpisode!-1].episodeId));
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text("SERVERS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Theme.of(context).colorScheme.primary),),
                        ),
                        Expanded(
                          child: Center(
                            child: FutureBuilder(
                              future: servers,
                              builder: (context,serverSnapshot){
                                if(serverSnapshot.hasData){
                                  return ListView.builder(
                                    itemCount: serverSnapshot.data!.sub.length,
                                    itemBuilder: (context,index){
                                      int watchedEpisode = watchHistory!.watchingEpisode! - 1;
                                      return ListTile(
                                        onTap: (){
                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BufferPage(
                                            episodeId: serverSnapshot.data!.episodeId,
                                            serverName: serverSnapshot.data!.sub[index].serverName=="vidsrc" ? "vidstreaming" : serverSnapshot.data!.sub[index].serverName,
                                            type: "sub",
                                            episodeNumber: watchedEpisode ,
                                            episodes: snapshot.data!,
                                            anime: anime,
                                            animeModel: animeModel,
                                            watchHistory: watchHistory,
                                            isInWatchHistory: true,
                                            isContinuePress: true,
                                          )));
                                        },
                                        title: Text(
                                          serverSnapshot.data!.sub[index].serverName,
                                          style: TextStyle(
                                            color: Theme.of(context).colorScheme.primary.withAlpha(index != unresponsiveServer ? 255 : 150),
                                          ),
                                        ),
                                        subtitle: Text(
                                            "Multi Quality",
                                            style: TextStyle(
                                                color: Theme.of(context).colorScheme.tertiary.withAlpha(index != unresponsiveServer ? 255 : 150)
                                            )
                                        ),
                                        trailing: Text(
                                          index != unresponsiveServer ? "Active" : "Inactive",
                                          style: TextStyle(
                                            color: index != unresponsiveServer ? Colors.green : Colors.red,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }else if(serverSnapshot.hasError){
                                  print(snapshot.stackTrace);
                                  return Center(child: Text("Error loading SERVER list"),);
                                }else{
                                  return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(),
                                        SizedBox(height: 15,),
                                        Text("Loading Servers ...")
                                      ]
                                  );
                                }
                              }
                            ),
                          ),
                        ),
                      ],
                    );
                  }else if(snapshot.hasError){
                    return Center(child: Text("Error loading EPISODES list"),);
                  }else{
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 15,),
                        Text("Loading Episode ...")
                      ],
                    );
                  }
                },
              ),
            )
        );
      }
  );
}

SnackBar snackBar({
  required BuildContext context,
  required String message,
  bool? isError,
}){
  return SnackBar(
    content: Center(child: Text(message)),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    behavior: SnackBarBehavior.floating,
    backgroundColor: isError ?? false ? Colors.red : Theme.of(context).colorScheme.primary,
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/UI/pages/home_page.dart';
import 'package:uanimurs/constants.dart';

import '../../Logic/bloc/account_cubit.dart';
import '../../main.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              "lib/UI/assets/in_a_hall_looking_at_screen.webp",
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surface.withAlpha(70),
                  Theme.of(context).colorScheme.surface.withAlpha(255),
                ],
                begin: Alignment(0, -0.5),
                end: Alignment(0, 0.7),
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Uanimurs", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("Home of Anime", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5,),
                      //SizedBox(width: MediaQuery.of(context).size.width * 0.5, child: LinearProgressIndicator()),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: MaterialButton(
                  onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RegistrationPage())),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  elevation: 0,
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Theme.of(context).colorScheme.onPrimary,
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,),
                      child: Center(child: Text("Get started")),
                    ),
                  ),),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController username = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(pfps.length);
  }

  int _selectedPfpIndex = 0;

  void _selectPfp(int index){
    setState(() {
      _selectedPfpIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Text("WELCOME TO UANIMURS!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary),),
                    SizedBox(height: 10,),
                    /*Text("We are glad to have you here"),
                    SizedBox(height: 20,),*/
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: pfps[_selectedPfpIndex] == null ? Container(color: Theme.of(context).colorScheme.primary.withAlpha(50),child: Icon(Icons.person,size: 50,)) : Image.asset(pfps[_selectedPfpIndex]!,fit: BoxFit.cover,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Text("What should we call you?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 10,),
              TextField(
                controller: username,
                textCapitalization: TextCapitalization.sentences,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Username",
                  filled: true,
                  focusColor: Theme.of(context).colorScheme.primary,
                  fillColor: Colors.white.withAlpha(50),
                ),

              ),
              SizedBox(height: 10,),
              Text("Choose Profile Picture",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              SizedBox(height: 10,),
              Expanded(
                flex: 2,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5
                  ),
                  itemCount: pfps.length,
                  itemBuilder: (context,index){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: MaterialButton(
                        //focusNode: _selectedPfpIndex == index ? FocusNode() : null,
                        padding: EdgeInsets.all(0),
                        onPressed:()=> _selectPfp(index),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                        child: Stack(
                          children: [
                            Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.white.withAlpha(50),
                                shape: BoxShape.circle,
                              ),
                              child: pfps[index] == null ? Icon(Icons.person) : Image.asset(pfps[index]!,fit: BoxFit.cover,),
                            ),
                            _selectedPfpIndex == index ? Container(
                              height: double.maxFinite,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.check,color: Theme.of(context).colorScheme.primary,),
                            ) : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              Expanded(
                child: Center(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.primary,
                    onPressed: () async{
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (_) => Center(child: CircularProgressIndicator()),
                      );
                      await context.read<AccountCubit>().createAccount(username.text,pfps[_selectedPfpIndex],);
                      Navigator.pop(context);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainPage()));
                    },
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: SizedBox(width: double.maxFinite, child: Text("Continue",textAlign: TextAlign.center,)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


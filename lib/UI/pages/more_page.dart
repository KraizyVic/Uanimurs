import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart' show AccountCubit, AppCubit;
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/UI/pages/welcome_page.dart';
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
            /*actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined,)),
              IconButton(onPressed: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage())), icon: Icon(Icons.logout))
            ],*/
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.red,
                      ),
                      title: Text("Null"),
                      subtitle: Text("Null"),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage())),
                    ),
                  ),
                ),
              ),
              FunctionalSettings(),
              Expanded(
                child: Center(
                  child: ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Log out"),
                    onTap: (){}//Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage())),
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

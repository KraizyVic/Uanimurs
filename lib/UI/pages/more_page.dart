import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/UI/pages/welcome_page.dart';

import '../../Logic/bloc/account_cubit.dart' show AccountCubit;
import '../../Logic/models/account_model.dart';
import '../custom_widgets/more_page_items.dart';
import 'more_page_pages/account_page.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
      builder: (context,state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("More"),
            forceMaterialTransparency: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListTile(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      leading: context.read<AccountCubit>().activeAccount?.pfp != null ? CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(context.read<AccountCubit>().activeAccount?.pfp ?? ""),): CircleAvatar(child: Icon(Icons.person),
                      ),
                      title: Text(context.read<AccountCubit>().activeAccount?.username ?? ""),
                      subtitle: Text(context.read<AccountCubit>().activeAccount?.accountType ?? ""),
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
                    onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SelectAccountPage())),
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

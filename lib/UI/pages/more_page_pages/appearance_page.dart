
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/models/app_model.dart';
import 'package:uanimurs/Database/constants.dart';

import '../../../Logic/bloc/app_cubit.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit,AppModel?>(
        builder: (context,state) {
          int selectedColorIndex = appColors.values.toList().indexOf(state!.settings.appearance.primaryColor);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                scrolledUnderElevation: 0,
                surfaceTintColor: Colors.transparent,
                shadowColor: Colors.transparent,
                elevation: 0,
                backgroundColor: Theme.of(context).colorScheme.surface,
                expandedHeight: MediaQuery.of(context).size.height * 0.3,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Appearance"),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RadioListTile(
                      value: 0, // Light Theme
                      groupValue: state.settings.appearance.themeMode,
                      //groupValue: 1,
                      onChanged: (value) {
                        context.read<AppCubit>().updateThemeMode(value!);
                      },
                      title: const Text('System'),
                    ),
                    RadioListTile(
                      value: 1, // Light Theme
                      groupValue: state.settings.appearance.themeMode,
                      //groupValue: 1,
                      onChanged: (value) {
                        context.read<AppCubit>().updateThemeMode(value!);
                      },
                      title: const Text('Light Mode'),
                    ),
                    RadioListTile(
                      value: 2, // Light Theme
                      groupValue: state.settings.appearance.themeMode,
                      //groupValue: 1,
                      onChanged: (value) {
                        context.read<AppCubit>().updateThemeMode(value!);
                      },
                      title: const Text('Dark Mode'),
                    ),
                    SwitchListTile(
                        title: Text('Amoled Background',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                        subtitle: const Text('Enable Amoled Background'),
                        value: state.settings.appearance.amoledBackground,
                        onChanged: (value){
                          context.read<AppCubit>().updateAmoledBackground(value);
                        }
                    ),
                    SwitchListTile(
                        title: Text('Use Material UI',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                        subtitle: const Text('Enable Material UI'),
                        value: state.settings.appearance.useMaterialUI,
                        onChanged: (value){
                          //context.read<AppCubit>().setNotFirstTime(value);
                          context.read<AppCubit>().useMaterialUI(value);
                        }
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: appColors.length,
                  (context,index){
                    return ListTile(
                      onTap: (){
                        /*context.read<AccountCubit>().updateSettings((settings) {
                          settings.appearance = settings.appearance.copyWith(primaryColor: appColors.values.elementAt(index));
                        });*/
                        context.read<AppCubit>().updatePrimaryColor(appColors.values.elementAt(index));
                      },
                      title: Text(appColors.keys.elementAt(index)),
                      leading: CircleAvatar(
                        backgroundColor: Color(appColors.values.elementAt(index)),
                      ),
                      trailing: selectedColorIndex == index ? Icon(Icons.check,color: Theme.of(context).colorScheme.primary,) : null,
                    );
                  }
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 50,),
              )
            ]
          );
        }
      ),
    );
  }
}

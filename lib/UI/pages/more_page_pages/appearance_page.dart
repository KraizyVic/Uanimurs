
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/constants.dart';

import '../../../Logic/bloc/account_cubit.dart';
import '../../../Logic/models/account_model.dart';

class AppearancePage extends StatefulWidget {
  const AppearancePage({super.key});

  @override
  State<AppearancePage> createState() => _AppearancePageState();
}

class _AppearancePageState extends State<AppearancePage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: BlocBuilder<AccountCubit,List<AccountModel?>>(
            builder: (context,state) {
              int selectedColorIndex = appColors.values.toList().indexOf(context.watch<AccountCubit>().activeAccount!.settings.appearance.primaryColor);
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
                          groupValue: context.watch<AccountCubit>().activeAccount!.settings.appearance.themeMode,
                          onChanged: (value) {
                            context.read<AccountCubit>().updateThemeMode(value!);
                          },
                          title: const Text('System'),
                        ),
                        RadioListTile(
                          value: 1, // Light Theme
                          groupValue: context.watch<AccountCubit>().activeAccount!.settings.appearance.themeMode,
                          onChanged: (value) {
                            context.read<AccountCubit>().updateThemeMode(value!);
                          },
                          title: const Text('Light Mode'),
                        ),
                        RadioListTile(
                          value: 2, // Light Theme
                          groupValue: context.watch<AccountCubit>().activeAccount!.settings.appearance.themeMode,
                          onChanged: (value) {
                            context.read<AccountCubit>().updateThemeMode(value!);
                          },
                          title: const Text('Dark Mode'),
                        ),
                        SwitchListTile(
                            title: Text('Amoled Background',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                            subtitle: const Text('Enable Amoled Background'),
                            value: context.watch<AccountCubit>().activeAccount!.settings.appearance.amoledBackground,
                            onChanged: (value){
                              context.read<AccountCubit>().updateSettings((settings) {
                                settings.appearance = settings.appearance.copyWith(amoledBackground: value);
                              });
                            }
                        ),
                        SwitchListTile(
                            title: Text('Use Material UI',style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                            subtitle: const Text('Enable Material UI'),
                            value: context.watch<AccountCubit>().activeAccount!.settings.appearance.useMaterialUI,
                            onChanged: (value){
                              context.read<AccountCubit>().updateSettings((settings) {
                                settings.appearance = settings.appearance.copyWith(useMaterialUI: value);
                              });
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
                            context.read<AccountCubit>().updateSettings((settings) {
                              settings.appearance = settings.appearance.copyWith(primaryColor: appColors.values.elementAt(index));
                            });
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
    );
  }
}

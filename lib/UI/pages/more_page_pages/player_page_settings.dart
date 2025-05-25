import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/app_cubit.dart';

import '../../../Logic/models/app_model.dart';

class PlayerPageSettings extends StatefulWidget {
  const PlayerPageSettings({super.key});

  @override
  State<PlayerPageSettings> createState() => _PlayerPageSettingsState();
}

class _PlayerPageSettingsState extends State<PlayerPageSettings> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppModel?>(
      builder: (context,state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200,
                scrolledUnderElevation: 0,
                backgroundColor: Theme.of(context).colorScheme.surface,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Player Settings"),
                )
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Skip Duration:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
                          Text("${(state!.settings.player.skipDuration * 100).toInt()} Seconds"),
                        ],
                      ),
                      Slider(
                        divisions: 10,
                        padding: EdgeInsets.all(10),
                        value: state.settings.player.skipDuration.toDouble(),
                        onChanged: (value){
                          context.read<AppCubit>().updateSkipDuration(value);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mega Skip Duration:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
                          Text("${(state.settings.player.megaSkipDuration * 500).toInt()} Seconds"),
                        ],
                      ),
                      Slider(
                        divisions: 10,
                        padding: EdgeInsets.all(10),
                        value: state.settings.player.megaSkipDuration.toDouble(),
                        onChanged: (value){
                          context.read<AppCubit>().updateMegaSkipDuration(value);
                        },
                      ),
                      SwitchListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                        title: Text("Auto Play:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
                        subtitle: Text("Next video plays when one ends"),
                        value: state.settings.player.autoPlay,
                        onChanged: (value){
                          context.read<AppCubit>().updateAutoPlay(value);
                        }
                      ),
                      SwitchListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                        title: Text("Skip Intro/Outro:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.primary)),
                        subtitle: Text("Skip intro and outro of video (UNREFINED)"),
                        value: state.settings.player.skipItroOutro,
                        onChanged: (value){
                          context.read<AppCubit>().updateSkipItroOutro(value);
                        }
                      ),
                    ]
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

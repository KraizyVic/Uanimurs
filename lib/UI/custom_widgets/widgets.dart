
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uanimurs/Logic/bloc/account_cubit.dart';
import 'package:uanimurs/Logic/models/account_model.dart';

import '../../constants.dart';

class UpdateAccountModal extends StatefulWidget {
  final VoidCallback onUpdate;
  const UpdateAccountModal({super.key, required this.onUpdate});

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
    final activeAccount = context.read<AccountCubit>().activeAccount;
    tempUsername = activeAccount?.username ?? "";
    tempPfp = activeAccount?.pfp;
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
    return BlocBuilder<AccountCubit,List<AccountModel?>>(
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
                      backgroundImage: AssetImage(tempPfp ?? ""),
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
                              child:  selectedPfpIndex == index ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary,size: 50,) : null,
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
                    onPressed: () async {
                      await context.read<AccountCubit>().updateAccount(pfp: tempPfp,username: tempUsername);
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        );
      }
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:user_appwork2/views/user_list_view.dart';

import '../models/user_model.dart';

class EditUserView extends StatelessWidget {
  
  final UserModel user;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  EditUserView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit User'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText:'Name'
              ),
            ),
            const SizedBox(height: 16,),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText:'Email'
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const UserListView()));
            }, 
            child: const Text('Edit')),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.orange,
        height: 15,
        child: Center(child: Text("Created by gusty.webid", 
        style: TextStyle(fontSize: 10),
          )
        ),
      ),
    );
  }
}

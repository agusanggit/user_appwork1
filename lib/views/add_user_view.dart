import 'package:flutter/material.dart';
import 'package:user_appwork2/views/user_list_view.dart';

class AddUserView extends StatelessWidget {
  AddUserView({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
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
            child: const Text('Save')),
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
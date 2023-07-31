import 'package:flutter/material.dart';
import 'package:user_appwork2/views/add_user_view.dart';


class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('User List')
      ),
      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.orangeAccent,
          height: 120,
          child: Column(children: [
            const Padding(padding: EdgeInsets.all(8)),
            const Text('Name'),
            const Text('email'),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserView(user: UserModel(user ,)));
                }, child: const Text('Edit')),
                const SizedBox(width: 30,),
                ElevatedButton(onPressed: (){
                  showDialog(
                    context: context, 
                    builder: (BuildContext context){
                    return AlertDialog(
                      title: const Text('Delete User'),
                      content: const Text('Are you sure you want to delete thiss user?'),
                      actions: [
                        TextButton(onPressed:(){
                          Navigator.pop(context);
                        }, child: const Text('Cancel'),),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: const Text('Delete')),
                      ],
                    );
                  });
                }, child: const Text('Delete')),
              ],
            )
          ],)
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserView()));
      },
      backgroundColor: Colors.orangeAccent,
      child: const Icon(Icons.add),),
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
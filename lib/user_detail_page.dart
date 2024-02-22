import 'package:database_practical/user_list_page.dart';
import 'package:flutter/material.dart';
import 'user_model.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
      ),
      body: Card(


        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Card(
                color: Colors.blueGrey,
                child: Column(

                  children: [
                    const Padding(padding: EdgeInsets.all(10.0)),
                    Text('Name: ${user.name}', style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),


                    ),
                    Text(user.number , style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 25

                    ),
                    ),
                    Text(user.gender ,
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(

                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserListPage(),
                    ),
                  );

                },

                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

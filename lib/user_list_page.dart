import 'package:flutter/material.dart';
import 'add_user_page.dart';
import 'user_model.dart';
import 'user_repository.dart';
import 'update_user_page.dart';
import 'user_detail_page.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: FutureBuilder<List<User>>(
        future: userRepository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<User> users = snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.5),
                  child: Card(
                    color: Colors.purple[100],
                    elevation: 20, // Adjust the elevation as needed
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(25.0),
                      // Set your desired border radius
                    ),
                    child: ListTile(
                      title: Center(
                        child: Text(
                          '${users[index].id}) ${users[index].name}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      subtitle: Center(
                        child: Text(
                          '${users[index].number}\nGender-${users[index].gender}',
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 23,

                          ),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return AlertDialog(
                              title: const Text('Choose Action'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UpdateUserPage(user: users[index]),
                                      ),
                                    ).then((_) {
                                      setState(() {});
                                    });
                                  },
                                  child: const Text('Update'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(dialogContext);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserDetailPage(user: users[index]),
                                      ),
                                    );
                                  },
                                  child: const Text('Detail'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddUserPage(),
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

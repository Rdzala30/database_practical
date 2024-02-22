import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_repository.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  String selectedGender = '';

  final UserRepository userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(labelText: 'Number'),
            ),
            const SizedBox(height: 16.0),
            const Text('Gender:'),
            Row(
              children: [
                Radio<String>(
                  value: 'Male',
                  groupValue: selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value ?? '';
                    });
                  },
                ),
                const Text('Male'),
                Radio<String>(
                  value: 'Female',
                  groupValue: selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value ?? '';
                    });
                  },
                ),
                const Text('Female'),
                Radio<String>(
                  value: 'Other',
                  groupValue: selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value ?? '';
                    });
                  },
                ),
                const Text('Other'),
              ],
            ),
            const SizedBox(height: 26.0),
            ElevatedButton(
              onPressed: () async {

                User newUser = User(
                  name: nameController.text,
                  number: numberController.text,
                  gender: selectedGender,
                );

                await userRepository.insertUser(newUser);
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

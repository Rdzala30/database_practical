import 'package:flutter/material.dart';
import 'user_model.dart';
import 'user_repository.dart';

class UpdateUserPage extends StatefulWidget {
  final User user;

  const UpdateUserPage({super.key, required this.user});

  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  String selectedGender = '';

  final UserRepository userRepository = UserRepository();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.name;
    numberController.text = widget.user.number;
    selectedGender = widget.user.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update User'),
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                User updatedUser = User(
                  id: widget.user.id,
                  name: nameController.text,
                  number: numberController.text,
                  gender: selectedGender,
                );

                await userRepository.updateUser(updatedUser);
                  Navigator.pop(context);
              },
              child: const Text('Update'),
            ),
            const SizedBox(height: 16.0),

            Padding(
              padding: const EdgeInsets.only(top:17.0),
              child: ElevatedButton(

                onPressed: () async {
                  // Delete the user
                  await userRepository.deleteUser(widget.user.id!);
                   Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Icon( Icons.delete , size: 45, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

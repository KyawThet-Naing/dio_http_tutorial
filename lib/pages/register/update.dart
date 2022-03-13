import 'package:dio_demo/api/api.dart';
import 'package:dio_demo/models/user_model.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  final UserModel user;

  static const String route = "/update";
  const Update({Key? key, required this.user}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late TextEditingController nameController;
  late TextEditingController ageController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.user.name);
    ageController = TextEditingController(text: '${widget.user.age}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                controller: nameController,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Age'),
                ),
                controller: ageController,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String name = nameController.text.trim();
                  String age = ageController.text.trim();

                  if (name.isEmpty || age.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid data')),
                    );

                    ///return
                    return;
                  }
                  bool bol = await API.userUpdateByDio(
                    name: name,
                    age: age,
                    id: widget.user.id!,
                  );

                  if (bol) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Update Success')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fail')),
                    );
                  }
                },
                child: const Text('Update'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

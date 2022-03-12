import 'package:dio_demo/api/api.dart';
import 'package:dio_demo/models/user_model.dart';
import 'package:dio_demo/pages/register/register.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String route = "/";
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModel> users = [];

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    List<UserModel>? userList = await API.getUserByDio();
    if (userList != null) {
      setState(() => users = userList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text(
          "Add User",
        ),
        onPressed: () {
          Navigator.pushNamed(context, Register.route);
        },
      ),
      body: users.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(users[index].name ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      String userId = users[index].id ?? '';
                      bool bol = await API.deleteUserByDio(id: userId);
                      if (bol) {
                        getUser();
                      } else {
                        print("delete failed");
                      }
                    },
                  ),
                ),
              ),
            ),
    );
  }
}

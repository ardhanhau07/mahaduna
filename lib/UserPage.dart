import 'package:flutter/material.dart';
import 'models/user.dart';
import 'services/userService.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserService _service = UserService();
  List<User> _UserList = [];

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    try {
      final data = await _service.getAllUser();
      setState(() {
        _UserList = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _tambahUser() async {
    final newUser =
        User(idUser: 123, nim: '220605110039', password: 'gtasa2004');
    await _service.tambahUser(newUser);
    _loadUser();
  }

  Future<void> _hapusUser(int idUser) async {
    await _service.hapusUser(idUser);
    _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text('Data Muncul'),
              Expanded(
                child: ListView.builder(
                  itemCount: _UserList.length,
                  itemBuilder: (context, index) {
                    final user = _UserList[index];
                    return ListTile(
                      title: Text(user.nim),
                      subtitle: Text(user.password),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _hapusUser(user.idUser),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

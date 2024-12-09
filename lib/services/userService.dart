import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mahaduna/services/config.dart';
import '../models/user.dart';

class UserService {
  final String baseUrl =
      Config.baseUrl+'restful-json-mahad/server/server.php';

  // Ambil Semua Data
  Future<List<User>> getAllUser() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      // Parsing JSON menjadi List<User>
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => User.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Tambah Data
  Future<void> tambahUser(User User) async {
    final jsonBody = json.encode({
      'idUser': User.idUser,
      'nim': User.nim,
      'password': User.password,
      'aksi': 'tambah',
    });

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menambah data');
    }
  }

  // Edit Data
  Future<void> editUser(User User) async {
    final jsonBody = json.encode({
      'idUser': User.idUser,
      'nim': User.nim,
      'password': User.password,
      'aksi': 'edit',
    });

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal mengedit data');
    }
  }

  // Hapus Data
  Future<void> hapusUser(int idUser) async {
    final jsonBody = json.encode({
      'id_User': idUser,
      'aksi': 'hapus',
    });

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal menghapus data');
    }
  }
}

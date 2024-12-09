import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mahaduna/services/config.dart';
import '../models/Kerusakan.dart';

class KerusakanService {
  final String baseUrl = Config.baseUrl + 'restful-json-mahad/server/server.php';

  // Ambil Semua Data
  Future<List<Kerusakan>> getAllKerusakan() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      // Parsing JSON menjadi List<Kerusakan>
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Kerusakan.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Tambah Data
  Future<void> tambahKerusakan(Kerusakan Kerusakan) async {
    final jsonBody = json.encode({
      'idKerusakan': Kerusakan.idKerusakan,
      'idMabna': Kerusakan.idMabna,
      'kamar': Kerusakan.kamar,
      'lantai': Kerusakan.lantai,
      'gambar': Kerusakan.gambar,
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
  Future<void> editKerusakan(Kerusakan Kerusakan) async {
    final jsonBody = json.encode({
     'idKerusakan': Kerusakan.idKerusakan,
      'idMabna': Kerusakan.idMabna,
      'kamar': Kerusakan.kamar,
      'lantai': Kerusakan.lantai,
      'gambar': Kerusakan.gambar,
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
  Future<void> hapusKerusakan(String idKerusakan) async {
    final jsonBody = json.encode({
      'id_Kerusakan': idKerusakan,
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

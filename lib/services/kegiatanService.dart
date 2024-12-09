import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mahaduna/services/config.dart';
import '../models/kegiatan.dart';

class KegiatanService {
  final String baseUrl = Config.baseUrl + 'restful-json-mahad/server/serverKegiatan.php';

  // Ambil Semua Data
  Future<List<Kegiatan>> getAllKegiatan() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      // Parsing JSON menjadi List<Kegiatan>
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Kegiatan.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data');
    }
  }

  // Tambah Data
  Future<void> tambahKegiatan(Kegiatan Kegiatan) async {
    final jsonBody = json.encode({
      'idKegiatan': Kegiatan.idKegiatan,
      'nama': Kegiatan.nama,
      'deskripsi': Kegiatan.deskripsi,
      'waktu': Kegiatan.waktu,
      'tanggal': Kegiatan.tanggal,
      'gambar': Kegiatan.gambar,
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
  Future<void> editKegiatan(Kegiatan Kegiatan) async {
    final jsonBody = json.encode({
      'idKegiatan': Kegiatan.idKegiatan,
      'nama': Kegiatan.nama,
      'deskripsi': Kegiatan.deskripsi,
      'waktu': Kegiatan.waktu,
      'tanggal': Kegiatan.tanggal,
      'gambar': Kegiatan.gambar,
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
  Future<void> hapusKegiatan(int idKegiatan) async {
    final jsonBody = json.encode({
      'id_Kegiatan': idKegiatan,
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

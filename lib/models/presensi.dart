class Presensi {
  final int idPresensi;
  final int idUser;
  final String tanggal;
  final String gambar;
  final String lokasi;


  // Konversi dari Json ke objek
  factory Presensi.fromJson(Map<String, dynamic> Json) {
    return Presensi(
      idPresensi: Json['idPresensi'],
      idUser: Json['idUser'],
      tanggal: Json['tanggal'],
      gambar: Json['gambar'],
      lokasi: Json['lokasi'],
    );
  }

  Presensi({required this.idPresensi, required this.idUser, required this.tanggal, required this.gambar, required this.lokasi});

  // Konversi ke Json
  Map<String, dynamic> toJson() {
    return {
      'idPresensi': idPresensi,
      'idUser': idUser,
      'tanggal': tanggal,
      'gambar': gambar,
      'lokasi': lokasi,
    };
  }
}

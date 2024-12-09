class Izin {
  final String idUser;
  final String idKegiatan;
  final String jenis;
  final String deksripsi;
  final String gambar;

  // Konversi dari Json ke objek
  factory Izin.fromJson(Map<String, dynamic> Json) {
    return Izin(
      idUser: Json['idUser'],
      idKegiatan: Json['idKegiatan'],
      jenis: Json['jenis'],
      deksripsi: Json['deksripsi'],
      gambar: Json['gambar'],
    );
  }

  Izin({
    required this.idUser,
    required this.idKegiatan,
    required this.jenis,
    required this.deksripsi,
    required this.gambar,
  });

  // Konversi ke Json
  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'idKegiatan': idKegiatan,
      'jenis': jenis,
      'deksripsi': deksripsi,
      'gambar': gambar,
    };
  }
}

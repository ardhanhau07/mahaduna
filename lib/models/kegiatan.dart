class Kegiatan {
  final int idKegiatan;
  final String nama;
  final String deskripsi;
  final String waktu;
  final String tanggal;
  final String gambar;


  // Konversi dari Json ke objek
  factory Kegiatan.fromJson(Map<String, dynamic> Json) {
    return Kegiatan(
      idKegiatan: Json['idKegiatan'],
      nama: Json['nama'],
      deskripsi: Json['deskripsi'],
      waktu: Json['waktu'],
      tanggal: Json['tanggal'],
      gambar: Json['gambar']
    );
  }

  Kegiatan({required this.idKegiatan, required this.nama, required this.deskripsi, required this.waktu, required this.tanggal, required this.gambar});

  // Konversi ke Json
  Map<String, dynamic> toJson() {
    return {
      'idKegiatan': idKegiatan,
      'nama': nama,
      'deskripsi': deskripsi,
      'waktu': waktu,
      'tanggal': tanggal,
      'gambar': gambar,
    };
  }
}

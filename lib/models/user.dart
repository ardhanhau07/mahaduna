class User {
  final int idUser;
  final String nim;
  final String password;

  User({required this.idUser, required this.nim, required this.password});

  // Konversi dari JSON ke objek
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['idUser'],
      nim: json['nim'],
      password: json['password'],
    );
  }

  // Konversi ke XML
  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'nim': nim,
      'password': password,
    };
  }
}

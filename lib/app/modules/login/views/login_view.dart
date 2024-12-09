import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahaduna/app/data/constants.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../rootpage.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 143, bottom: 49, left: 20, right: 20),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Mengatur agar semua elemen dimulai dari kiri
              children: [
                // Logo
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.asset('assets/images/LogoMahad.png'),
                ),
                const SizedBox(height: 20),

                // Teks Selamat Datang
                const Text(
                  'Selamat Datang 👋',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                // Teks di Ma'haduna
                Text(
                  "di Ma'haduna",
                  style: TextStyle(
                    color: Constants.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 20),

                // Teks Halo
                const Text(
                  'Halo, silakan masuk untuk melanjutkan',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 20),

                // TextField Placeholder
                const TextField(
                 
                  decoration: InputDecoration(
                    labelText: 'Username', // Contoh label untuk TextField
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password', // Contoh label untuk TextField
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                          onPressed: null, icon: Icon(Icons.remove_red_eye))),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 250),
                  child: TextButton(
                      onPressed: null,
                      child: Text(
                        'Lupa Password',
                        style: TextStyle(color: Colors.purple),
                      )),
                ),
                // Tambahkan elemen lain sesuai kebutuhan
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: const RootPage(),
                        type: PageTransitionType.bottomToTop));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: 370,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child: Text(
                          'Masuk',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Belum Punya Akun?'),
                    TextButton(onPressed: () {}, child: const Text(' Daftar')),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

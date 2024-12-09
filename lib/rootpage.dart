import 'package:flutter/material.dart';
// import 'package:mahaduna/UserPage.dart';
import 'package:mahaduna/app/modules/home/views/home_view.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:mahaduna/app/modules/informasi/views/informasi_view.dart';
import 'package:mahaduna/app/modules/izin/views/izin_view.dart';
import 'package:page_transition/page_transition.dart';

import 'package:mahaduna/app/data/constants.dart';

import 'app/modules/presensi/views/presensi_view.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  // List Pages
  List<Widget> _widgetOptions() {
    return [
      const HomeView(),
      const IzinView(),
      // UserPage(),
      InformasiView(),
    ];
  }

  // List Page Icons
  final List<IconData> iconList = [
    Icons.home,
    Icons.event,
    Icons.assignment,
    Icons.person,
  ];

  final List<String> titleList = [
    'Home',
    'Izin',
    'Laporan Kerusakan',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(color: Constants.blackColor, fontSize: 24),
            ),
            Icon(
              Icons.notifications,
              color: Constants.blackColor,
              size: 30.0,
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child:
                  const PresensiView(), // Ini harus sesuai dengan nama import dan page yang kamu punya
              type: PageTransitionType.bottomToTop,
            ),
          );
        },
        backgroundColor: Constants.primaryColor,
        child: const Icon(
          Icons.fingerprint,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
    );
  }
}

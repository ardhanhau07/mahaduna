import 'package:flutter/material.dart';
import 'package:mahaduna/app/data/event_widget.dart';
import 'package:mahaduna/models/kegiatan.dart';
import 'package:mahaduna/models/musyrif.dart';
import 'package:mahaduna/services/config.dart';
import 'package:mahaduna/services/kegiatanService.dart';
import 'package:mahaduna/services/musyrifService.dart';
import '../../../data/constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  final KegiatanService _serviceKegiatan = KegiatanService();
  final MusyrifService _serviceMusyrif = MusyrifService();
  List<Kegiatan> kegiatanList = [];
  List<Musyrif> musyrifList = [];

  @override
  void initState() {
    super.initState();
    _loadKegiatan(); // Panggil fungsi untuk memuat data kegiatan
    _loadMusyrif();
  }

  Future<void> _loadKegiatan() async {
    try {
      final data = await _serviceKegiatan.getAllKegiatan();
      setState(() {
        kegiatanList = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }
  
  Future<void> _loadMusyrif() async {
    try {
      final data = await _serviceMusyrif.getAllMusyrif();
      setState(() {
        musyrifList = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }


  Future<void> _hapusUser(int idKegiatan) async {
    await _serviceKegiatan.hapusKegiatan(idKegiatan);
    _loadKegiatan();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> menuTypes = [
      'Kegiatan',
      'Info Mahad',
      'Info Mabna',
      'Musyrif Mabna',
    ];

    bool toggleIsFavorated(bool isFavorated) {
      return !isFavorated;
    }

    final bool isMusyrifSelected = menuTypes[selectedIndex] == 'Musyrif Mabna';
    final bool isInfoMahadSelected = menuTypes[selectedIndex] == 'Info Mahad';
    final bool isInfoMabnaSelected = menuTypes[selectedIndex] == 'Info Mabna';

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * .9,
                    decoration: BoxDecoration(
                        color: Constants.primaryColor.withOpacity(.1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black54.withOpacity(.6),
                        ),
                        const Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search Feature',
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        )),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.mic,
                              color: Colors.black54.withOpacity(.6)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                  key: ValueKey(kegiatanList),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: menuTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          menuTypes[index],
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: selectedIndex == index
                                  ? FontWeight.bold
                                  : FontWeight.w300,
                              color: selectedIndex == index
                                  ? Constants.primaryColor
                                  : Colors.black),
                        ),
                      ),
                    );
                  }),
            ),
            if (isInfoMahadSelected) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/mahad_info.png', // Path to your image
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ma\'had Sunan Ampel Al Aly',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const Text(
                      'UIN Maulana Malik Ibrahim Malang',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Ide pendirian Ma\'had Sunan Ampel al-Aly yang diperuntukkan bagi Mahasiswa UIN Maulana Malik Ibrahim Malang sudah lama dipikirkan, yaitu sejak kepemimpinan KH. Usman Manshur, tetapi hal tersebut belum dapat terealisasikan. Ide tersebut baru dapat direalisasikan pada masa kepemimpinan Prof. Dr. H. Imam Suprayogo, ketika itu masih menjabat sebagai ketua STAIN Malang.',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ] else if (isInfoMabnaSelected) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/alkhawarizmi.jpg', // Path to your image
                      width: size.width,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mabna Al Khawarizmi',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                    const Text(
                      'Pusat Ma\'had Al Jamiah UIN Maulana Malik Ibrahim Malang',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Mabna Al Khawarizmi merupakan sebuah mabna yang terletak di Kampus 3 Putra UIN Maulana Malik Ibrahim Malang yang terletak di Kota Batu. Mabna ini dipimpin oleh dua Murobbi yakni Ustadz Irfan dan Ustadz Zaen. Musyrif-nya terdiri dari 24 orang.',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ] else ...[
              // Display "Upcoming Events" section if "Info Mahad" is not selected
              Container(
                padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
                child: const Text(
                  'Upcoming Events',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
              ),
              SizedBox(
                height: size.height * .3,
                child: isMusyrifSelected
                    ? musyrifList.isNotEmpty
                        ? ListView.builder(
                            itemCount: musyrifList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              final Musyrif musyrif = musyrifList[index];
                              return GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: 200,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    color:
                                        Constants.primaryColor.withOpacity(.8),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            Config.baseUrl +'restful-json-mahad/public/uploads/musyrif/${musyrif.gambar}',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                child: const Icon(
                                                  Icons.broken_image,
                                                  size: 50,
                                                  color: Colors.red,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 15,
                                        left: 20,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Lantai ${musyrif.lantai}',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              musyrif.nama,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(child: Text('No Musyrif Data'))
                    : ListView.builder(
                        itemCount: kegiatanList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final Kegiatan event = kegiatanList[index];
                          return GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: Constants.primaryColor.withOpacity(.8),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Image.network(
                                      Config.baseUrl +'restful-json-mahad/public/uploads/images/${event.gambar}',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          child: const Icon(
                                            Icons.broken_image,
                                            size: 50,
                                            color: Colors.red,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Text(
                                      event.nama,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                height: size.height * .5,
                child: ListView.builder(
                    itemCount: kegiatanList.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return EventWidget(
                        index: index,
                        eventList: kegiatanList,
                      );
                    }),
              )
            ]
          ],
        ),
      ),
    );
  }
}

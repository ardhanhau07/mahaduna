import 'package:flutter/material.dart';
import 'package:mahaduna/app/data/constants.dart';
import 'package:mahaduna/models/kegiatan.dart';

import '../../services/config.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({
    super.key,
    required this.index,
    required this.eventList,
  });

  final int index;
  final List<Kegiatan> eventList;

  @override
  _EventWidgetState createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          // Menghilangkan background hijau
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: const EdgeInsets.only(left: 10, top: 10),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    // Menghilangkan warna pada lingkaran gambar
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.network(
                      Config.baseUrl +'restful-json-mahad/public/uploads/images/${widget.eventList[widget.index].gambar}',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200], // Background untuk fallback
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.red,
                            size: 40.0,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.eventList[widget.index].nama,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.blackColor,
                        ),
                      ),
                      Text(widget.eventList[widget.index].deskripsi),
                    ],
                  ),
                ),
                // Menghapus Positioned yang berisi IconButton (love button)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

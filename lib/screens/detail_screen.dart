import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_place/models/tourism_place.dart';
import 'package:tourism_place/widgets/favorite.dart';

// Membuat variabel informationTextStyle dengan gaya teks tertentu
var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

// Kelas DetailScreen merupakan StatelessWidget yang menampilkan detail tempat wisata
class DetailScreen extends StatelessWidget {
 // Konstruktor untuk kelas DetailScreen yang menerima parameter place
 const DetailScreen({Key? key, required this.place}) : super(key: key);

 // Variabel final place yang menyimpan data TourismPlace
 final TourismPlace place;

 // Metode build() untuk membangun widget yang akan ditampilkan
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     // Body Scaffold berisi SingleChildScrollView untuk memungkinkan scroll vertikal
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           // Stack yang berisi gambar tempat wisata dan tombol navigasi kembali
           Stack(
             children: <Widget>[
               Image.asset(place.imageAsset),
               SafeArea(
                 child: Padding(
                   padding: const EdgeInsets.all(8),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       CircleAvatar(
                         backgroundColor: Colors.grey,
                         child: IconButton(
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           icon: const Icon(
                             Icons.arrow_back,
                             color: Colors.white,
                           ),
                         ),
                       ),
                       FavoriteButton(), // Widget FavoriteButton dari file favorite.dart
                     ],
                   ),
                 ),
               ),
             ],
           ),
           // Container yang menampilkan informasi hari buka, jam buka, dan harga tiket
           Container(
             margin: const EdgeInsets.symmetric(vertical: 16),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 // Kolom untuk hari buka
                 Column(
                   children: <Widget>[
                     const Icon(Icons.calendar_today),
                     const SizedBox(height: 8),
                     Text(
                       place.openDays,
                       style: informationTextStyle,
                     )
                   ],
                 ),
                 // Kolom untuk jam buka
                 Column(
                   children: <Widget>[
                     const Icon(Icons.access_time),
                     const SizedBox(height: 8),
                     Text(
                       place.openTime,
                       style: informationTextStyle,
                     )
                   ],
                 ),
                 // Kolom untuk harga tiket
                 Column(
                   children: <Widget>[
                     const Icon(Icons.monetization_on),
                     const SizedBox(height: 8),
                     Text(
                       place.ticketPrice,
                       style: informationTextStyle,
                     )
                   ],
                 ),
               ],
             ),
           ),
           // Container yang menampilkan deskripsi tempat wisata
           Container(
             padding: EdgeInsets.all(16),
             child: Text(
               place.description,
               textAlign: TextAlign.center,
               style: const TextStyle(
                 fontSize: 16,
                 fontFamily: 'Oxygen',
               ),
             ),
           ),
           // SizedBox yang menampilkan galeri gambar tempat wisata dalam ListView horizontal
           SizedBox(
             height: 150,
             child: ListView(
               scrollDirection: Axis.horizontal,
               children: place.imageUrls.map((url) {
                 return Padding(
                   padding: const EdgeInsets.all(4),
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     child: Image.network(url),
                   ),
                 );
               }).toList(),
             ),
           ),
         ],
       ),
     ),
   );
 }
}
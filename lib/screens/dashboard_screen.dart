import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourism_place/models/tourism_place.dart';
import 'package:tourism_place/screens/detail_screen.dart';

// Kelas DashboardScreen merupakan StatelessWidget yang menampilkan daftar tempat wisata
class DashboardScreen extends StatelessWidget {
 // Konstruktor untuk kelas DashboardScreen
 const DashboardScreen({super.key});

 // Metode build() untuk membangun widget yang akan ditampilkan
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     // AppBar dengan judul "Places"
     appBar: AppBar(
       title: Text('Places'),
     ),
     // Body Scaffold berisi ListView.builder untuk menampilkan daftar tempat wisata
     body: ListView.builder(
       itemBuilder: (context, index) {
         // Mendapatkan data tempat wisata dari daftar tourismPlaceList
         final TourismPlace place = tourismPlaceList[index];
         return InkWell(
           // Ketika item diklik, navigasi ke DetailScreen dengan data tempat wisata yang dipilih
           onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) {
               return DetailScreen(place: place);
             }));
           },
           child: Card(
             child: Row(
               children: [
                 // Gambar tempat wisata
                 Expanded(
                   flex: 1,
                   child: Image.asset(place.imageAsset),
                 ),
                 // Nama dan lokasi tempat wisata
                 Expanded(
                   flex: 2,
                   child: Padding(
                     padding: EdgeInsets.all(8),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                           place.name,
                           style: const TextStyle(fontSize: 16.0),
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Text(place.location),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
         );
       },
       // Jumlah item yang akan dibangun sesuai dengan panjang daftar tourismPlaceList
       itemCount: tourismPlaceList.length,
     ),
   );
 }
}
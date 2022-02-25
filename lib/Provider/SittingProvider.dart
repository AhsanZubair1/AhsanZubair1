import 'package:provider/provider.dart';
import 'package:untitled/Model/SittingData.dart';
import 'package:flutter/foundation.dart   ';

class SittingDataProvider with ChangeNotifier , DiagnosticableTreeMixin{


  List <SittingData> _hotel=[
    SittingData(hotelname: "Yasir Broast",price: 20,numberoftables: 7,selecttable: List.filled(7, false), addres: '16 Ghazali Rd, near Khizra Masjid, Samanabad Town, Lahore,', location: 'https://maps.app.goo.gl/ZgU4Zh6entkeQP67A', rating: 4, resturent_image: 'https://cdnassets.hw.net/97/65/2d95f33f43c8bfce45d26b8da15d/kontumindochinecafe-dining-hero-tcm20-2162761.jpg'),
    SittingData(hotelname: "Al Khan Resturent",price: 40,numberoftables: 3,selecttable: List.filled(3, false), addres: '16 Ghazali Rd, near Khizra Masjid, Samanabad Town, Lahore', location: 'https://maps.app.goo.gl/ZgU4Zh6entkeQP67A', rating: 2, resturent_image: 'https://imgmedia.lbb.in/media/2021/07/60dd97cd5f254f559b78f326_1625135053957.jpg'),
    SittingData(hotelname: "Chai Talab",price: 50,numberoftables: 6,selecttable: List.filled(6, false), addres: '16 Ghazali Rd, near Khizra Masjid, Samanabad Town, Lahore', location: 'https://maps.app.goo.gl/ZgU4Zh6entkeQP67A', rating: 3, resturent_image: 'https://i.pinimg.com/originals/56/e6/00/56e6009d281d770c1ba51b76361b8aaa.jpg'),
    SittingData(hotelname: "Chai studio and Qawali",price: 20,numberoftables: 10,selecttable: List.filled(10, false), addres: '16 Ghazali Rd, near Khizra Masjid, Samanabad Town, Lahore', location: 'https://maps.app.goo.gl/ZgU4Zh6entkeQP67A', rating: 2, resturent_image: 'https://images.adsttc.com/media/images/6042/468d/f91c/81cf/e700/028e/medium_jpg/09.jpg?1614956107'),
    SittingData(hotelname: "Chai murshaid",price: 240,numberoftables: 8,selecttable: List.filled(8, false), addres: '16 Ghazali Rd, near Khizra Masjid, Samanabad Town, Lahore', location: 'https://maps.app.goo.gl/ZgU4Zh6entkeQP67A', rating: 5, resturent_image: 'https://i.pinimg.com/originals/56/e6/00/56e6009d281d770c1ba51b76361b8aaa.jpg'),
    SittingData(hotelname: "Chai qawali",price: 80,numberoftables: 3,selecttable: List.filled(3, false), addres: '16 Ghazali Rd, near Khizra Masjid, Samanabad Town, Lahore', location: 'https://maps.app.goo.gl/ZgU4Zh6entkeQP67A', rating: 2, resturent_image: 'https://imgmedia.lbb.in/media/2021/07/60dd97cd5f254f559b78f326_1625135053957.jpg'),
    SittingData(hotelname: "Chai nasha",price: 90,numberoftables: 6,selecttable: List.filled(6, false), addres: '16 Ghazali Rd, near Khizra Masjid, Samanabad Town, Lahore', location: 'https://maps.app.goo.gl/ZgU4Zh6entkeQP67A', rating: 4, resturent_image: 'https://i.pinimg.com/736x/11/3a/e5/113ae5a180b6fc7990d8f1a49d1da1fb.jpg'),


  ];

  List<SittingData> get hotel => _hotel;


  hoteldad(SittingData value) {
    _hotel.add(value);
    notifyListeners();
  }
}
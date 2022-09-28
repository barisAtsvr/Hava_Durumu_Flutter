import 'package:flutter/foundation.dart';

class StateData with ChangeNotifier {
  String? sehir;
  String ilce = 'Altındağ';
  String mahalle = 'Battalgazi';


  void newCity(String city) {
    sehir = city;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  String _address = '';

  String get address => _address;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      _address = placemarks.isNotEmpty
          ? '${placemarks[0].street}, ${placemarks[0].subLocality}, ${placemarks[0].locality}, ${placemarks[0].postalCode}, ${placemarks[0].country}'
          : 'Alamat tidak ditemukan';
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }

    void clear() {
    _address = '';
    notifyListeners();
  }
}
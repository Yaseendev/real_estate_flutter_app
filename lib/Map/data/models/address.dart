import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address {
  final String name;
  final String road;
  final String neighbourhood;
  final String suburb;
  final String state;
  final String postcode;
  final String country;
  final String countryCode;
  final String town;
  final String displayName;
  LatLng? location;

  Address({
    this.name = '',
    this.road = '',
    this.neighbourhood = '',
    this.suburb = '',
    this.state = '',
    this.postcode = '',
    this.country = '',
    this.countryCode = '',
    this.town = '',
    this.location,
    this.displayName = '',
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    final address = json['address'];
    return Address(
      displayName: json['display_name'] ?? '',
      name: address['name'] ?? '',
      road: address['road'] ?? '',
      neighbourhood: address['neighbourhood'] ?? '',
      suburb: address['suburb'] ?? '',
      state: address['state'] ?? '',
      postcode: address['postcode'] ?? '',
      country: address['country'] ?? '',
      countryCode: address['country_code'] ?? '',
      town: address['town'] ?? '',
    );
  }
}

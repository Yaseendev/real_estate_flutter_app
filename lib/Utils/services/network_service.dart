import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants.dart';

class NetworkService {
  final Dio _dio;

  NetworkService(this._dio);

  Future<dynamic> searchLocation(String text) async {
    Response response = await Dio().get(
      Urls.LOCATION_AUTOCOMPLETE,
      options: Options(
        contentType: 'application/json',
      ),
      queryParameters: {
        'q': text,
        'countrycodes': 'eg',
        'key': locationKey,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>?> reverseGeoLocation(LatLng location) async {
    Response response = await Dio().get(
      Urls.LOCATION_REVERSE,
      queryParameters: {
        'lat': location.latitude,
        'lon': location.longitude,
        'countrycodes': 'eg',
        'key': locationKey,
        'format': 'json',
      },
      options: Options(
        contentType: 'application/json',
      ),
    );
    return response.data;
  }
}

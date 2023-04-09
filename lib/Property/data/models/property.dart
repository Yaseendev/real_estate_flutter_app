import 'package:lit_relative_date_time/model/relative_date_time.dart';

class Property {
  final int id;
  final String name;
  final String description;
  final num price;
  final int bedRooms;
  final int bathRooms;
  final int levels;
  final num area;
  final DateTime listedAt;
  final List<String> imgUrls;
  final String address;

  const Property({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.bedRooms,
    required this.bathRooms,
    required this.area,
    required this.listedAt,
    this.imgUrls = const [''],
    required this.address,
    required this.levels,
  });

  String getTimeDifference() {
    final DateTime date2 = DateTime.now();
    final RelativeDateTime relativeDateTime =
        RelativeDateTime(dateTime: date2, other: listedAt);
    final int diffVal = relativeDateTime.timeDifference.value.abs();
    final String diffUnit =
        relativeDateTime.timeDifference.unit.name + (diffVal > 1 ? 's' : '');
    return '$diffVal $diffUnit';
  }
}

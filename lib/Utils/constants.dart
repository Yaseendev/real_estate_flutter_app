class Images {
  static const String imagesBaseUri = 'assets/images/';
  static const String kPlaceHolder = imagesBaseUri + 'placeholder.jpg';
  static const String kDefaultProfile = imagesBaseUri + 'default_profile.png';
}

class Urls {
  static const String LOCATION_DOMAIN = 'https://eu1.locationiq.com';
  static const String LOCATION_BASE_API = LOCATION_DOMAIN + '/v1';
  static const String LOCATION_AUTOCOMPLETE =
      '$LOCATION_BASE_API/autocomplete.php';
  static const String LOCATION_REVERSE = '$LOCATION_BASE_API/reverse.php';
}

const String locationKey = 'YOUR-KEY';
const String loremIpsum =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.';

enum CategoryType { apartment, villa, vacationHome, commercial, building, land }
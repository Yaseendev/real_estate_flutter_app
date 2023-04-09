import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:real_estate_app/Map/data/models/address.dart';
import 'package:real_estate_app/Map/presentation/screens/property_location_screen.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Utils/constants.dart';
import 'package:real_estate_app/Utils/locator.dart';
import '../widgets/choice_card.dart';
import '../widgets/listProperty/amenities_dropdown.dart';
import '../widgets/listProperty/category_drop_downButton.dart';
import '../widgets/listProperty/property_status_section.dart';

class ListPropertyScreen extends StatefulWidget {
  final String? selectedStatus;
  final String? paymentOption;
  const ListPropertyScreen({
    super.key,
    this.selectedStatus,
    this.paymentOption,
  });

  @override
  State<ListPropertyScreen> createState() => _ListPropertyScreenState();
}

class _ListPropertyScreenState extends State<ListPropertyScreen> {
  CategoryType category = CategoryType.apartment;
  bool selectedFurnished = true;
  late String selectedStatus;
  late String paymentOption;
  final List<XFile> images = [];
  Address? propertyLocation;
  CategoryType categoryType = CategoryType.apartment;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  List<String> amenities = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    selectedStatus = getTranslated('finished', context);
    paymentOption = getTranslated('sell', context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated('list_property', context)),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Category Section
              Row(
                children: [
                  Text(
                    getTranslated('category', context),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 35),
                  Expanded(
                    child: CategoryDropDownButton(
                      onChange: (value) => categoryType = value,
                    ),
                  ),
                ],
              ),
              const Divider(),

              ///Property Name Section
              Text(getTranslated('property_name', context)),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                )),
                textInputAction: TextInputAction.next,
                //initialValue: startPrice != null ? '$startPrice': null,
                validator: (val) {
                  if (val != null) {
                    if (val.isEmpty)
                      return getTranslated('property_required', context);
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                //onChanged: (value) =>startPrice = double.tryParse(value),
              ),
              const SizedBox(height: 10),

              /// Area Section
              Text(getTranslated('area', context)),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                )),
                textInputAction: TextInputAction.next,
                //initialValue: startPrice != null ? '$startPrice': null,
                validator: (val) {
                  if (val != null) {
                    if (val.isNotEmpty && double.tryParse(val) == null)
                      return getTranslated('invalid_value', context);
                    if (val.isEmpty)
                      return getTranslated('area_is_required', context);
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                //onChanged: (value) =>startPrice = double.tryParse(value),
              ),
              const SizedBox(height: 10),

              ///Amenity Section
              Text(getTranslated('amenities', context)),
              AmenitiesDropdown(
                onChange: (value) => amenities = value,
              ),

              ///Bedrooms Section
              const SizedBox(height: 10),
              Text(getTranslated('bedrooms', context)),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                )),
                textInputAction: TextInputAction.next,
                //initialValue: startPrice != null ? '$startPrice': null,
                validator: (val) {
                  if (val != null) {
                    if (val.isNotEmpty && int.tryParse(val) == null)
                      return getTranslated('invalid_value', context);
                    if (val.isEmpty)
                      return getTranslated('bedrooms_required', context);
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                //onChanged: (value) =>startPrice = double.tryParse(value),
              ),
              const SizedBox(height: 10),

              ///Bathrooms Section
              Text(getTranslated('bathrooms', context)),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                )),
                textInputAction: TextInputAction.next,
                //initialValue: startPrice != null ? '$startPrice': null,
                validator: (val) {
                  if (val != null) {
                    if (val.isNotEmpty && int.tryParse(val) == null)
                      return getTranslated('invalid_value', context);
                    if (val.isEmpty)
                      return getTranslated('bathrooms_required', context);
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                //onChanged: (value) =>startPrice = double.tryParse(value),
              ),
              const SizedBox(height: 10),

              ///Floor Section
              Text(getTranslated('floor', context)),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                )),
                textInputAction: TextInputAction.next,
                //initialValue: startPrice != null ? '$startPrice': null,
                validator: (val) {
                  if (val != null) {
                    if (val.isNotEmpty && int.tryParse(val) == null)
                      return getTranslated('invalid_value', context);
                    if (val.isEmpty)
                      return getTranslated('floor_required', context);
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                //onChanged: (value) =>startPrice = double.tryParse(value),
              ),
              SizedBox(height: 10),

              ///Property Status Section
              Text(getTranslated('property_status', context)),
              PropertyStatusSection(
                groupValue: selectedStatus,
                onChange: (value) => setState(() => selectedStatus = value),
              ),

              ///Furnished Section
              const SizedBox(height: 10),
              Text(getTranslated('furnished', context)),
              Row(
                children: [
                  ChoiceCard(
                    label: getTranslated('furnished', context),
                    value: true,
                    groupValue: selectedFurnished,
                    onChange: (value) =>
                        setState(() => selectedFurnished = value!),
                  ),
                  ChoiceCard(
                    label: getTranslated('unfurnished', context),
                    value: false,
                    groupValue: selectedFurnished,
                    onChange: (value) =>
                        setState(() => selectedFurnished = value!),
                  ),
                ],
              ),

              ///Description Section
              SizedBox(height: 10),
              Text(getTranslated('description', context)),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                )),
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                validator: (val) {
                  if (val != null) {
                    if (val.isEmpty)
                      return getTranslated('description_required', context);
                  }
                  return null;
                },
              ),

              const Divider(),

              ///Price Section
              Text(
                getTranslated('price', context),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                )),
                textInputAction: TextInputAction.next,
                //initialValue: startPrice != null ? '$startPrice': null,
                validator: (val) {
                  if (val != null) {
                    if (val.isNotEmpty && num.tryParse(val) == null)
                      return getTranslated('invalid_value', context);
                    if (val.isEmpty)
                      return getTranslated('price_required', context);
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                //onChanged: (value) =>startPrice = double.tryParse(value),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ChoiceCard(
                      label: getTranslated('sell', context),
                      value: getTranslated('sell', context),
                      groupValue: paymentOption,
                      onChange: (value) =>
                          setState(() => paymentOption = value!),
                    ),
                    ChoiceCard(
                      label: getTranslated('rent_month', context),
                      value: getTranslated('rent_month', context),
                      groupValue: paymentOption,
                      onChange: (value) =>
                          setState(() => paymentOption = value!),
                    ),
                    ChoiceCard(
                      label: getTranslated('rent_day', context),
                      value: getTranslated('rent_day', context),
                      groupValue: paymentOption,
                      onChange: (value) =>
                          setState(() => paymentOption = value!),
                    ),
                  ],
                ),
              ),
              const Divider(),

              ///Property Photos Section
              Text(
                getTranslated('property_photos', context),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.start,
                runSpacing: 10,
                spacing: 10,
                children: [
                  ...images.map((e) => Image.file(
                        File(e.path),
                        height: 120.sp,
                        width: 100.sp,
                        fit: BoxFit.fill,
                      )),
                  GestureDetector(
                    onTap: () {
                      locator
                          .get<ImagePicker>()
                          .pickMultiImage(requestFullMetadata: false)
                          .then((values) =>
                              setState(() => images.addAll(values)));
                    },
                    child: Image.asset(
                      'assets/images/add_image.png',
                      height: 120.sp,
                      width: 100.sp,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              const Divider(),

              ///Property Location Section
              Text(
                getTranslated('property_location', context),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              propertyLocation != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          propertyLocation!.displayName,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 150.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: GoogleMap(
                              mapType: MapType.normal,
                              indoorViewEnabled: true,
                              initialCameraPosition: CameraPosition(
                                target: propertyLocation!.location!,
                                zoom: 16.4746,
                              ),
                              markers: {
                                Marker(
                                  markerId: MarkerId('pLocation'),
                                  position: propertyLocation!.location!,
                                ),
                              },
                              liteModeEnabled: Platform.isAndroid,
                              zoomControlsEnabled: false,
                              myLocationButtonEnabled: false,
                              myLocationEnabled: false,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Container(),

              OutlinedButton.icon(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (_) => BlocProvider<MapBloc>(
                                create: (context) => MapBloc(),
                                child: PropertyLocationScreen(),
                              )))
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        propertyLocation = value;
                      });
                    }
                  });
                },
                icon: const Icon(Icons.travel_explore_rounded),
                label: Text(getTranslated('choose_prop_location', context)),
              ),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      print('Valid');
                    }
                  },
                  child: Text(
                    getTranslated('post_now', context),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

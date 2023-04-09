import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:real_estate_app/Map/data/repositories/map_repo.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Shared/Widgets/back_elv_button.dart';
import 'package:real_estate_app/Utils/locator.dart';
import 'package:real_estate_app/Utils/themes.dart';
import 'areas_list_screen.dart';

class PropertyLocationScreen extends StatefulWidget {
  const PropertyLocationScreen({super.key});

  @override
  State<PropertyLocationScreen> createState() => _PropertyLocationScreenState();
}

class _PropertyLocationScreenState extends State<PropertyLocationScreen> {
  TextEditingController textController = TextEditingController();
  late final GoogleMapController googleMapController;
  LatLng location = LatLng(30.0504132, 31.2073222);

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
      listener: (context, state) {
        if (state is MapCurrentLocation) {
          if (state.curentLocation != null) {
            googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(state.curentLocation!.latitude,
                  state.curentLocation!.longitude),
              zoom: 15,
            )));
          }
        } else if (state is MapError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: Duration(seconds: 2),
            content: ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 0,
              // dense: true,
              leading: Icon(Icons.info_rounded),
              title: Text(getTranslated('err_msg', context)),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
          ));
        } else if (state is MapLoaded) {
          print(state.location);
          Navigator.of(context).pop(state.location);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: const BackElvButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TypeAheadField(
            errorBuilder: (context, error) {
              return Container();
            },
            textFieldConfiguration: TextFieldConfiguration(
              maxLines: 1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                fillColor: Color(0xFFF6F6F6),
                filled: true,
                hintText: getTranslated('search_area', context),
                prefixIcon: Icon(Icons.search),
              ),
              textAlignVertical: TextAlignVertical.bottom,
              controller: textController,
            ),
            suggestionsCallback: (pattern) async {
              print(pattern);
              return await locator
                  .get<MapRepository>()
                  .getLoactionSearchResult(pattern);
            },
            autoFlipDirection: true,
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.location_on_rounded),
                title: Text(suggestion.displayPlace),
                subtitle: Text(
                    '${suggestion.address.road} ${suggestion.address.state} ${suggestion.address.country}'),
              );
            },
            onSuggestionSelected: (suggestion) {
              googleMapController.animateCamera(CameraUpdate.newLatLng(
                LatLng(suggestion.position.latitude,
                    suggestion.position.longitude),
              ));
              textController.text = suggestion.displayPlace;
            },
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => AreasListScreen(
                          fromInit: false,
                        )));
              },
              child: Icon(
                Icons.list,
                color: Colors.white,
                size: 30,
              ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(12),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            GoogleMap(
              indoorViewEnabled: true,
              initialCameraPosition: CameraPosition(
                target: location, //TODO: Change later
                zoom: 12.5,
              ),
              onMapCreated: (gController) {
                googleMapController = gController;
              },
              onTap: (pos) {
                print('Location ');
                googleMapController.animateCamera(CameraUpdate.newLatLng(pos));
              },
              mapToolbarEnabled: false,
              zoomControlsEnabled: false,
              onCameraMove: (cameraPos) {
                location = cameraPos.target;
              },
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: const Icon(
                  Icons.location_pin,
                  size: 45,
                  color: AppColors.PRIMARY_COLOR,
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: BlocBuilder<MapBloc, MapState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          if (!(state is MapLoading))
                            context
                                .read<MapBloc>()
                                .add(FetchAreaName(location));
                        },
                        child: state is MapLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(getTranslated('choose_area', context)),
                      );
                    },
                  ),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 5,
          onPressed: () {
            context.read<MapBloc>().add(LoadCurrentLocation());
          },
          child: Icon(
            Icons.gps_fixed,
            size: 28,
          ),
        ),
      ),
    );
  }
}

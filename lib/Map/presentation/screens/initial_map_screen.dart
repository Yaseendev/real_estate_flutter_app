import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/Map/blocs/map_bloc/map_bloc.dart';
import 'package:real_estate_app/Map/data/repositories/map_repo.dart';
import 'package:real_estate_app/Shared/Localization/language_constrants.dart';
import 'package:real_estate_app/Shared/Widgets/back_elv_button.dart';
import 'package:real_estate_app/Utils/locator.dart';
import 'areas_list_screen.dart';

class InitialMapScreen extends StatefulWidget {
  final LatLng currentLocation;
  const InitialMapScreen({
    super.key,
    required this.currentLocation,
  });

  @override
  State<InitialMapScreen> createState() => _InitialMapScreenState();
}

class _InitialMapScreenState extends State<InitialMapScreen> {
  late LatLng location;
  late final CameraPosition _initialCameraPosition;
  late final GoogleMapController googleMapController;
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    location = widget.currentLocation;
    _initialCameraPosition = CameraPosition(
      target: location,
      zoom: 12.5,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapBloc, MapState>(
      listener: (context, state) {
        if (state is MapLoaded) {
          print(state.location);
          Navigator.of(context).pop(state.location);
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
        } else if (state is MapCurrentLocation) {
          if (state.curentLocation != null) {
            googleMapController
                .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(state.curentLocation!.latitude,
                  state.curentLocation!.longitude),
              zoom: 15,
            )));
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                mapToolbarEnabled: true,
                zoomControlsEnabled: true,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (controller) {
                  googleMapController = controller;
                },
                onTap: (pos) {
                  googleMapController.animateCamera(CameraUpdate.newLatLng(
                    pos,
                  ));
                },
                onCameraMove: (cameraPos) {
                  location = cameraPos.target;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    const BackElvButton(),
                    Expanded(
                      child: TypeAheadField(
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
                          //if (pattern.isEmpty) return Future.value();
                          return await locator
                              .get<MapRepository>()
                              .getLoactionSearchResult(pattern);
                          //await BackendService.getSuggestions(pattern);
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
                        //  onChanged: (value) => searchText = value,
                        onSuggestionSelected: (suggestion) {
                          googleMapController
                              .animateCamera(CameraUpdate.newLatLng(
                            LatLng(suggestion.position.latitude,
                                suggestion.position.longitude),
                          ));
                          textController.text = suggestion.displayPlace;
                        },
                        keepSuggestionsOnLoading: false,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (_) => AreasListScreen(
                                  fromInit: true,
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
        ),
        floatingActionButton: FloatingActionButton(
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

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }
}

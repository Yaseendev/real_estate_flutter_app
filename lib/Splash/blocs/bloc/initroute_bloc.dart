import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:real_estate_app/Utils/locator.dart';

part 'initroute_event.dart';
part 'initroute_state.dart';

class InitrouteBloc extends Bloc<InitrouteEvent, InitrouteState> {
  InitrouteBloc() : super(InitrouteInitial()) {
    final Connectivity connectivity = locator.get<Connectivity>();
    var accoountRepository;
    //locator.get<AccoountRepository>();
    on<InitrouteEvent>((event, emit) async {
      // final connStatus = await connectivity.checkConnectivity();
      if (event is UserCheckEvent) {
        //if (connStatus != ConnectivityResult.none) {
        await accoountRepository.tokenCheck().then((value) {
          if (value == null) {
            emit(InitrouteNoToken());
          } else {
            if (value) {
              emit(InitrouteValidToken());
            } else {
              emit(InitrouteInValidToken());
            }
          }
        }).onError((error, stackTrace) {
          emit(InitrouteError());
        });
        // } else
        //   emit(InitrouteNoInternet());
      }
    });
  }
}

import 'package:bkd/services/helpers/logger_extension.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../services/bloc_data_model/dynamic_data.dart';
import '../../../services/connection/connection_status.dart';
import '../models/home_response_models.dart';
import '../repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
          homePageResponse: DynamicBlocData.init(),
        )) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;

    on<HomeEvent>((event, emit) async {
      if (event is InitHome) {
        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          try {
            // Load the home page response from the repository
            final response = await HomeRepo().fetchHomeData();
            emit(state.copyWith(
              response: DynamicBlocData.success(value: response),
            ));
          } catch (e, stackTrace) {
            AppLog.e("Error loading home page: ",
                error: e, stackTrace: stackTrace);
            emit(state.copyWith(
              response:
                  DynamicBlocData.error(message: "Can't load home page data"),
            ));
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.homePageResponse.status == Status.init) {
              add(InitHome());
            }
          });
        }
      }
    });
  }
}

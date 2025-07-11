import 'package:bkd/services/helpers/logger_extension.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../services/bloc_data_model/dynamic_data.dart';
import '../../../services/connection/connection_status.dart';
import '../../../services/helpers/value_handler.dart';
import '../models/home_response_models.dart';
import '../repo/home_repo.dart';
import '../utils/home_utils.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState(
          homeSduiResponse: DynamicBlocData.init(),
          widgetList: DynamicBlocData.init(),
          data: DynamicBlocData.init(),
          isHide: DynamicBlocData.init(),
          pageNo: DynamicBlocData.init(),
        )) {
    ConnectionStatus connectionStatus = ConnectionStatus.getInstance;

    on<HomeEvent>((event, emit) async {
      if (event is InitHome) {
/*        bool onlineStatus = await connectionStatus.checkConnection();
        if (onlineStatus) {
          try {
            // Load the home page response from the repository
            final response = await HomeRepo().fetchHomeData();
            emit(state.copyWith(
              homeSduiResponse: DynamicBlocData.success(value: response),
            ));
          } catch (e, stackTrace) {
            AppLog.e("Error loading home page: ",
                error: e, stackTrace: stackTrace);
            emit(state.copyWith(
              homeSduiResponse:
                  DynamicBlocData.error(message: "Can't load home page data"),
            ));
          }
        } else {
          connectionStatus.connectionChange.listen((onlineStatus) {
            if (onlineStatus && state.homeSduiResponse.status == Status.init) {
              add(InitHome());
            }
          });
        }*/
      }

      ///
      else if (event is GetData) {
        if ((!ValueHandler().isNonZeroNumericValue(
                state.homeSduiResponse.value?.totalPageCount)) &&
            (state.homeSduiResponse.status != Status.loading)) {
          List<Widget> previousWidgetList = [];
          previousWidgetList.addAll(state.widgetList.value ?? []);

          emit(state.copyWith(
              widgetList: DynamicBlocData.init(value: state.widgetList.value),
              homeSduiResponse: DynamicBlocData.loading()));

          final HomePageResponse? homeSduiResponse =
              await HomeRepo().fetchHomeData();

          if (homeSduiResponse != null) {
            List<Widget> tempList = [];
            tempList.addAll(state.widgetList.value ?? []);
            int chunkSize = 3;
            int length = (homeSduiResponse.data?.length ?? 0);

            for (int i = 0; i < length; i += chunkSize) {
              List<Map<String, dynamic>>? chunk = homeSduiResponse.data
                  ?.sublist(i, i + chunkSize > length ? length : i + chunkSize);
              HomePageResponse? tempHomeSduiResponse =
                  HomePageResponse(data: chunk);

              List<Widget> list = await HomeUtils()
                  .getWidget(homeSduiResponse: tempHomeSduiResponse);

              tempList.addAll(list);

              if (state.widgetList.value?.isNotEmpty == true) {
                emit(state.copyWith(
                    widgetList:
                        DynamicBlocData.init(value: state.widgetList.value)));
              }

              emit(state.copyWith(
                  widgetList: DynamicBlocData.success(value: tempList)));

              await Future.delayed(Duration(milliseconds: 300));
            }

            List<Map<String, dynamic>> data = [];
            data.addAll(state.data.value ?? []);
            data.addAll(homeSduiResponse.data ?? []);
            emit(
              state.copyWith(
                homeSduiResponse:
                    DynamicBlocData.success(value: homeSduiResponse),
                data: DynamicBlocData.success(value: data),
              ),
            );
            if ((tempList.length - previousWidgetList.length) <
                    (homeSduiResponse.expectedResultSet ?? 0) &&
                event.needFurtherCall == true) {
              add(GetData());
            }
          }
        }
      }
    });
  }
}

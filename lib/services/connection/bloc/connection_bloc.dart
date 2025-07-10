import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  ConnectionBloc() : super(ConnectionInitial()) {
    // ConnectionStatus connectionStatus = ConnectionStatus.getInstance;
    on<ConnectionEvent>((event, emit) async {
      if (event is InitConnection) {
        /*connectionStatus.connectionChange.listen((onlineStatus) {
          if (onlineStatus) {
            add(OnConnectionChange());
          }
        });*/
        add(OnConnectionChange());
      } else if (event is OnConnectionChange) {
        // String? ipV4 = await ConnectionUtils().fetchWifiIpV4();
        // if (RSTextUtils().isTextNotEmptyOrNull(ipV4)) {
        //   ConnectionUtils().setIpV4(ipV4 ?? '');
        // }
        // String? ipV6 = await ConnectionUtils().fetchWifiIpV6();
        // if (RSTextUtils().isTextNotEmptyOrNull(ipV6)) {
        //   ConnectionUtils().setIpV6(ipV6 ?? '');
        // }
      }
    });
  }
}

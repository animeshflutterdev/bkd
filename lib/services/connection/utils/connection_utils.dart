// import 'package:network_info_plus/network_info_plus.dart'
//     deferred as network_info_plus;
// import 'package:retailer_shakti/utils/rs_text_utils.dart'
//     deferred as rs_text_utils;
//
// import '../../../data/connection/connection_status.dart'
//     deferred as connection_status;
// import '../../../data/network/network_api_services.dart'
//     deferred as network_api_service;
// import '../../../extension/logger_extension.dart';
// import '../../../utils/hive_storage/local_preference/local_preferences.dart';

class ConnectionUtils {
/*  Future<void> setIpV4(String ipV4) async {
    await LocalPreferences().setString(
      key: LocalPreferences.ssIpV4,
      value: ipV4,
    );
  }

  Future<String?> getIpV4() async {
    await rs_text_utils.loadLibrary();
    String? ssIpV4 = await LocalPreferences().getString(
      key: LocalPreferences.ssIpV4,
    );
    if (!rs_text_utils.RSTextUtils().isTextNotEmptyOrNull(ssIpV4)) {
      ssIpV4 = await fetchWifiIpV4();
      if (rs_text_utils.RSTextUtils().isTextNotEmptyOrNull(ssIpV4)) {
        await setIpV4(ssIpV4!);
      }
    }
    return ssIpV4;
  }

  Future<void> setIpV6(String ipV6) async {
    await LocalPreferences().setString(
      key: LocalPreferences.ssIpV6,
      value: ipV6,
    );
  }

  Future<String?> getIpV6() async {
    await rs_text_utils.loadLibrary();
    String? ssIpV6 = await LocalPreferences().getString(
      key: LocalPreferences.ssIpV6,
    );
    if (!rs_text_utils.RSTextUtils().isTextNotEmptyOrNull(ssIpV6)) {
      ssIpV6 = await fetchWifiIpV6();
      if (rs_text_utils.RSTextUtils().isTextNotEmptyOrNull(ssIpV6)) {
        await setIpV6(ssIpV6!);
      }
    }
    return ssIpV6;
  }

  Future<String?> fetchWifiIpV4() async {
    await network_info_plus.loadLibrary();
    String? wifiIpV4;
    try {
      wifiIpV4 = await network_info_plus.NetworkInfo().getWifiIP();
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return wifiIpV4 ??
        await _getIpFromInternet(
          tag: 'WifiIpV4',
          uri: 'https://api.ipify.org?format=json',
        );
  }

  Future<String?> fetchWifiIpV6() async {
    await network_info_plus.loadLibrary();
    String? wifiIpV6;
    try {
      wifiIpV6 = await network_info_plus.NetworkInfo().getWifiIPv6();
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return wifiIpV6 ??
        await _getIpFromInternet(
          tag: 'WifiIpV6',
          uri: 'https://api6.ipify.org?format=json',
        );
  }

  Future<String?> _getIpFromInternet({
    required String tag,
    required String uri,
  }) async {
    await connection_status.loadLibrary();
    final connectionStatus = connection_status.ConnectionStatus.getInstance;
    bool onlineStatus = await connectionStatus.checkConnection();
    if (onlineStatus) {
      await network_api_service.loadLibrary();
      try {
        final response = await network_api_service.NetworkApiService()
            .getGetApiResponse("getIpFromInternet_$tag", uri);
        if (response != null) {
          return response['ip'];
        }
        return "";
      } catch (e) {
        AppLog.e(e.toString(), error: e, tag: "_getIpFromInternet");
      }
    }
    return null;
  }*/
}

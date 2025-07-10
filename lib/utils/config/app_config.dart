import 'dart:io';

import 'package:bkd/services/helpers/screen_utils.dart';
import 'package:device_info_plus/device_info_plus.dart' as device_info_plus;
import 'package:flutter/foundation.dart';
import 'package:flutter_udid/flutter_udid.dart' deferred as flutter_udid;
import 'package:package_info_plus/package_info_plus.dart'
    deferred as package_info_plus;

import '../../services/helpers/logger_extension.dart';
/*import 'package:sastasundar/data/connection/utils/connection_utils.dart'
    deferred as connection_utils;
import '../data/connection/connection_status.dart'
    deferred as connection_status;
import '../enum/appointment_type_enum.dart';
import '../extension/logger_extension.dart';
import '../service/JsService/provider/js_provider.dart' deferred as js_provider;
import '../storage/local_preferences.dart' deferred as local_preferences;
import '../storage/location_preference.dart' deferred as location_preference;
import '../utils/pincodePicker/utils/pin_code_picker_utils.dart'
    deferred as pin_code_picker_utils;
import '../utils/screen_utils.dart';*/

class AppConfig {
  Future<String> getAppVersion() async {
    await package_info_plus.loadLibrary();
    final packageInfo = await package_info_plus.PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> getAppPackageName() async {
    await package_info_plus.loadLibrary();
    final packageInfo = await package_info_plus.PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  Future<String> getAppVersionCode() async {
    await package_info_plus.loadLibrary();
    final packageInfo = await package_info_plus.PackageInfo.fromPlatform();
    return packageInfo.buildNumber;
  }

/*  Future<String?> _getBrowserId() async {
    try {
      await Future.wait(
          [local_preferences.loadLibrary(), value_handler.loadLibrary()]);
      String? browserId = await local_preferences.LocalPreferences()
          .getString(key: local_preferences.LocalPreferences.browserId);
      if (value_handler.ValueHandler().isTextNotEmptyOrNull(browserId)) {
        return browserId;
      } else {
        await uuid.loadLibrary();
        String v = DateTime.now().microsecondsSinceEpoch.toString();
        String bs64 = value_handler.ValueHandler().stringToBase64(value: v);
        String browserId = uuid.Uuid().v4() + bs64;
        await local_preferences.LocalPreferences().setString(
            key: local_preferences.LocalPreferences.browserId,
            value: browserId);
        return browserId;
      }
    } catch (e) {
      return null;
    }
  }*/

/*  Future<String> getUserAgent() async {
    await js_provider.loadLibrary();
    return js_provider.JsProvider().getUserAgent();
  }*/

  String? getAppType() {
    try {
      if (kIsWeb) {
        return "M";
      } else {
        return Platform.isAndroid
            ? "N"
            : Platform.isIOS
                ? "I"
                : "";
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  String? getOsName() {
    try {
      if (kIsWeb) {
        return "web";
      } else {
        return Platform.operatingSystem;
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

/*  Future<String?> getPinCode({bool? isPinCodeRequired}) async {
    try {
      await Future.wait([
        pin_code_picker_utils.loadLibrary(),
        location_preference.loadLibrary(),
        value_handler.loadLibrary()
      ]);
      String? pinCode =
          await location_preference.LocationPreference().getPinCode();
      if (isPinCodeRequired == true &&
          !value_handler.ValueHandler().isTextNotEmptyOrNull(pinCode)) {
        pinCode =
            await pin_code_picker_utils.PinCodePickerUtils().pinCodePicker();
      }
      return pinCode;
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }*/

  Future<String?> getDeviceId() async {
    try {
      // if (kIsWeb) {
      //   return await _getBrowserId();
      // }
      await flutter_udid.loadLibrary();
      String? deviceId;

      deviceId = await flutter_udid.FlutterUdid.udid;
      return deviceId;
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<String?> getDeviceName() async {
    if (kIsWeb) {
      final deviceInfo = device_info_plus.DeviceInfoPlugin();
      final webInfo = await deviceInfo.webBrowserInfo;
      return '${webInfo.browserName.name} - ${webInfo.platform}';
    } else if (Platform.isAndroid) {
      final deviceInfo = device_info_plus.DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.model;
    } else {
      final deviceInfo = device_info_plus.DeviceInfoPlugin();
      final iosInfo = await deviceInfo.iosInfo;

      return iosInfo.utsname.machine;
    }
  }

  Future<String?> getDeviceOsInfo() async {
    if (kIsWeb) {
      final deviceInfo = device_info_plus.DeviceInfoPlugin();
      final webInfo = await deviceInfo.webBrowserInfo;
      return '${webInfo.platform} ${webInfo.userAgent}';
    } else if (Platform.isAndroid) {
      final deviceInfo = device_info_plus.DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.release;
    } else {
      final deviceInfo = device_info_plus.DeviceInfoPlugin();
      final iosInfo = await deviceInfo.iosInfo;

      return iosInfo.systemVersion;
    }
  }

  String getDeviceWidth() {
    try {
      return ScreenUtils.aw().toString();
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return "";
  }

  String getDeviceHeight() {
    try {
      return ScreenUtils.ah().toString();
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return "";
  }

/*  Future<String> getNetworkInfo() async {
    await connection_status.loadLibrary();
    final connectionStatus = ConnectionStatus.getInstance;
    String networkInfo = await connectionStatus.getNetworkInfo();
    return networkInfo;
  }*/

  String getDevice() {
    return kIsWeb
        ? ""
        : Platform.isAndroid
            ? "2"
            : "4";
  }

// Future<String?> getBrowserId() async {
//   return await _getBrowserId();
// }

/*  Future<String?> getWifiIpV4() async {
    await connection_utils.loadLibrary();
    return await connection_utils.ConnectionUtils().getIpV4();
  }

  Future<String?> getWifiIpV6() async {
    await connection_utils.loadLibrary();
    return await connection_utils.ConnectionUtils().getIpV6();
  }*/

/*  Future<Position?> getCurrentPosition({bool? handleDeniedForever}) async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied.');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        if (kIsWeb || handleDeniedForever != true) {
          permission = await Geolocator.requestPermission();
        } else {
          await Geolocator.openAppSettings();
          permission = await Geolocator.checkPermission();
        }
        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
      }

      return await Geolocator.getCurrentPosition();
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
      return Future.error(e, stacktrace);
    }
  }*/
}

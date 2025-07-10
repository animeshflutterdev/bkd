import 'dart:convert';

import '../../helpers/logger_extension.dart';
import '../helper/js_helper.dart';

class JsProvider {
  JSHelper jsHelper = JSHelper();

  Future<String?> loadJsAndPassValueWithCallbackAsync(
      {required String value}) async {
    String jsPath = "assets/js/test_process_value.js";
    try {
      return await jsHelper.loadJs<String>(
          jsPath: jsPath,
          jsFunctionName: 'processValueWithCallback',
          jsFunctionArgs: [value],
          usePromise: false);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future<void> setVolume(double volume) async {
    try {
      String jsPath = "assets/js/volume.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'setVolumeFunction',
          jsFunctionArgs: [volume]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    //setVolumeFunction(volume)
  }

  Future<void> changeUrl({required String path}) async {
    try {
      String jsPath = "assets/js/change_url.js";
      await jsHelper.loadJs(
          jsPath: jsPath, jsFunctionName: 'changeUrl', jsFunctionArgs: [path]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<String?> getDeviceId() async {
    String jsPath = "assets/js/device_id.js";
    try {
      return await jsHelper.loadJs<String>(
          jsPath: jsPath,
          jsFunctionName: 'getDeviceIdFunction',
          usePromise: true);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
    return null;
  }

  Future paytm(
      {required String txnToken,
      required String orderId,
      required String amount,
      required String mid}) async {
    try {
      String jsPath = "assets/js/paytm.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'paytm',
          jsFunctionArgs: [txnToken, orderId, amount, mid],
          usePromise: true);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> submitForm(
      {required String actionUrl,
      required String obj,
      required String id}) async {
    try {
      String jsPath = "assets/js/submit_form.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'submitFormFunction',
          jsFunctionArgs: [actionUrl, obj, id]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> loadJs({required String jsPath, String? id}) async {
    try {
      await jsHelper.loadJs(jsPath: jsPath, id: id);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> faceBookTrackEvent(
      {required String eventName, Map<String, dynamic>? params}) async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'trackEvent',
          jsFunctionArgs: [eventName, params ?? {}]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> faceBookLogPurchaseEvent(
      {required String currency,
      required double value,
      Map<String, dynamic>? params}) async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'logPurchaseEvent',
          jsFunctionArgs: [currency, value, params ?? {}]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> facebookSetUserID({required String userId}) async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'setFacebookUserID',
          jsFunctionArgs: [userId]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> facebookClearUserID() async {
    try {
      String jsPath = "assets/js/facebook_track_event.js";
      await jsHelper.loadJs(
          jsPath: jsPath, jsFunctionName: 'clearFacebookUserID');
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> webengageLogin({required String userId}) async {
    try {
      String jsPath = "assets/js/webengage.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'webengageLogin',
          jsFunctionArgs: [userId]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> webengageLogout() async {
    try {
      String jsPath = "assets/js/webengage.js";
      await jsHelper.loadJs(jsPath: jsPath, jsFunctionName: 'webengageLogout');
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> webengageUserSetAttribute(
      {required String key, required dynamic value}) async {
    try {
      String jsPath = "assets/js/webengage.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'webengageUserSetAttribute',
          jsFunctionArgs: [key, value.toString()]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> webengageTrackEvent(
      {required String eventName, Map<String, dynamic>? data}) async {
    try {
      String jsPath = "assets/js/webengage.js";
      await jsHelper.loadJs(
          jsPath: jsPath,
          jsFunctionName: 'webengageTrack',
          jsFunctionArgs: [eventName, json.encode(data)]);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  String getUserAgent() {
    return jsHelper.getUserAgent();
  }
}

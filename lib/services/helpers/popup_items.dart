import 'dart:io';

import 'package:bkd/route/context_service.dart';
import 'package:bkd/utils/config/app_config.dart';
import 'package:bkd/services/custom_widgets/custom_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/color_const.dart';
import '../../utils/constants/hex_color.dart';
import '../custom_widgets/custom_button.dart';
import '../custom_widgets/custom_text.dart';
import 'logger_extension.dart';

class PopUpItems {
  void showDialogWithMessage(String msg) {
    showDialog(
        context: CurrentContext().context,
        builder: (BuildContext context) {
          return Dialog(
              insetPadding: const EdgeInsets.all(5.0),
              child: Container(
                // padding: new EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: CustomTextEnum(msg, color: Colors.black).textSM(),
              ));
        });
  }

  Future<void> cupertinoPopup({
    String? title,
    required void Function()? cancelBtnPresses,
    required void Function()? okBtnPressed,
    String? content,
    String? cancelBtnText,
    String? okBtnText,
  }) async {
    String? result = await showCupertinoDialog<String>(
      context: CurrentContext().context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoTheme(
        data: const CupertinoThemeData(brightness: Brightness.light),
        child: CupertinoAlertDialog(
          title: title != null
              ? CustomText(title, color: Colors.black, size: 14)
              : null,
          content: content != null
              ? CustomHtmlText(content,
                  color: HexColor.fromHex(ColorConst.primaryDark), size: 14)
              : CustomText(content ?? "",
                  color: HexColor.fromHex(ColorConst.primaryDark), size: 14),
          actions: <Widget>[
            if (cancelBtnPresses != null)
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: CustomText(cancelBtnText ?? "Cancel",
                    color: Colors.black, size: 14),
              ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context, "Yes");
              },
              child:
                  CustomText(okBtnText ?? "Ok", color: Colors.black, size: 14),
            ),
          ],
        ),
      ),
    );
    if (result == "Yes") {
      if (okBtnPressed != null) {
        okBtnPressed();
      }
    } else {
      if (cancelBtnPresses != null) {
        cancelBtnPresses();
      }
    }
  }

  void toastMessage({
    int? durationSeconds,
    required String message,
    required int status,
  }) {
    /// status = 1 => success
    /// status = 2 => warning
    /// status = 3 => error
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: durationSeconds ?? 300),
      content: CustomContainer(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        color: HexColor.fromHex(status == 1
            ? "#ECFDF3"
            : status == 2
                ? "#FFFDF5"
                : "#FEF3F2"),
        borderRadius: BorderRadius.circular(8),
        borderColor: HexColor.fromHex(status == 1
            ? "#039855"
            : status == 2
                ? "#FA7800"
                : "#D92D20"),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: CustomTextEnum(message,
                        color: HexColor.fromHex(ColorConst.accent_2_70),
                        textAlign: TextAlign.start)
                    .textMediumXS(),
              ),
            ),
            CustomContainer(
              color: Color(0xfff4f4f4),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              padding: EdgeInsets.all(2),
              child: CustomIconButton(
                icon:
                    const Icon(Icons.close, color: Color(0xff4f4f4f), size: 18),
                splashColor: Colors.white,
                padding: EdgeInsets.zero,
                onPressed: () {
                  ScaffoldMessenger.of(CurrentContext().context)
                      .hideCurrentSnackBar();
                },
              ),
            ),
          ],
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
    );

    ScaffoldMessenger.of(CurrentContext().context).showSnackBar(snackBar);
  }

  Future<void> popUpAlert({
    required BuildContext context,
    String title = "",
    required Function()? cancelBtnPresses,
    required Function()? okBtnPressed,
    String content = "",
    String cancelBtnText = "",
    String okBtnText = "",
  }) async {
    await showCupertinoDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: CustomTextEnum(title).textSM(),
        content: CustomTextEnum(title).textXS(),
        actions: <Widget>[
          CupertinoDialogAction(
            onPressed: cancelBtnPresses,
            child: CustomTextEnum(
                    cancelBtnText.isEmpty ? 'Cancel' : cancelBtnText,
                    color: Colors.black)
                .textSM(),
          ),
          CupertinoDialogAction(
            onPressed: okBtnPressed,
            child: CustomTextEnum(okBtnText.isEmpty ? 'Ok' : okBtnText,
                    color: Colors.black)
                .textXS(),
          ),
        ],
      ),
    );
  }

  /// ios app update
  showAppUpdateDialogue(BuildContext context,
      {required String title,
      required String content,
      required void Function()? onPressedOk,
      required void Function()? onPressedCancel,
      required void Function()? onPressedIgnore}) {
    return showCupertinoDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: CustomTextEnum(title).textSM(),
              content: CustomTextEnum(content).textSM(),
              actions: <Widget>[
                Visibility(
                  visible: !AppUpdate().isAppUpdateMandatory(),
                  child: CupertinoDialogAction(
                    onPressed: onPressedIgnore,
                    child: CustomTextEnum('Maybe Later').textSM(),
                  ),
                ),
                Visibility(
                  visible: AppUpdate().isAppUpdateMandatory(),
                  child: CupertinoDialogAction(
                    onPressed: onPressedCancel,
                    child: CustomTextEnum('Cancel').textSM(),
                  ),
                ),
                CupertinoDialogAction(
                  onPressed: onPressedOk,
                  child: CustomTextEnum('Update').textSM(),
                ),
              ],
            ));
  }

  Future<void> appUpdateCheck() async {
    try {
      if (!kIsWeb) {
        String appUpdateTimeCheckKey = "app_update_time_check_string";
        SharedPreferences? prefs = await SharedPreferences.getInstance();
        String? appUpdateCheckTime = prefs.getString(appUpdateTimeCheckKey);
        bool timeDifferance = false;
        if (appUpdateCheckTime != null) {
          timeDifferance = DateTime.now()
                  .difference(DateTime.parse(appUpdateCheckTime))
                  .inHours >
              24;
        } else {
          timeDifferance = true;
        }
        final status = await NewVersionPlus(
                iOSAppStoreCountry: "IN", androidPlayStoreCountry: "en_IN")
            .getVersionStatus();
        // String currentLiveVersion =
        //     "${await AppConfigPref().getConfigDataByKey("CurrentLiveVersion")}";
        // String isAppUpdateMandatory =
        //     "${await AppConfigPref().getConfigDataByKey("IsAppUpdateMandatory")}";

        String currentLiveVersion = "1.0.0";
        String isAppUpdateMandatory = "N";

        VersionStatus versionStatus = VersionStatus(
            localVersion: "${await AppConfig().getAppVersion()}",
            storeVersion: currentLiveVersion,
            appStoreLink: status?.appStoreLink ?? "",
            releaseNotes: status?.releaseNotes ?? "",
            originalStoreVersion: currentLiveVersion);

        bool data = versionStatus.canUpdate;

        AppLog.i('canUpdate $data');

        if (data && (timeDifferance || isAppUpdateMandatory == "Y")) {
          await prefs.setString(
              appUpdateTimeCheckKey, DateTime.now().toString());
          if (Platform.isIOS) {
            PopUpItems().showAppUpdateDialogue(
              CurrentContext().context,
              title: 'App Update',
              content: "AppEnglishTexts().txt_app_update_mandetory",
              onPressedIgnore: () {
                Navigator.of(CurrentContext().context).pop();
              },
              onPressedCancel: () {
                isAppUpdateMandatory == "N"
                    ? CurrentContext().context.pop()
                    : FlutterExitApp.exitApp(iosForceExit: false);
              },
              onPressedOk: () {
                // RSTextUtils().launchingUrl(status!.appStoreLink.toString());
              },
            );
          } else if (Platform.isAndroid) {
            isAppUpdateMandatory == "N"
                ? checkForFlexibleUpdateAndUpdate()
                : checkForImmediateUpdateAndUpdate();
          }
        }
      }
    } catch (e, stack) {
      AppLog.e("appUpdateCheck--> ${e.toString()}",
          stackTrace: stack, error: e);
    }
  }

  Future<void> checkForFlexibleUpdateAndUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
          print('startFlexibleUpdate $appUpdateResult');
          if (appUpdateResult == AppUpdateResult.success) {
            //App Update successful
            InAppUpdate.completeFlexibleUpdate();
          }
          /*InAppUpdate.completeFlexibleUpdate().then((_) {
            showSnack("Success!");
          }).catchError((e) {
            showSnack(e.toString());
          });*/
        }).catchError((e) {
          showSnack(e.toString());
        });
      }
    }).catchError((e) {
      AppLog.e(e.toString());
      showSnack(e.toString());
    });
  }

  Future<void> checkForImmediateUpdateAndUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        InAppUpdate.performImmediateUpdate().then((onValue) async {
          if (onValue == AppUpdateResult.userDeniedUpdate) {
            await SystemNavigator.pop();
          }
        }).catchError((e) {
          showSnack(e.toString());
        });
      }
    }).catchError((e) {
      AppLog.e(e.toString());
      showSnack(e.toString());
    });
  }

  void showSnack(String text, {Color? backgroundColor, int? durationSeconds}) {
    ScaffoldMessenger.of(CurrentContext().context).showSnackBar(SnackBar(
        duration: Duration(seconds: durationSeconds ?? 2),
        backgroundColor: backgroundColor,
        content: CustomHtmlText(text, size: 12)));
  }

  /// ------------------------
  popUpAlertNoTitle(
      {required BuildContext context,
      required Function()? onPressedOk,
      bool? canPop,
      String content = "",
      String firstBtn = ""}) {
    showCupertinoDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => PopScope(
        canPop: canPop ?? true,
        child: CupertinoAlertDialog(
          content: CustomTextEnum(content).textSM(),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onPressedOk,
              child: CustomTextEnum(
                firstBtn.isEmpty ? 'Ok' : firstBtn,
              ).textSM(),
            ),
          ],
        ),
      ),
    );
  }
}

class AppUpdate {
  bool isAppUpdateMandatory() {
    return false;
  }
}

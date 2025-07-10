import 'package:in_app_review/in_app_review.dart' deferred as in_app_review;
// import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'helpers/logger_extension.dart';

// import '../widget/pdf_viewer_widget.dart' deferred as pdf_viewer_widget;

class OpenService {
  void openWhatsApp({required String contactNo, String? message}) {
    try {
      Uri whatsAppUrl = Uri.parse('https://wa.me/$contactNo')
          .replace(queryParameters: message != null ? {"text": message} : null);
      openUrl(uri: whatsAppUrl, mode: LaunchMode.externalApplication);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  void callNumber({
    required String contactNo,
  }) {
    try {
      Uri callUrl = Uri(scheme: 'tel', path: contactNo);
      openUrl(uri: callUrl, mode: LaunchMode.externalApplication);
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Future<void> openUrl(
      {required Uri uri, LaunchMode mode = LaunchMode.platformDefault}) async {
    try {
      AppLog.i("OpenUrl==> $uri");
      await launchUrl(uri, mode: mode);
    } catch (e) {
      AppLog.e('Could not launch $uri', error: e);
    }
  }

  Future<void> requestReview() async {
    try {
      await in_app_review.loadLibrary();
      final inAppReview = in_app_review.InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

/*  Future<void> openFile(String filePath) async {
    await open_file.loadLibrary();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    await Permission.accessMediaLocation.request();
    await open_file.OpenFile.open(filePath);
  }

  Future<ShareResultStatus> share({required String text}) async {
    final result = await Share.share(text);
    return result.status;
  }

  Future<void> openPdf({required String pdfUrl, String? title}) async {
    await pdf_viewer_widget.loadLibrary();
    Navigator.push(
      CurrentContext().context,
      MaterialPageRoute(
        builder: (context) => pdf_viewer_widget.PdfViewerWidget(
          pdfUrl: pdfUrl,
          title: title,
        ),
      ),
    );
  }*/
}

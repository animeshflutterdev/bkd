import 'dart:io';
import 'dart:typed_data';

import 'package:bkd/services/helpers/value_handler.dart';

import '../logger_extension.dart';

class FileUtils {
  final validExtensions = ['.png', '.jpg', '.jpeg', '.pdf', '.doc'];

  bool isValidImageType(String filePath) {
    try {
      if (ValueHandler().isTextNotEmptyOrNull(filePath)) {
        final String extension = filePath.toLowerCase().split('.').last;
        // AppLogV2.d('isValidImageType_file $filePath');
        return validExtensions.contains('.$extension');
      }
    } catch (e) {
      AppLog.e('Error in isValidImageType:',
          error: e, stackTrace: StackTrace.current);
    }
    return false;
  }

  bool isValidSVGImage(String imageURL) {
    try {
      if (ValueHandler().isTextNotEmptyOrNull(imageURL)) {
        String lastString = imageURL.split("/").last;
        if (lastString.toLowerCase().contains("svg")) {
          return true;
        }
      }
    } catch (e) {
      AppLog.e('Error in validSVGImage:',
          error: e, stackTrace: StackTrace.current);
    }
    return false;
  }

  bool isPDFFile(String filePath) {
    final String extension = filePath.toLowerCase().split('.').last;
    AppLog.e('isPDFFile $extension');
    return ".pdf".contains('.$extension');
  }

  String getFileExtension(String filePath) {
    return filePath.toLowerCase().split('.').last;
  }

  double getImageSizeInMB(File file) {
    final fileSizeInBytes = file.lengthSync();
    final fileSizeInMB = fileSizeInBytes / (1024 * 1024);
    AppLog.e('getImageSizeInMB $fileSizeInMB $fileSizeInBytes');
    return fileSizeInMB;
  }

  // Future<double> getImageSizeInMBWeb(String filePath) async {
  // await network_api_service.loadLibrary();
  // Uint8List? sizeInBytes =
  //     await network_api_service.NetworkApiService().urlToByte(url: filePath);
  // final double sizeInKB = sizeInBytes.lengthInBytes / 1024;
  // double sizeInMB = sizeInKB / 1024;
  // AppLog.e('getImageSizeInMBWeb $sizeInMB');
  // return sizeInMB;
  // }

  double getImageSizeInMBWebFromBytes(Uint8List? bytes) {
    if (bytes == null) return 0;
    final double sizeInKB = bytes.lengthInBytes / 1024;
    double sizeInMB = sizeInKB / 1024;
    AppLog.e('getImageSizeInMBWebFromBytes $sizeInMB');
    return sizeInMB;
  }

  bool isValidImageTypeWeb(String imageType) {
    String extension = '';
    if (imageType.contains('/')) {
      extension = imageType.toLowerCase().split('/').last;
    } else {
      extension = imageType.toLowerCase().split('.').last;
    }
    AppLog.e('isValidImageTypeWeb $extension');
    return validExtensions.contains('.$extension');
  }
}

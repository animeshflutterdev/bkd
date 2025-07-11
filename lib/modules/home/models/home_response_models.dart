import 'package:bkd/services/helpers/logger_extension.dart';

class HomePageResponse {
  String? message;
  int? totalPageCount;
  int? expectedResultSet;
  List<Map<String, dynamic>>? data;

  HomePageResponse({this.message, this.totalPageCount, this.data});

  HomePageResponse.fromJson(Map<String, dynamic> json) {
    try {
      message = json['message'];
      totalPageCount = json['total_page_count'];
      expectedResultSet = json['expected_result_set'];
      if (json['data'] != null) {
        data = <Map<String, dynamic>>[];
        json['data'].forEach((v) {
          if (v is Map<String, dynamic>) {
            data!.add(v);
          }
        });
      }
    } catch (e, stacktrace) {
      AppLog.e(e.toString(), error: e, stackTrace: stacktrace);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['total_page_count'] = totalPageCount;
    data['expected_result_set'] = expectedResultSet;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v).toList();
    }
    return data;
  }
}

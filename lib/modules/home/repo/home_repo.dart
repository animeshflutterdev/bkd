import 'dart:convert';
import 'package:bkd/api_services/temp_api_data.dart';
import '../models/home_response_models.dart';

class HomeRepo {
  // This class can be used to manage home-related data and operations.

  // Fetch home data from API
  Future<HomePageResponse?> fetchHomeData({
    int? pageNo,
    int? recordPerPage,
    Map<String, String>? headers,
  }) async {
    String endpoint = '/home';
    List<String> queryParams = [];
    if (pageNo != null) queryParams.add('pageNo=$pageNo');
    if (recordPerPage != null) queryParams.add('recordperpage=$recordPerPage');
    if (queryParams.isNotEmpty) {
      endpoint += '?${queryParams.join('&')}';
    }
    // final response = await ApiService.get(endpoint, headers: headers);
    const tempResp = TempApiData.SDUIResponse;
    final data = json.decode(tempResp);
    HomePageResponse? homePageData = HomePageResponse.fromJson(data);
    return homePageData;
  }
}

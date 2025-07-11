part of 'home_bloc.dart';

class HomeState extends Equatable {
  final DynamicBlocData<List<Widget>> widgetList;
  final DynamicBlocData<HomePageResponse> homeSduiResponse;
  final DynamicBlocData<int> pageNo;
  final DynamicBlocData<bool> isHide;
  final DynamicBlocData<List<Map<String, dynamic>>> data;

  const HomeState(
      {required this.widgetList,
        required this.homeSduiResponse,
        required this.pageNo,
        required this.isHide,
        required this.data});

  HomeState copyWith(
      {DynamicBlocData<List<Widget>>? widgetList,
        DynamicBlocData<HomePageResponse>? homeSduiResponse,
        DynamicBlocData<int>? pageNo,
        DynamicBlocData<bool>? isHide,
        DynamicBlocData<List<Map<String, dynamic>>>? data}) {
    return HomeState(
        widgetList: widgetList ?? this.widgetList,
        homeSduiResponse: homeSduiResponse ?? this.homeSduiResponse,
        pageNo: pageNo ?? this.pageNo,
        isHide: isHide ?? this.isHide,
        data: data ?? this.data);
  }

  @override
  List<Object> get props => [
    widgetList.status,
    homeSduiResponse.status,
    pageNo.status,
    isHide.status,
    data.status
  ];
}

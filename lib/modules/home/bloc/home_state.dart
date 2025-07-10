part of 'home_bloc.dart';

class HomeState extends Equatable {
  final DynamicBlocData<HomePageResponse?> homePageResponse;

  const HomeState({
    required this.homePageResponse,
  });

  HomeState copyWith({
    DynamicBlocData<HomePageResponse?>? response,
  }) {
    return HomeState(
      homePageResponse: response ?? homePageResponse,
    );
  }

  @override
  List<Object> get props => [
        homePageResponse.status,
      ];
}

part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class InitHome extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class GetData extends HomeEvent {
  const GetData({this.needFurtherCall});

  final bool? needFurtherCall;

  @override
  List<Object?> get props => [];
}

class AddWidget extends HomeEvent {
  const AddWidget({required this.widget});

  final Widget widget;

  @override
  List<Object?> get props => [];
}
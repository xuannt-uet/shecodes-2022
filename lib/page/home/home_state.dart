part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoaded extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadFailed extends HomeState {

  HomeLoadFailed();

  @override
  List<Object?> get props => [];
}

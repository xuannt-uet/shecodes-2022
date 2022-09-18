part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class Authenticated extends SplashState {}

class NotAuthenticated extends SplashState {}

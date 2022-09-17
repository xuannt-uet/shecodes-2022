part of 'register_cubit.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterFailed extends RegisterState {
  final String message;

  RegisterFailed(this.message);

  @override
  List<Object?> get props => [message];
}

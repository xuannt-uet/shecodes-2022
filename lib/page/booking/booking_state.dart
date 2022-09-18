part of 'booking_cubit.dart';

@immutable
abstract class BookingState extends Equatable {}

class BookingInitial extends BookingState {
  @override
  List<Object?> get props => [];
}

class BookingLoading extends BookingState {
  @override
  List<Object?> get props => [];
}

class BookingSuccess extends BookingState {
  @override
  List<Object?> get props => [];
}

class BookingFailed extends BookingState {
  final String message;

  BookingFailed(this.message);

  @override
  List<Object?> get props => [message];
}

import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  final String message;
  const Failure({this.message = 'An unexpected error occurred'});
}

final class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Network error. Check your connection.'});
  @override
  List<Object?> get props => [message];
}

final class ServerFailure extends NetworkFailure {
  const ServerFailure({super.message = 'Server error. Please try again.'});
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({super.message = 'Session expired. Please login again.'});
  @override
  List<Object?> get props => [message];
}

final class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Local data error.'});
  @override
  List<Object?> get props => [message];
}

final class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

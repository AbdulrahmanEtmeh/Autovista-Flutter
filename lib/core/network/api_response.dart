import 'package:graduation_project/core/class/status_request.dart';

sealed class ApiResponse<T> {
  const ApiResponse();

  bool get isSuccess => this is ApiSuccess<T>;
  bool get isFailure => this is ApiFailure<T>;

  R when<R>({
    required R Function(ApiSuccess<T> success) success,
    required R Function(ApiFailure<T> failure) failure,
  }) {
    final response = this;
    if (response is ApiSuccess<T>) {
      return success(response);
    }
    return failure(response as ApiFailure<T>);
  }
}

class ApiSuccess<T> extends ApiResponse<T> {
  final T data;
  final int? statusCode;

  const ApiSuccess(this.data, {this.statusCode});
}

class ApiFailure<T> extends ApiResponse<T> {
  final StatusRequest statusRequest;
  final String? message;
  final int? statusCode;
  final Object? error;

  const ApiFailure({
    required this.statusRequest,
    this.message,
    this.statusCode,
    this.error,
  });
}

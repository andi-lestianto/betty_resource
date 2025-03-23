class ApiResponse<T> {
  Status? status;
  String? message;
  T? data;

  ApiResponse(this.status, this.message, this.data);

  ApiResponse.initial() : status = Status.initial;

  ApiResponse.loading() : status = Status.loading;

  ApiResponse.completed({required this.data}) : status = Status.completed;

  ApiResponse.error({required this.message, this.data}) : status = Status.error;
}

enum Status { initial, loading, completed, error }

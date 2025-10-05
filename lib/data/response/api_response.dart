import 'package:flutter_mvvm_architecture/data/response/status.dart';

class ApiResponse<T> {
  String? message;
  Status? status;
  T? data;

  ApiResponse([this.status, this.message, this.data]);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return 'Status: $status \n, Message: $message \n, Data: $data \n';
  }
}

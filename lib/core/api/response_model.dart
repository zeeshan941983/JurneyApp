import 'dart:convert';

class ResponseModel {
  final bool error;
  final int? statusCode;
  final dynamic body;
  final dynamic header;
  final String? message;

  ResponseModel({
    required this.error,
    this.statusCode,
    this.body,
    this.header,
    this.message,
  });

  ResponseModel.empty()
      : error = true,
        statusCode = null,
        body = null,
        message = null,
        header = null;

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      error: json['error'],
      statusCode: json['statusCode'],
      body: json['body'],
      header: json['header'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'statusCode': statusCode,
      'body': body,
      'header': header,
      'message': message,
    };
  }

  @override
  String toString() {
    return 'ResponseModel(error: $error, statusCode: $statusCode, header: $header, body: $body, message: $message)';
  }
}

dynamic convertStringToJson(String jsonString) {
  return jsonDecode(jsonString);
}

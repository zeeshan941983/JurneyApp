import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ibiza/core/api/response_model.dart';

class APIRequests {
  static bool isdynamic = false;
  static Future<ResponseModel> makePostRequestlogin(
    String url,
    Map<String, String> headers,
    Map<String, String> body, {
    int? expectedStatus = 200,
  }) async {
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.bodyFields = body;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      String responseBody = await response.stream.bytesToString();
      log(response.statusCode.toString());
      log(responseBody);

      if (response.statusCode == expectedStatus) {
        return ResponseModel(
          error: false,
          statusCode: response.statusCode,
          body: json.decode(responseBody),
        );
      } else {
        return ResponseModel(
          error: true,
          statusCode: response.statusCode,
          body: json.decode(responseBody),
          message: 'Failed to load data: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return ResponseModel(
        error: true,
        statusCode: null,
        body: null,
        message: e.toString(),
      );
    }
  }

  static Future<ResponseModel> makePostRequest(
    String url,
    Map<String, String> headers,
    Map<String, dynamic> body, {
    int? expectedStatus = 200,
  }) async {
    try {
      var request = http.Request('POST', Uri.parse(url));
      request.headers.addAll(headers);
      request.body = json.encode(body);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      log(response.statusCode.toString());
      log(responseBody);

      if (response.statusCode == expectedStatus) {
        return ResponseModel(
          error: false,
          statusCode: response.statusCode,
          body: json.decode(responseBody),
        );
      } else {
        return ResponseModel(
          error: true,
          statusCode: response.statusCode,
          body: json.decode(responseBody),
          message: 'Failed to load data: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      return ResponseModel(
        error: true,
        statusCode: null,
        body: null,
        message: e.toString(),
      );
    }
  }

  static Future<ResponseModel> makeGetRequest(
    String url,
    Map<String, String> headers,
    Map<String, String> body, {
    int? expectedStatusCode = 200,
  }) async {
    try {
      var request = http.Request('GET', Uri.parse(url));
      request.bodyFields = body;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      if (response.statusCode == expectedStatusCode) {
        return ResponseModel(
          error: false,
          body: json.decode(responseBody),
          message: 'API Hit Succesfully',
          header: response.headers,
          statusCode: response.statusCode,
        );
      } else {
        return ResponseModel(
          error: true,
          body: responseBody,
          message: 'Failed to load data: ${response.reasonPhrase}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return ResponseModel(
        error: true,
        body: null,
        message: '$e',
        statusCode: null,
      );
    }
  }

  static Future<ResponseModel> makeDeleteRequest(
    String url,
    Map<String, String> headers,
    Map<String, String> body, {
    int? expectedStatusCode = 200,
  }) async {
    try {
      var request = http.Request('DELETE', Uri.parse(url));
      request.bodyFields = body;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      log(response.statusCode.toString());
      log(responseBody);

      if (response.statusCode == expectedStatusCode) {
        return ResponseModel(
          error: false,
          body: json.decode(responseBody),
          message: 'Account Deleted',
          statusCode: response.statusCode,
        );
      } else {
        return ResponseModel(
          error: true,
          body: responseBody,
          message: 'Failed to load data: ${response.reasonPhrase}',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return ResponseModel(
        error: true,
        body: null,
        message: 'Account Deleted Failed: $e',
        statusCode: null,
      );
    }
  }
}

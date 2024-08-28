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
    Map body, {
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

  static Future<ResponseModel> makeMultipartPostRequest(
    String url,
    String? token,
    Map<String, String> fields,
    List<http.MultipartFile> files,
  ) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url))
        ..headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer $token',
        })
        ..fields.addAll(fields)
        ..files.addAll(files);

      http.StreamedResponse streamedResponse = await request.send();
      http.Response response = await http.Response.fromStream(streamedResponse);

      return ResponseModel(
        error: response.statusCode != 201,
        statusCode: response.statusCode,
        body: jsonDecode(response.body),
        header: response.headers,
        message: response.reasonPhrase,
      );
    } catch (e) {
      return ResponseModel(
        error: true,
        statusCode: null,
        body: null,
        header: null,
        message: e.toString(),
      );
    }
  }
  // static Future<ResponseModel> makeMultipartPostRequest(
  //   String url,
  //   Map<String, String> headers,
  //   Map<String, String> fields,
  //   List<http.MultipartFile> files,
  // ) async {
  //   try {
  //     var request = http.MultipartRequest('POST', Uri.parse(url));
  //     request.headers.addAll(headers);
  //     request.fields.addAll(fields);
  //     // fields.forEach((key, value) {
  //     //   request.fields[key] = value;
  //     // });

  //     request.files.addAll(files);

  //     final streamedResponse = await request.send();
  //     final response = await http.Response.fromStream(streamedResponse);
  //     log(response.body);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       log("sucess");
  //       return ResponseModel(
  //         error: false,
  //         statusCode: response.statusCode,
  //         body: json.decode(response.body),
  //       );
  //     } else {
  //       return ResponseModel(
  //         error: true,
  //         statusCode: response.statusCode,
  //         body: json.decode(response.body),
  //         message: 'Failed to load data: ${response.reasonPhrase}',
  //       );
  //     }
  //   } catch (e) {
  //     return ResponseModel(
  //       error: true,
  //       statusCode: null,
  //       body: null,
  //       message: e.toString(),
  //     );
  //   }
  // }

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

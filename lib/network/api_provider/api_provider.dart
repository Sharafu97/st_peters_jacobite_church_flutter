import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../config/constants.dart';
import 'custom_exception.dart';

class ApiProvider {
  final Map<String, String> _headers = {
    'Accept': 'application/json',
    "Content-Type": "application/json; charset=UTF-8"
  };

  Future<dynamic> getData(String url,
      {Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;
    try {
      final response = await http.get(
        Uri.https(AppConstants.BASEURL, url, queryParameters),
        headers: _headers,
      );

      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic>? formData,
      Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.https(AppConstants.BASEURL, url, queryParameters),
        headers: _headers,
        body: formData,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url,
      {Map<String, dynamic>? queryParameters}) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.https(AppConstants.BASEURL, url, queryParameters),
        headers: _headers,
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postJson(String url, Map<dynamic, dynamic> data) async {
    dynamic responseJson;

    try {
      final response = await http.post(
        Uri.http(AppConstants.BASEURL, url),
        headers: _headers,
        body: json.encode(data),
      );
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body.toString());

      if (responseJson['status'] == 1) {
        return responseJson;
      } else {
        throw Exception(responseJson['message']);
      }
    } else {
      final responseJson = json.decode(response.body.toString());
      throwException(responseJson);
    }
  }
}

void throwException(Map<String, dynamic> data) {
  if (data.containsKey('message')) {
    List message = [];

    if (data['message'].runtimeType.toString().contains('Map')) {
      data['message'].forEach(
        (key, value) {
          if (value.runtimeType.toString().contains('List')) {
            value.forEach((e) => message.add(e));
          } else {
            message.add(value);
          }
        },
      );
    } else {
      message.add(data['message']);
    }

    throw Exception(message.join('\n'));
  } else {
    throw Exception('Error');
  }
}

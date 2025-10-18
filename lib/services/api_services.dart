import 'dart:developer';
import 'package:dio/dio.dart';

class ApiServices {
  ApiServices({required this.key, this.showProgressLoader});

  final String key;
  final bool? showProgressLoader;

  final Dio _client = Dio();
  final int _timeout = 60;
  final String _baseUrl =
      "https://www.binance.com/bapi/futures/v1/friendly/future/";
  Future<dynamic> getRequst({bool isFull = false}) async {
    try {
      _client.options.connectTimeout = Duration(seconds: _timeout);
      _client.options.receiveTimeout = Duration(seconds: _timeout);
      final url = isFull ? key : _baseUrl + key;
      var response = await _client.get(
        url,
        options: Options(headers: await _getHeader()),
      );

      return response.data;
    } on DioException catch (e) {
      log("Dio Error on GET: ${e.message}");
      return "failed";
    } catch (ex) {
      log("General Error on GET: ${ex.toString()}");
      return "failed";
    } finally {}
  }

  Future<dynamic> postRequst(
    Map<String, dynamic> body, {
    bool isFull = false,
  }) async {
    try {
      _client.options.connectTimeout = Duration(seconds: _timeout);
      _client.options.receiveTimeout = Duration(seconds: _timeout);
      final url = isFull ? key : _baseUrl + key;
      log("full: ${url.toString()}");
      var response = await _client.post(
        url,
        data: body,
        options: Options(headers: await _getHeader()),
      );

      return response.data;
    } on DioException catch (e) {
      log("Dio Error on GET: ${e.message}");
      return "failed";
    } catch (ex) {
      log("General Error on GET: ${ex.toString()}");
      return "failed";
    } finally {}
  }

  Future<Map<String, String>> _getHeader() async {
    return {
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Connection': 'keep-alive',
    };
  }
}

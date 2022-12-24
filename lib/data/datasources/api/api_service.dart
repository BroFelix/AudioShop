import 'dart:convert';

import 'package:audioshop/data/datasources/api/api.dart';
import 'package:dio/dio.dart';

class APIService {
  final API api;

  final client = Dio();

  APIService(this.api);

  Future<String> getAccessToken() async {
    final url = api.tokenUri();
    final response = await client.get(url.toString());
    if (response.statusCode == 200) {
      final data = json.decode(response.data);
      if (data != null) return data;
    }
    throw response;
  }

  Future<int> getEndpointData({required String token, required Endpoint endpoint}) async {
    final uri = api.endpointUri(endpoint);
    final response = await client.get(
      uri.toString(),
      queryParameters: {
        'Authorization': 'Basic $token',
      },
    );
    if (response.statusCode == 200) {
      final data = response.data;
      if (data != null) return data;
    }
    throw response;
  }
}

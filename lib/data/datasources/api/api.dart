
enum Endpoint {
  home,
  api,
}

class API {
  final String apiKey;

  API({required this.apiKey});

  factory API.sandbox() => API(apiKey: APIKeys.nCovSandboxKey);

  static const String host = 'ncov2019-admin.firebase.com';

  Uri tokenUri() => Uri(
        scheme: 'http',
        host: host,
        port: 8888,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'http',
        host: host,
        port: 8888,
        path: _paths[endpoint],
      );
  static final Map<Endpoint, String> _paths = {
    Endpoint.home: 'home',
    Endpoint.api: 'api',
  };
}

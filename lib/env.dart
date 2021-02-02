const bool isProduction = bool.fromEnvironment('dart.vm.product');

const Map<String, dynamic> devConfig = {
  'debug': true,
  'baseUrl': 'https://reqres.in/api',
  'urlRedirectStore': '',
  'googleApiKey': '',
  'urlCHPlay': '',
  'urlAppStore': '',
  'oneSignalApiKey': '',
};

const Map<String, dynamic> productionConfig = {
  'debug': false,
  'baseUrl': 'https://reqres.in/api',
  'urlRedirectStore': '',
  'googleApiKey': '',
  'urlCHPlay': '',
  'urlAppStore': '',
  'oneSignalApiKey': '',
};

final Map<String, dynamic> environment = isProduction ? productionConfig : devConfig;

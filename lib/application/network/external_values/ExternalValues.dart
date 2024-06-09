import 'package:todo/application/network/external_values/iExternalValue.dart';

class ExternalValues implements IExternalValues {
  @override
  String getBaseUrlV1() {
    return 'https://dummyjson.com/';
  }

  @override
  String countriesBaseUrl() {
    return "https://countriesnow.space";
  }

  @override
  String getBaseUrl() {
    return 'https://dummyjson.com/';
  }
}

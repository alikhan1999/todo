import 'package:flutter/material.dart';

class CountryStateResponse {
  bool? error;
  String? msg;
  List<States>? states ;
  List<Country>? countries ;
  CountryStateResponse({this.error, this.msg, this.states,this.countries});

  CountryStateResponse.statesFromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if(json['data']!=null)
      {
        states =  List.from((json['data']['states'])).map((e) => States.fromJson(e)).toList();
      }
  }

  CountryStateResponse.countriesFromJson(Map<String, dynamic> json) {
    error = json['error'];
    msg = json['msg'];
    if(json['data']!=null)
      {
        countries =  List.from((json['data'])).map((e) => Country.fromJson(e)).toList();
      }
  }


}



class Country {
  String? countryName;
  String? isoCode;
  String? countryDialCode;
  Image? flag;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Country &&
              runtimeType == other.runtimeType &&
              countryName == other.countryName &&
              isoCode == other.isoCode &&
              countryDialCode == other.countryDialCode &&
              flag == other.flag;

  @override
  int get hashCode => countryName.hashCode ^ isoCode.hashCode ^ countryDialCode.hashCode ^ flag.hashCode;

  @override
  String toString() {
    return 'Country{countryName: $countryName, isoCode: $isoCode, countryDialCode: $countryDialCode, flag: $flag}';
  }

  Country({this.countryName, this.isoCode, this.countryDialCode, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    countryName = json['name'];
    isoCode = json['code'];
    countryDialCode = json['dial_code'];
    flag = Image.asset("assets/flags/${isoCode?.toLowerCase()}.png");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = countryName;
    data['code'] = isoCode;
    data['dial_code'] = countryDialCode;
    return data;
  }
}


class States {
  String? name;
  String? stateCode;

  States({this.name, this.stateCode});

  States.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    stateCode = json['state_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['state_code'] = stateCode;
    return data;
  }
}

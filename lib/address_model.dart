import 'package:coba_rest_api/geo_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  AddressModel(this.street, this.suite, this.city, this.zipcode,this.geo);

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
}
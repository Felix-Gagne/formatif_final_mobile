import 'package:json_annotation/json_annotation.dart';

//IMPORTANT
part 'transfert.g.dart';

//flutter pub run build_runner build

@JsonSerializable()
class RequetePlusGrand{
  RequetePlusGrand();

  int val1 = 0;
  int val2 = 0;

  factory RequetePlusGrand.fromJson(Map<String, dynamic> json) => _$RequetePlusGrandFromJson(json);
  Map<String, dynamic> toJson() => _$RequetePlusGrandToJson(this);
}
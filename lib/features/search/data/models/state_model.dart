import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'state_model.g.dart';

@JsonSerializable()
class StateModel extends Equatable {
  final String id;
  final String value;

  const StateModel({required this.id, required this.value});

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);

  Map<String, dynamic> toJson() => _$StateModelToJson(this);

  @override
  List<Object?> get props => [id, value];
}

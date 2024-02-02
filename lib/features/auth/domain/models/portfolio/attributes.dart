// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_source/dto/dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bitcoin_wallet/features/auth/domain/models/changes.dart';
import 'package:bitcoin_wallet/features/auth/domain/models/portfolio/position_by_type.dart';
import 'package:bitcoin_wallet/features/auth/domain/models/portfolio/total.dart';

import 'position_by_chain.dart';

part 'attributes.g.dart';

@JsonSerializable(createFactory: true)
class AttributesEntity implements DTO {
  @JsonKey(name: 'positions_distribution_by_type')
  final PositionByTypeEntity positionByType;

  @JsonKey(name: 'positions_distribution_by_chain')
  final PositionByChainEntity positionByChain;

  final TotalEntity total;

  final ChangesEntity changes;

  const AttributesEntity({
    required this.positionByType,
    required this.positionByChain,
    required this.total,
    required this.changes,
  });

  factory AttributesEntity.fromJson(Map<String, dynamic> json) =>
      _$AttributesEntityFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AttributesEntityToJson(this);
}

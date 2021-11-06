

import 'package:hive_flutter/adapters.dart';

part 'condition_dao.g.dart';

@HiveType(typeId: 4)
class ConditionDao extends HiveObject{

  @HiveField(0)
  final String text;

  @HiveField(1)
  final String icon;

  @HiveField(2)
  final int code;

  ConditionDao({required this.text, required this.icon, required this.code});

}
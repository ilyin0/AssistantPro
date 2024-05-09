import 'package:hive/hive.dart';

import 'hive_type_id.dart';

part 'data_chat.g.dart';

@HiveType(typeId: HiveTypeId.dataChat)
class DataChat extends HiveObject {
  DataChat({this.title});

  @HiveField(0)
  String? title;
}

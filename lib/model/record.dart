import 'package:freezed_annotation/freezed_annotation.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class Record with _$Record {
  const factory Record({
    String? loginId,
    String? recordName,
    String? regDate,
    String? statusMsg,
  }) = _Record;
  factory Record.fromJson(Map<String, dynamic> json) =>
      _$RecordFromJson(json);
}
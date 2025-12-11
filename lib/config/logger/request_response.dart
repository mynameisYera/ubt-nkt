part of 'l.dart';

/// REQUEST log – отдельный цвет (например, жёлтый)
class _Request extends TalkerLog {
  _Request(String super.message);

  @override
  String get title => 'REQUEST';

  @override
  String? get key => 'REQUEST';

  @override
  AnsiPen get pen => AnsiPen()..xterm(3); // yellow
}

/// RESPONSE log – отдельный цвет (например, голубой)
class _Response extends TalkerLog {
  _Response(String super.message);

  @override
  String get title => 'RESPONSE';

  @override
  String? get key => 'RESPONSE';

  @override
  AnsiPen get pen => AnsiPen()..xterm(6); // cyan / light blue
}



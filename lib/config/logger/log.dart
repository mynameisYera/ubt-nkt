part of 'l.dart';

class _Log extends TalkerLog {
  _Log(String super.message);

  @override
  String get title => 'LOG';

  @override
  String? get key => 'LOG';

  @override
  AnsiPen get pen => AnsiPen()..xterm(7);
}

class _LogWithTitle extends TalkerLog {
  _LogWithTitle(String title, String message) : super(message) {
    logTitle = title;
    logKey = '${title.toUpperCase()}_KEY';
  }

  String logTitle = '';
  String logKey = '';

  @override
  String get title => logTitle;

  @override
  String? get key => logKey;

  @override
  AnsiPen get pen => AnsiPen()..xterm(7);
}

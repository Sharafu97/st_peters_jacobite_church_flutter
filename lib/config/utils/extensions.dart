import 'package:intl/intl.dart';
import 'package:html/parser.dart';

extension StringExtension on String? {
  String dateFormat([String format = 'dd-MM-yyyy']) {
    if (this == null || this!.isEmpty) {
      return '';
    } else {
      final stringDate =
          this!.contains('/') ? this!.replaceAll('/', '-') : this;
      final date = DateTime.parse(stringDate!);
      final dateFormat = DateFormat(format);

      return dateFormat.format(date);
    }
  }

  String parseHtmlString() {
    final document = parse(this);
    final String parsedString =
        parse(document.body?.text).documentElement?.text ?? '-';
    return parsedString;
  }
}

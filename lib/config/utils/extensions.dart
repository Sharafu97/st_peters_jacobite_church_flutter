import 'package:intl/intl.dart';

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
}

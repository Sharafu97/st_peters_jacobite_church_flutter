import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';
import 'package:st_peters_jacobite_church_flutter/theme/text_theme.dart';

class PrayerTimingListTile extends StatelessWidget {
  PrayerTimingListTile({super.key});

  final timeStyle = textTheme.bodySmall?.copyWith();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 3),
          child: Text('HOLY QURBANA', style: textTheme.titleSmall),
        ),
        Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 50, 10),
            decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF.withOpacity(0.5),
                border:
                    Border.all(color: AppColors.brown41210A.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fridays', style: timeStyle),
                    Text('- 06:45 AM\n- 08:00 AM', style: timeStyle),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sundays', style: timeStyle),
                    Text('- 06:45 AM\n- 08:00 AM', style: timeStyle),
                  ],
                ),
              ],
            ))
      ],
    );
  }
}

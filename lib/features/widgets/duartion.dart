import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_wallet/app_data/app_data.dart';

import '../settings/domain/settings_service.dart';

class DurationWidget extends StatefulWidget {
  const DurationWidget({super.key});

  @override
  State<DurationWidget> createState() => _DurationWidgetState();
}

class _DurationWidgetState extends State<DurationWidget> {
  final SettingsService settingsService = SettingsService();
  List<int> duration = [1, 5, 30, 60, 240];
  int selectedDuration = 0;
  @override
  void initState() {
    selectedDuration = settingsService.getDuration()!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppData.colors.nightBottomNavColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(duration[index] > 59
                  ? "${duration[index] ~/ 60} ${"hours".tr()}"
                  : "${duration[index]} ${"minutes".tr()}"),
              Checkbox(
                value: duration[index] == selectedDuration,
                onChanged: (value) => setState(() {
                  selectedDuration = duration[index];
                  settingsService.putDuration(selectedDuration);
                }),
              ),
            ],
          ),
        ),
        itemCount: duration.length,
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_wallet/app_data/app_data.dart';

class NotificationDialogWidget extends StatefulWidget {
  const NotificationDialogWidget({super.key});

  @override
  State<NotificationDialogWidget> createState() => _ThemeDialogWidgetState();
}

class _ThemeDialogWidgetState extends State<NotificationDialogWidget> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppData.colors.nightBottomNavColor,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("notification".tr()),
                Checkbox(
                  value: value,
                  onChanged: (value) => setState(() {
                    this.value = value!;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

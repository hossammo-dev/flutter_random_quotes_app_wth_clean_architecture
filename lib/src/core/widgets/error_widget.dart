import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_ismail/src/config/locale/app_localizations.dart';

import '../utils/colors/colors_manager.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorWidget({super.key, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: ColorsManager.primaryColor,
            size: 100,
          ),
          const SizedBox(height: 15),
          Text(AppLocalizations.of(context)!.translate('something_went_wrong')!,
              style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 15),
          Text(AppLocalizations.of(context)!.translate('try_again')!,
              style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: onPress,
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryColor,
                  padding: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Text(
                  AppLocalizations.of(context)!.translate('reload_screen')!,
                  style: Theme.of(context).textTheme.displayMedium))
        ],
      ),
    );
  }
}

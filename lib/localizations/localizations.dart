import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationBuildContextExt on BuildContext {
  AppLocalizations get localizations {
    return AppLocalizations.of(this)!;
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:home_fit/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get welcome {
    return Intl.message('Welcome', name: 'welcome');
  }

  String get profile{
    return Intl.message('Profile', name: 'profile');
  }

  String get begginer{
    return Intl.message('Begginer', name: 'begginer');
  }

  String get intermediate{
    return Intl.message('Intermediate', name: 'intermediate');
  }

  String get advanced{
    return Intl.message('Advanced', name: 'advanced');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es', 'pt'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

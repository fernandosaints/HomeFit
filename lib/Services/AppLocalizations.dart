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

  String get height{
    return Intl.message('Height', name: 'height');
  }

  String get weight{
    return Intl.message('Weight', name: 'weight');
  }

  String get gender{
    return Intl.message('Gender', name: 'gender');
  }

  String get level{
    return Intl.message('Level', name: 'level');
  }

  String get details{
    return Intl.message('Details', name: 'details');
  }

  String get text1{
    return Intl.message('The begginers guide is for those that workout once a week', name: 'text1');
  }

  String get text2{
    return Intl.message('The intermediate guide is for those that workout 2 or 3 times a week', name: 'text2');
  }
  
  String get text3{
    return Intl.message('The advanceded guide is for those that workout 4 to 6 times a week', name: 'text3');
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

// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tra i leoni`
  String get appName {
    return Intl.message(
      'Tra i leoni',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get saved {
    return Intl.message(
      'Saved',
      name: 'saved',
      desc: '',
      args: [],
    );
  }

  /// `Add to reading list`
  String get saveForLater {
    return Intl.message(
      'Add to reading list',
      name: 'saveForLater',
      desc: '',
      args: [],
    );
  }

  /// `Share this article`
  String get shareThisArticle {
    return Intl.message(
      'Share this article',
      name: 'shareThisArticle',
      desc: '',
      args: [],
    );
  }

  /// `Unsave this article`
  String get unsave {
    return Intl.message(
      'Unsave this article',
      name: 'unsave',
      desc: '',
      args: [],
    );
  }

  /// `Reading list`
  String get readingList {
    return Intl.message(
      'Reading list',
      name: 'readingList',
      desc: '',
      args: [],
    );
  }

  /// `Your reading list is empty`
  String get noSaveds {
    return Intl.message(
      'Your reading list is empty',
      name: 'noSaveds',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get search {
    return Intl.message(
      'Find',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Insert your query...`
  String get insertTextToSearch {
    return Intl.message(
      'Insert your query...',
      name: 'insertTextToSearch',
      desc: '',
      args: [],
    );
  }

  /// `Use dark theme`
  String get darkTheme {
    return Intl.message(
      'Use dark theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Use system theme`
  String get systemTheme {
    return Intl.message(
      'Use system theme',
      name: 'systemTheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get darkThemeTitle {
    return Intl.message(
      'Dark theme',
      name: 'darkThemeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Bocconi University Newspaper`
  String get bocconiUniverisityNewspaper {
    return Intl.message(
      'Bocconi University Newspaper',
      name: 'bocconiUniverisityNewspaper',
      desc: '',
      args: [],
    );
  }

  /// `by `
  String get by {
    return Intl.message(
      'by ',
      name: 'by',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}
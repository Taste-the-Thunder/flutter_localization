import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localization/provider/locale_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';
import 'widget/language_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData( primarySwatch: Colors.blue, ),
        locale: provider.locale,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
          supportedLocales: L10n.all,
          home: const MyHomePage(title: 'Flutter'), );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          LanguagePicker(),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LanguageWidget(),
            Text(AppLocalizations.of(context)!.language),
            SizedBox(height: 8),
            Text(AppLocalizations.of(context)!.helloWorld),
            SizedBox(height: 8),
            Text(AppLocalizations.of(context)!.hello('Dhruvin Prajapati')),
          ],
        ),
      ),
    );
  }
}

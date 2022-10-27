import 'package:flutter/material.dart';
import 'package:flutter_localization/l10n/l10n.dart';
import 'package:provider/provider.dart';

import '../provider/locale_provider.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = Localizations.localeOf(context);
    final flag = L10n.getflag(local.languageCode);
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 72,
        child: Text(
          flag,
          style: TextStyle(fontSize: 80),
        ),
      ),
    );
  }
}


class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale;
    return DropdownButtonHideUnderline(
        child: DropdownButton(
          value: locale,
          icon: Container(width: 12,),
          items: L10n.all.map((locale) {
            final flag = L10n.getflag(locale.languageCode);
            return DropdownMenuItem(
              child: Center(
                child: Text(flag,style: TextStyle(fontSize: 32),),
              ),
              value: locale,
              onTap: (){
                final provider = Provider.of<LocaleProvider>(context, listen: false);
                provider.setLocale(locale);
              },
            );
          }).toList(),
          onChanged: (_){

          },
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:nlp_final_project/homepage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import 'locale/localeString.dart';

void main() {
  initStorage();
  runApp(Home());
}

void initStorage() async {
  await GetStorage.init();
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    var langLocale = Locale('fa','IR');
    if(box.hasData('lang')) {
      if(box.read('lang') == 'en') {
        langLocale = Locale('en','US');
      }
    }
    return GetMaterialApp(
      translations: LocaleString(),
      locale: langLocale,
      debugShowCheckedModeBanner: false,
      fallbackLocale: langLocale,
      home: RecordingScreen(),
    );
  }
}

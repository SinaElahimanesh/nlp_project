import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleString extends Translations{

  static final locale =  Locale('fa', 'IR');

  @override
  Map<String, Map<String, String>> get keys => {

    //ENGLISH LANGUAGE
    'en_US':{
      'title': 'Speech Recognition Application',
      'drawer': 'Speech Recognition',
      'item1': 'Settings',
      'item2': 'About Us',
      'item3': 'Contact Us',
      'text': 'Your voice which is converted to text will be showed in this box!',
      'record_audio': 'By clicking this button you can record your audio.',
      'about_title': 'About Us',
      'about': 'Natural language processing (NLP) is a subfield of linguistics, computer science, and artificial intelligence concerned with the interactions between computers and human language, in particular how to program computers to process and analyze large amounts of natural language data.',
      'contact_title': 'Contact Us',
      'contact1': 'Our Mail',
      'contact2': 'Our LinkedIn Page',
      'contact3': 'Our Website',
      'settings_title': 'Settings',
      'lang_description': 'You can choose the language of the application.',
      'lang_fa': 'Persian',
      'lang_en': 'English',
      'model_description': 'You can choose language models which you want to see the results about.',
      'model1': 'Model number 1',
      'model2': 'Model number 2',
      'model3': 'Google',
      'model1_title': 'Model number 1:  ',
      'model2_title': 'Model number 2:  ',
      'model3_title': 'Google:  ',
      'error': 'There was an error occurred.',
    },

    //PERSIAN LANGUAGE
    'fa_IR':{
      'title': 'برنامه تبدیل صوت به متن',
      'drawer': 'تبدیل صوت به متن',
      'item1': 'تنظیمات',
      'item2': 'درباره ما',
      'item3': 'تماس با ما',
      'text': 'صدای شما که تبدیل به متن شده است، در این قسمت نمایش داده خواهد شد!',
      'record_audio': 'با فشردن این دکمه می توانید صدای خود را ضبط کنید.',
      'about_title': 'درباره ما',
      'about': 'پردازش زبان‌های طبیعی یکی از زیرشاخه‌های بااهمیت در حوزهٔ گستردهٔ علوم رایانه، هوش مصنوعی، که به تعامل بین کامپیوتر و زبان‌های (طبیعی) انسانی می‌پردازد؛ بنا بر این پردازش زبان‌های طبیعی بر ارتباط انسان و رایانه، متمرکز است. پس چالش اصلی و عمده در این زمینه درک زبان طبیعی و ماشینی کردن فرایند درک و برداشت مفاهیم بیان‌شده با یک زبان طبیعیِ انسانی است.',
      'contact_title': 'تماس با ما',
      'contact1': 'ایمیل ما',
      'contact2': 'صفحه لینکداین ما',
      'contact3': 'وبسایت ما',
      'settings_title': 'تنظیمات',
      'lang_description': 'می توانید زبان برنامه را انتخاب نمایید.',
      'lang_fa': 'فارسی',
      'lang_en': 'انگلیسی',
      'model_description': 'می توانید مدل های زبانی که می خواهید نتیجه ی آنها را دریافت کنید، انتخاب نمایید.',
      'model1': 'مدل شماره ۱',
      'model2': 'مدل شماره ۲',
      'model3': 'گوگل',
      'model1_title': 'مدل شماره ۱:  ',
      'model2_title': 'مدل شماره ۲:  ',
      'model3_title': 'گوگل:  ',
      'error': 'یک خطا رخ داده است.',
    },
  };
}
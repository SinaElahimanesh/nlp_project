import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const themeColor = Color(0xfffaa51a);
  static const primaryColor = Color(0xff55c4cd);
  static const secondaryColor = Color(0xff09919a);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _value = false;
  var val;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: SettingsScreen.primaryColor,
        appBar: AppBar(
          backgroundColor: SettingsScreen.themeColor,
          toolbarHeight: 70.0,
          title: Text(
            'title'.tr,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
            ),
          ),
        ),
        body: Center(
            child: Stack(
              children: [
                Container(
                    color: Colors.white,
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                        children: [
                          Text(
                            'settings_title'.tr,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                            ),
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            'lang_description'.tr,
                            style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 30)),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'lang_fa'.tr,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/persian_flag.png',
                                          width: 40.0,
                                        )
                                      ],
                                    ),
                                  ),
                                  leading: Radio(
                                    value: 1,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = value;
                                        Get.updateLocale(Locale('fa', 'IR'));
                                        box.write('lang', 'fa');
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                ),
                                const Divider(
                                  height: 20,
                                  thickness: 2,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'lang_en'.tr,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/english_flag.png',
                                          width: 40.0,
                                        )
                                      ],
                                    ),
                                  ),
                                  leading: Radio(
                                    value: 2,
                                    groupValue: val,
                                    onChanged: (value) {
                                      setState(() {
                                        val = value;
                                        Get.updateLocale(Locale('en', 'US'));
                                        box.write('lang', 'en');
                                      });
                                    },
                                    activeColor: Colors.green,
                                  ),
                                ),
                              ],
                            )
                          )
                        ]
                    )
                ),
                Positioned(
                    bottom: 40,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Text(
                        'Ⓒ 2021 NLP Team'.tr,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 16.5,
                            // fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                        ),
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}

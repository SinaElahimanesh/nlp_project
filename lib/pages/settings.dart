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
  Object? val = 0;
  final box = GetStorage();

  bool model1 = true;
  bool model2 = false;
  bool model3 = false;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    if(box.hasData('model1')) {
      if(box.read('model1') == 'true') {
        model1 = true;
      } else {
        model1 = false;
      }
    }
    if(box.hasData('model2')) {
      if(box.read('model2') == 'true') {
        model2 = true;
      } else {
        model2 = false;
      }
    }
    if(box.hasData('model3')) {
      if(box.read('model3') == 'true') {
        model3 = true;
      } else {
        model3 = false;
      }
    }
    if(box.hasData('lang')) {
      if(box.read('lang') == 'en') {
        val = 1;
      }
    }

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
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                              child: Text(
                                'lang_description'.tr,
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: Colors.black,
                                    fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                ),
                              ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 5)),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
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
                                    value: 0,
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
                                  height: 10,
                                  thickness: 2,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                ListTile(
                                  title: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 15),
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
                                    value: 1,
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
                          ),
                          const Divider(
                            height: 20,
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Padding(padding: EdgeInsets.only(top: 25)),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                            child: Text(
                              'model_description'.tr,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black,
                                  fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 3)),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Checkbox(
                                value: this.model1,
                                onChanged: (value) {
                                  setState(() {
                                    this.model1 = value!;
                                    if(value==true) {
                                      box.write('model1', 'true');
                                    } else {
                                      box.write('model1', 'false');
                                    }
                                  });
                                },
                              ),
                              Text(
                                'model1'.tr,
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: Colors.black,
                                    fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                ),
                              ),
                              SizedBox(width: 5), //SizedBox
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Checkbox(
                                value: this.model2,
                                onChanged: (value) {
                                  setState(() {
                                    this.model2 = value!;
                                    if(value==true) {
                                      box.write('model2', 'true');
                                    } else {
                                      box.write('model2', 'false');
                                    }
                                  });
                                },
                              ),
                              Text(
                                'model2'.tr,
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: Colors.black,
                                    fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                ),
                              ),
                              SizedBox(width: 5), //SizedBox
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: 5,
                              ),
                              Checkbox(
                                value: this.model3,
                                onChanged: (value) {
                                  setState(() {
                                    this.model3 = value!;
                                    if(value==true) {
                                      box.write('model3', 'true');
                                    } else {
                                      box.write('model3', 'false');
                                    }
                                  });
                                },
                              ),
                              Text(
                                'model3'.tr,
                                style: TextStyle(
                                    fontSize: 16.5,
                                    color: Colors.black,
                                    fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                ),
                              ),
                              SizedBox(width: 5), //SizedBox
                            ],
                          ),
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

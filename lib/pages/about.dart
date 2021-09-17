import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  static const themeColor = Color(0xfffaa51a);
  static const primaryColor = Color(0xff55c4cd);
  static const secondaryColor = Color(0xff09919a);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: themeColor,
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
                            'about_title'.tr,
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
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Text(
                            'about'.tr,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 16.0,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                            ),
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

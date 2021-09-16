import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

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
                fontSize: 20.0,
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
                            'contact_title'.tr,
                            style: TextStyle(
                                fontSize: 20.0,
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
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            child: FlatButton(
                                height: 70.0,
                                color: Color(0xffb1e8ef),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'contact1'.tr,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/email.png',
                                        width: 40.0,
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            child: FlatButton(
                                height: 70.0,
                                color: Color(0xffb1e8ef),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'contact2'.tr,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/linkedin.png',
                                        width: 40.0,
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                            child: FlatButton(
                                height: 70.0,
                                color: Color(0xffb1e8ef),
                                onPressed: () {},
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'contact3'.tr,
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                        ),
                                      ),
                                      Image.asset(
                                        'assets/images/website.png',
                                        width: 40.0,
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ),
                          //     style: ButtonStyle(
                          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          //             RoundedRectangleBorder(
                          //                 borderRadius: BorderRadius.all(Radius.circular(20)),
                          //                 side: BorderSide(color: primaryColor)
                          //             )
                          //         )
                          //     ),
                          //     onPressed: (){},
                          //       child: Row(
                          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //         children: [
                          //           Text(
                          //             'GMAIL',
                          //             style: TextStyle(
                          //                 fontSize: 20.0,
                          //                 fontWeight: FontWeight.bold,
                          //                 color: Colors.black,
                          //                 fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                          //             ),
                          //           ),
                          //           Icon(Icons.email)
                          //         ],
                          //       ),
                          //     )
                        ]
                    )
                ),
                Positioned(
                    bottom: 40,
                    right: 0,
                    left: 0,
                    child: Center(
                      child: Text(
                        'Ⓒ 2021 NLP Team',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 17.0,
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

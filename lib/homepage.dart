import 'dart:io';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nlp_final_project/pages/about.dart';
import 'package:nlp_final_project/pages/contact.dart';
import 'package:nlp_final_project/pages/settings.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:get_storage/get_storage.dart';
import 'locale/localeString.dart';

enum AudioState { nulll, recording, stop, play }

const themeColor = Color(0xfffaa51a);
const primaryColor = Color(0xff55c4cd);
const secondaryColor = Color(0xff09919a);


class RecordingScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  late AudioState audioState = AudioState.nulll;
  // MicrophoneRecorder _recorder;
  late Record _record;
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    // _recorder = MicrophoneRecorder()..init();
    // Check and request permission
    _record = Record();
  }

  void recording() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String path = appDocumentsDirectory.path;
    await _record.start(
      path: '$path/test.mp3', // required
      encoder: AudioEncoder.AAC, // by default
      bitRate: 128000, // by default
      samplingRate: 44100, // by default
    );
  }

  // Future<String> getFilePath() async {
  //   Directory storageDirectory = await getApplicationDocumentsDirectory();
  //   String sdPath = storageDirectory.path + "/record";
  //   var d = Directory(sdPath);
  //   if (!d.existsSync()) {
  //     d.createSync(recursive: true);
  //   }
  //   return sdPath + "/test.mp3";
  // }


  void stop() async {
    await _record.stop();
  }

  void play() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String path = appDocumentsDirectory.path;
    await _audioPlayer.play('$path/test.mp3', isLocal: true).then((_) => {
      setState(() => audioState = AudioState.stop)
    });
  }

  void handleAudioState(AudioState state) {
    setState(() {
      if (audioState == AudioState.nulll) {
        // Starts recording
        audioState = AudioState.recording;
        // _recorder.start();
        recording();
        // Finished recording
      } else if (audioState == AudioState.recording) {
        audioState = AudioState.play;
        // _recorder.stop();
        stop();
        // Play recorded audio
      } else if (audioState == AudioState.play) {
        audioState = AudioState.stop;
        _audioPlayer = AudioPlayer();
        // _audioPlayer.setUrl().then((duration) {
        //   return
        play();
        //);
        // Stop recorded audio
      } else if (audioState == AudioState.stop) {
        audioState = AudioState.play;
        _audioPlayer.stop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff3ffff),
        appBar: AppBar(
          backgroundColor: const Color(0xfffaa51a),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: const Color(0xfffaa51a)),
          toolbarHeight: 70.0,
          centerTitle: true,
          title: Text(
            'title'.tr,
            style: TextStyle(
                fontSize: 18.0,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(
                      color: const Color(0xfffaa51a),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.campaign,
                                  size: 80.0,
                                  color: Colors.white,
                                ),
                                Padding(padding: EdgeInsets.only(top: 5.0)),
                                Text(
                                  'drawer'.tr,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                  ),
                                ),
                              ],
                            )
                        )
                    )
                ),
                ListTile(
                  title: Text(
                    'item1'.tr,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff55c4cd),
                        fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Get.to(SettingsScreen());
                  },
                ),
                ListTile(
                  title: Text(
                    'item2'.tr,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff55c4cd),
                        fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Get.to(AboutScreen());
                  },
                ),
                ListTile(
                  title: Text(
                    'item3'.tr,
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff55c4cd),
                        fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                    ),
                  ),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Get.to(ContactScreen());
                  },
                )
              ]
          ),
        ),
        body: Stack(
          children: [
            Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: handleAudioColour(),
                      ),
                      child: RawMaterialButton(
                        fillColor: Colors.white,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(24),
                        onPressed: () async {
                          bool result = await _record.hasPermission();
                          handleAudioState(audioState);
                        },
                        child: getIcon(audioState),
                      ),
                    ),
                    SizedBox(width: 20),
                    if (audioState == AudioState.play ||
                        audioState == AudioState.stop)
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                        ),
                        child: RawMaterialButton(
                          fillColor: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(24),
                          onPressed: () => setState(() {
                            audioState = AudioState.nulll;
                            // _recorder.dispose();
                            _record.dispose();
                            // _recorder = MicrophoneRecorder()..init();
                            _record = Record();
                          }),
                          child: Icon(Icons.replay, size: 50),
                        ),
                      ),
                  ],
                ),
            ),
            Positioned(
              top: 10,
                right: 0,
                left: 0,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
                  color: const Color(0xff55c4cd),
                  width: double.infinity,
                  child: Text(
                    'text'.tr,
                    style: TextStyle(
                        fontSize: 17.5,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                    ),
                  ),
                )
            )
          ],
        ));
  }

  Color handleAudioColour() {
    if (audioState == AudioState.recording) {
      return secondaryColor.withOpacity(1);
    } else if (audioState == AudioState.stop) {
      return Colors.blue;
    } else {
      return primaryColor;
    }
  }

  Icon getIcon(AudioState state) {
    switch (state) {
      case AudioState.play:
        return Icon(Icons.play_arrow, size: 50);
      case AudioState.stop:
        return Icon(Icons.stop, size: 50);
      case AudioState.recording:
        return Icon(Icons.mic, color: secondaryColor, size: 50);
      default:
        return Icon(Icons.mic, size: 50);
    }
  }
}

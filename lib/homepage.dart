// import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nlp_final_project/pages/about.dart';
import 'package:nlp_final_project/pages/contact.dart';
import 'package:nlp_final_project/pages/settings.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:record/record.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
//
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_sound_lite/flutter_sound.dart' as flutter_sound;

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
  // late Record _record;
  late AudioPlayer _audioPlayer;
  // late stt.SpeechToText _speech;
  //
  var model1 = true;
  var model2 = false;
  var model3 = false;
  //
  var model3_text = 'text'.tr;

  late bool resp1 = false;
  late bool resp2 = false;
  late bool resp3 = false;
  late String resp1_text = '';
  late String resp2_text = '';
  late String resp3_text = '';

  late flutter_sound.FlutterSoundRecorder flutterSoundRecorder;

  @override
  void initState() {
    super.initState();
    // _recorder = MicrophoneRecorder()..init();
    // Check and request permission
    // _record = Record();
    // _speech = stt.SpeechToText();
    flutterSoundRecorder = flutter_sound.FlutterSoundRecorder();
    flutterSoundRecorder.openAudioSession().then((value) {
      setState(() {
        // _mRecorderIsInited = true;
      });
    });
    //
  }

  void recording() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String path = appDocumentsDirectory.path;
    // await _record.start(
    //   path: '$path/test.mp3', // required
    //   encoder: AudioEncoder.AAC, // by default
    //   bitRate: 128000, // by default
    //   samplingRate: 16000, // by default 44100
    // );
    await flutterSoundRecorder.startRecorder(
      toFile: '$path/test.wav',
      codec: flutter_sound.Codec.pcm16WAV,
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

  upload(File imageFile, URI) async {
    // open a bytestream
    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(URI);

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields.addAll({'remark':'a sample'});

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  upload2 (String filename, String url, int which) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
        await http.MultipartFile.fromPath(
            'file',
            filename
        )
    );
  print(request.files.first.filename);
    // request.headers['Accept'] = '*/*';
    // request.headers['Content-Type'] = 'multipart/form-data';
    // request.headers['Connection'] = 'keep-alive';
      request.fields['remark'] = 'filename';
      var res = await request.send();
      print(res.statusCode);
      res.stream.transform(utf8.decoder).listen((value) {
        print(value);
        setState(() {
          if(which==0) {
            resp1 = true;
            resp1_text = value;
          } else if(which==1) {
            resp2 = true;
            resp2_text = value;
          } else if(which==2) {
            resp3 = true;
            resp3_text = value;
          }
        });
      });
  }

  void stop() async {
    // await _record.stop();
    await flutterSoundRecorder.stopRecorder();
    // initiate file upload

    if(model1) {
      Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
      String path = appDocumentsDirectory.path;
      // final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
      //
      // await _flutterFFmpeg.execute("-i $path/test.mp3 $path/out.wav").then((rc) => print("FFmpeg process exited with rc $rc"));
      // print(File('$path/out.wav'));
      upload2('$path/test.wav', "http://81.31.168.187/speech_recognition/file/upload/wave2vec/", 0);

      // FFmpegKit.executeAsync('-i $path/test.mp3 -c:v $path/out.wav', (session) async {
      //   final returnCode = await session.getReturnCode();
      //   print(returnCode);
      //   // if (ReturnCode.isSuccess(returnCode)) {
      //   //
      //   //   // SUCCESS
      //   //
      //   // } else if (ReturnCode.isCancel(returnCode)) {
      //   //
      //   //   // CANCEL
      //   //
      //   // } else {
      //   //
      //   //   // ERROR
      //   //
      //   // }
      //   print(File('$path/out.wav'));
      //   upload2('$path/out.wav', "http://81.31.168.187/speech_recognition/file/upload/wave2vec/");
      // });
      // _flutterFFmpeg.execute("ffmpeg -i $path/test.wav $path/out.wav").then((rc) => print("FFmpeg process exited with rc $rc"));

    }
    if(model2) {
      Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
      String path = appDocumentsDirectory.path;
      // final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
      // _flutterFFmpeg.execute("ffmpeg -i $path/test.wav $path/out.wav").then((rc) => print("FFmpeg process exited with rc $rc"));
      upload2('$path/test.wav', "http://81.31.168.187/speech_recognition/file/upload/kaldi/", 1);
    }
    if(model3) {
      Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
      String path = appDocumentsDirectory.path;
      // final FlutterFFmpeg _flutterFFmpeg = new FlutterFFmpeg();
      // _flutterFFmpeg.execute("ffmpeg -i $path/test.wav $path/out.wav").then((rc) => print("FFmpeg process exited with rc $rc"));
      upload2('$path/test.wav', "http://81.31.168.187/speech_recognition/file/upload/google/", 2);
    }
  }

  void play() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
    String path = appDocumentsDirectory.path;
    await _audioPlayer.play('$path/test.wav', isLocal: true).then((_) => {
      setState(() => audioState = AudioState.stop)
    });
  }

//   void googleSpeechRecognition() async {
//     bool available = await _speech.initialize(
//       onStatus: (val) => print('onStatus: $val'),
//       onError: (val) => print('onError: $val'),
//       // debugLogging: true,
//     );
//     var locales = await _speech.locales();
//     var selectedLocale = locales[75];
//     for(var i=0; i<locales.length; i++) {
//       print(i);
//       print(" is ");
//       print(locales[i].name);
//       if(locales[i].name == 'Persian (Iran)') {
//         selectedLocale = locales[i];
//         break;
//       } else if(locales[i].name == 'فارسی (ایران)') {
//         selectedLocale = locales[i];
//         break;
//       }
//     }
//     if (available) {
//       _speech.listen(
//         onResult: (val) => setState(() {
//           print(val.recognizedWords);
//           setState(() {
//             model3_text = val.recognizedWords;
//           });
//           if (val.hasConfidenceRating && val.confidence > 0) {
//             // _confidence = val.confidence;
//           }
//         }),
//         localeId: selectedLocale.localeId,
//       );
//     }
// }
void recorddd() async {
   recording();
   // googleSpeechRecognition();
}

  void handleAudioState(AudioState state) {
    if (audioState == AudioState.nulll) {
      if(model3) {
        // googleSpeechRecognition();
      }
    }
    setState(() {
      if (audioState == AudioState.nulll) {
        // Starts recording
        audioState = AudioState.recording;
        // _recorder.start();
        // if(!model3) {
        recorddd();
        // }
        // if((model1 || model2) && !model3) {
        //   recording();
        // }
        // Finished recording
      } else if (audioState == AudioState.recording) {
        audioState = AudioState.play;
        // _recorder.stop();
        if(model3) {
          // _speech.stop();
        }
        // } else {
          stop();
        // }
        // else if(model1 || model2) {
        //   stop();
        // }
        // Play recorded audio
      } else if (audioState == AudioState.play) {
        audioState = AudioState.stop;
        _audioPlayer = AudioPlayer();
        // _audioPlayer.setUrl().then((duration) {
        //   return
       // if(!model3) {
         play();
       // }
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

    return Scaffold(
        backgroundColor: const Color(0xfff3ffff),
        appBar: AppBar(
          backgroundColor: const Color(0xfffaa51a),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: const Color(0xfffaa51a)),
          toolbarHeight: 60.0,
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
                    Get.to(SettingsScreen())!.then((value) => setState(() {
                    }));
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
            Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Center(
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
                          // bool result = await _record.hasPermission();
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
                            // _record.dispose();
                            // _recorder = MicrophoneRecorder()..init();
                            // _record = Record();
                          }),
                          child: Icon(Icons.replay, size: 50),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 4,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Visibility(
                        visible: model1,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          color: const Color(0xff55c4cd),
                          width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                text: 'model1_title'.tr,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: (resp1)? ((resp1_text.length<100)?resp1_text:'error'.tr):'text'.tr,
                                    style: TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )
                    ),
                    Visibility(
                        visible: model2,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          color: const Color(0xff55c4cd),
                          width: double.infinity,
                          child: RichText(
                            text: TextSpan(
                              text: 'model2_title'.tr,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: (resp2)? ((resp2_text.length<100)?resp2_text:'error'.tr):'text'.tr,
                                  style: TextStyle(
                                      fontSize: 15.5,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                  ),
                                ),
                              ],
                            ),
                          )
                        )
                    ),
                    Visibility(
                        visible: model3,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                          color: const Color(0xff55c4cd),
                          width: double.infinity,
                            child: RichText(
                              text: TextSpan(
                                text: 'model3_title'.tr,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: (resp3)? ((resp3_text.length<100)?resp3_text:'error'.tr):'text'.tr,  //model3_text,
                                    style: TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                        fontFamily: Get.locale==Locale('fa','IR')? 'Vazir' : 'Raleway'
                                    ),
                                  ),
                                ],
                              ),
                            )
                        )
                    )
                  ],
                )
            ),
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

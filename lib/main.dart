import 'package:flutter/material.dart';
import 'package:nlp_final_project/homepage.dart';
import 'package:get_storage/get_storage.dart';

void main() {
  initStorage();
  runApp(RecordingScreen());
}

void initStorage() async {
  await GetStorage.init();
}
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text(content)),
    );
}

Future<File?> pickAudio() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (filePickerRes != null && filePickerRes.files.isNotEmpty) {
      return File(
          filePickerRes.files.first.path!); // Use `path` instead of `xFile`
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickImage() async {
  try {
    final filePickerRes = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (filePickerRes != null && filePickerRes.files.isNotEmpty) {
      return File(
          filePickerRes.files.first.path!); // Use `path` instead of `xFile`
    }
    return null;
  } catch (e) {
    return null;
  }
}

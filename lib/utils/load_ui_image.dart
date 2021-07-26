import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Future<ui.Image> loadImageFromAsset(
  String path,
) async {
  ImageStream stream;
  stream = AssetImage(path).resolve(
    ImageConfiguration.empty,
  );

  ImageStreamListener? _listener;

  Completer<ui.Image> completer = Completer<ui.Image>();
  void listener(ImageInfo frame, bool synchronousCall) {
    final ui.Image image = frame.image;
    completer.complete(image);
    if (_listener != null) {
      stream.removeListener(_listener);
    }
  }

  _listener = ImageStreamListener(listener);

  stream.addListener(_listener);
  return completer.future;
}

Future<ui.Image> loadImageFromFile(
  String filePath,
) async {
  ImageStream stream;
  stream = Image.file(File(filePath)).image.resolve(
        ImageConfiguration.empty,
      );

  Completer<ui.Image> completer = Completer<ui.Image>();
  void listener(ImageInfo frame, bool synchronousCall) {
    final ui.Image image = frame.image;
    completer.complete(image);
    stream.removeListener(ImageStreamListener(listener));
  }

  stream.addListener(ImageStreamListener(listener));
  return completer.future;
}

loadImageFromList(
  Uint8List imageData,
) async {
  ImageStream stream;
  stream = Image.memory(imageData).image.resolve(
        ImageConfiguration.empty,
      );

  Completer<ui.Image> completer = Completer<ui.Image>();
  void listener(ImageInfo frame, bool synchronousCall) {
    final ui.Image image = frame.image;
    completer.complete(image);
    stream.removeListener(ImageStreamListener(listener));
  }

  stream.addListener(ImageStreamListener(listener));
  return completer.future;
}

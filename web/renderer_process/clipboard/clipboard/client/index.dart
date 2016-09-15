// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library client.index;

import 'dart:html';
import 'package:electron/renderer.dart' as tron;

class Updater {
  Updater() {
    textSpan = querySelector("#text");
    htmlSpan = querySelector("#html");
    rtfSpan = querySelector("#rtf");
    bookmarkTitleSpan = querySelector("#bookmark-title");
    bootmarkUrlSpan = querySelector("#bootmark-url");
    avFormatsSpan = querySelector("#avformats");
    imgImage = querySelector("#img");
  }

  SpanElement textSpan;

  SpanElement htmlSpan;

  SpanElement rtfSpan;

  SpanElement bookmarkTitleSpan;

  SpanElement bootmarkUrlSpan;

  SpanElement avFormatsSpan;

  ImageElement imgImage;

  void update() {
    textSpan.text = tron.Clipboard.readText();

    htmlSpan.text = tron.Clipboard.readHTML();

    rtfSpan.text = tron.Clipboard.readRTF();

    bookmarkTitleSpan.text = tron.Clipboard.readBookmark().title;
    bootmarkUrlSpan.text = tron.Clipboard.readBookmark().url;

    avFormatsSpan.text = tron.Clipboard.availableFormats().toString();

    imgImage.src = tron.Clipboard.readImage().toDataURL();
  }
}

main() {
  tron.prepareElectron();

  Updater lUpdater = new Updater();

  querySelector("#read").onClick.listen((_) {
    lUpdater.update();
  });

  querySelector("#clear").onClick.listen((_) {
    tron.Clipboard.clear();
  });
}
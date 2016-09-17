// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library client.index;

import 'dart:html';
import 'dart:async';

import 'package:simple_ajax/simple_ajax.dart';

main() {
  SpanElement lCountSpan = querySelector("#count");
  ButtonElement lIncrementBtn = querySelector("#increment");

  int lCount = 0;

  lIncrementBtn.onClick.listen((_) {
    lCount++;
    lCountSpan.text = lCount.toString();
  });

  new Timer.periodic(new Duration(seconds: 10), (_) async {
    HttpRequest req = new HttpRequest();
    req.open("POST", "electron-str://http.com/");

    try {
      req.send();
    } catch (e) {}

    HttpRequest lRet;
    await for (ProgressEvent pe in req.onLoad) {
      lRet = pe.target;
    }

    print(lRet.responseText);
    print(lRet.responseType);
  });

  new Timer.periodic(new Duration(seconds: 10), (_) async {
    final lRet = await postAjaxJson(
        "electron-http://http.com/", {"HttpKey": "HttpValue"});
    print(lRet.responseText.length);
    print(lRet.responseType);
  });
}

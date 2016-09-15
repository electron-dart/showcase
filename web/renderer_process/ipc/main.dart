// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:js' as js;
import 'dart:js_util' as js;
import "package:nodejs/nodejs.dart" as nodejs;
import "package:electron/main.dart" as tron;

main() {
  tron.app.onWindowAllClosed.listen((_) {
    if (nodejs.process.platform != "darwin") {
      tron.app.quit();
    }
  });

  tron.app.onReady.listen((_) {
    tron.BrowserWindow win = new tron.BrowserWindow();
    win.loadURL("file://${nodejs.dirname}/client/index.html");
    win.onClose.listen((_) {
      win = null;
    });

    tron.Ipc.on("data", (event, dynamic data) {
      print("data:" + data);

      tron.NativeJsWebContents sender = js.getProperty(event, "sender");
      sender.send("data", "knock");

      print(js.hasProperty(event, "returnValue"));
    });

    tron.Ipc.on("data-sync", (event, dynamic data) {
      print("data-sync:" + data);
      //TODO event.returnValue = "pong";

      js.setProperty(event, "returnValue", "pong");
    });
  });
}

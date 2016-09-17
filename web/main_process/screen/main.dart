// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:nodejs/nodejs.dart" as nodejs;
import "package:electron/main.dart" as tron;

import "package:showcase/datauri/datauris.dart" as datauris;

main() {
  tron.app.onWindowAllClosed.listen((_) {
    if (nodejs.process.platform != "darwin") {
      tron.app.quit();
    }
  });

  tron.app.onReady.listen(afterAppReady);
}

tron.BrowserWindow _win;

afterAppReady(_) {
  _win = new tron.BrowserWindow();
  _win.loadURL("file://${nodejs.dirname}/client/index.html");

  final lDisps = tron.screen.getAllDisplays();

  lDisps.forEach((tron.Display disp) {
    print(disp.size);
    print(disp.bounds);
  });

  tron.screen.onDisplayAdded.listen((tron.EventDisplay event) {
    print("Display added:" + event.display.workArea.toString());
  });

  tron.screen.onDisplayRemoved.listen((tron.EventDisplay event) {
    print("Display removed:" + event.display.workArea.toString());
  });
}
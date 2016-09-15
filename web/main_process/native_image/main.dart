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

  tron.app.onReady.listen((_) {
    final win = new tron.BrowserWindow();
    win.loadURL("file://${nodejs.dirname}/client/index.html");

    print(nodejs.dirname);

    final imgEmpty = new tron.NativeImage.createEmpty();
    print(imgEmpty.getSize());

    final imgBridge_960_720 = new tron.NativeImage.createFromPath(nodejs.dirname +
        "\\client\\packages\\showcase\\assets\\images\\samples\\bridge_960_720.jpg");
    print(imgBridge_960_720.getSize());

    final imgDataURL =
        new tron.NativeImage.createFromDataURL(datauris.kBlackCross);
    print(imgDataURL.getSize());
  });
}

// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:nodejs/nodejs.dart" as nodejs;
import "package:electron/main.dart";

main() {
  app.onWindowAllClosed.listen((_) {
    if (nodejs.process.platform != "darwin") {
      app.quit();
    }
  });

  app.onReady.listen((_) {
    BrowserWindow win = new BrowserWindow();
    win.loadURL("file://${nodejs.dirname}/client/index.html");
    win.onClose.listen((_) {
      win = null;
    });
  });
}

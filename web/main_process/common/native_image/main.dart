// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import "package:nodejs/nodejs.dart" as nodejs;
import "package:electron/main.dart" as tron;

main() {
  tron.app.onWindowAllClosed.listen((_) {
    if (nodejs.process.platform != "darwin") {
      tron.app.quit();
    }
  });

  tron.app.onReady.listen((_) {
    final win = new tron.BrowserWindow();
    win.loadURL("file://${nodejs.dirname}/client/index.html");
    final imgEmpty = tron.createEmpty();

    print(imgEmpty.getSize());
  });
}

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
    win.onPageTitleUpdated.listen((_) {
      win = null;
      print("Window title updated!");
    });

    win.onClose.listen((_) {
      win = null;
      print("Window close!");
    });

    win.onClosed.listen((_) {
      print("Window closed!");
    });

    win.onBlur.listen((_) {
      print("Window blurred!");
    });

    win.onFocus.listen((_) {
      print("Window focus!");
    });

    win.onShow.listen((_) {
      print("Window show!");
    });

    win.onHide.listen((_) {
      print("Window hide!");
    });

    win.onMaximize.listen((_) {
      print("Window maximize!");
    });

    win.onUnmaximize.listen((_) {
      print("Window unmaximize!");
    });

    win.onMinimize.listen((_) {
      print("Window minimize!");
    });

    win.onRestore.listen((_) {
      print("Window restore!");
    });

    win.onResize.listen((_) {
      print("Window resize!");
    });

    win.onMove.listen((_) {
      print("Window move!");
    });

    win.onMoved.listen((_) {
      print("Window moved!");
    });

    win.onEnterFullScreen.listen((_) {
      print("Window enter fullscreen!");
    });

    win.onLeaveHtmlFullScreen.listen((_) {
      print("Window leave fullscreen!");
    });

    win.onAppCommand.listen((_) {
      print("Window app command!");
    });

    win.onScrollTouchBegin.listen((_) {
      print("Window scroll begin!");
    });

    win.onScrollTouchEnd.listen((_) {
      print("Window scroll end!");
    });

    win.onSwipe.listen((_) {
      print("Window swipe!");
    });
  });
}

// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:async';
import 'dart:js' as js;
import 'dart:js_util' as js;
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

  _setTray();
}

_setTray() {
  final menu = new tron.Menu();

  final item1 = new tron.MenuItem(new tron.MenuItemOptions(label: "Item1"));

  menu.append(item1);

  final lTray = new tron.Tray(
      new tron.NativeImage.createFromDataURL(datauris.kBlackCross));

  lTray.setToolTip("This app is created using electron.dart");
  lTray.setTitle("electron.dart");

  lTray.setContextMenu(menu);

  lTray.onClick.listen((tron.EventTrayClick event) {
    print("Tray clicked!");
  });

  lTray.onBalloonShow.listen((_) {
    print("Balloon show!");
  });

  lTray.onDropText.listen((tron.EventTrayDropText event) {
    print("Text dropped!");
    print(event.text);
    print(event.event);
  });

  new Timer(new Duration(seconds: 5), () {
    lTray.displayBalloon(new tron.TrayBalloonOptions(
        icon: new tron.NativeImage.createFromDataURL(datauris.kBlackCross)
            .nativeJs,
        title: "Balloon!",
        content:
            "5 seconds has elapsed since you launched an app created using electron.dart."));
  });

  new Timer(new Duration(seconds: 20), () {
    lTray.popUpContextMenu();
  });
}

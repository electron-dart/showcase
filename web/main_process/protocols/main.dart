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

  final lDefSes = tron.Session.defaultSession;
  final lProt = lDefSes.protocol;

  lProt.registerStringProtocol("electron-str", (
      tron.ProtocolRequest request, tron.ProtocolStringCallback reply) {
    print(request.url);
    print(request.method);
    print(request.uploadData);

    reply(new tron.ProtocolStringReply(data: "String data"));
  });

  lProt.registerHttpProtocol("electron-http", (
      tron.ProtocolRequest request, tron.ProtocolHttpCallback reply) {
    print(request.url);
    print(request.method);
    print(request.uploadData);

    reply(new tron.ProtocolHttpReply(
        url: "http://google.com",
        method: "GET"));
  });
}

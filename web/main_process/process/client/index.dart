// Copyright (c) 2016, electron.dart. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library client.index;

import 'dart:html';

main() {
  SpanElement lCountSpan = querySelector("#count");
  ButtonElement lIncrementBtn = querySelector("#increment");

  int lCount = 0;

  lIncrementBtn.onClick.listen((_) {
    lCount++;
    lCountSpan.text = lCount.toString();
  });
}
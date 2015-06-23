// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library protobuf.mixins.map;

import "package:protobuf/protobuf.dart" show BuilderInfo;

/// A PbMapMixin provides an experimental implementation of the
/// Map interface for a GeneratedMessage.
///
/// This mixin is enabled via an option in
/// dart_options.proto in dart-protoc-plugin.
abstract class PbMapMixin implements Map<String, dynamic> {

  // GeneratedMessage properties and methods used by this mixin.

  BuilderInfo info_;
  void clear();
  int getTagNumber(String fieldName);
  getField(int tagNumber);
  void setField(int tagNumber, var value, [int fieldType = null]);

  @override
  operator [](key) {
    if (key is! String) return null;
    var tag = getTagNumber(key);
    if (tag == null) return null;
    return getField(tag);
  }

  @override
  operator []=(String key, val) {
    var tag = getTagNumber(key);
    if (tag == null) {
      throw new ArgumentError(
          "field '${key}' not found in ${info_.messageName}");
    }
    setField(tag, val);
  }

  @override
  get keys => info_.byName.keys;

  @override
  bool containsKey(Object key) => info_.byName.containsKey(key);

  @override
  get length => info_.byName.length;

  @override
  remove(key) {
    throw new UnsupportedError(
        "remove() not supported by ${info_.messageName}");
  }
}

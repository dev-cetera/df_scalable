//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. Use of this
// source code is governed by an an MIT-style license that can be found in the
// LICENSE file located in this project's root directory.
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

import 'package:df_pod/df_pod.dart';
import 'package:flutter/widgets.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ScalableApp extends StatelessWidget {
  //
  //
  //

  final Widget child;

  //
  //
  //

  const ScalableApp({
    super.key,
    required this.child,
  });

  //
  //
  //

  @override
  Widget build(BuildContext context) {
    return PodBuilder(
      pod: ScalableApp.pod,
      builder: (context, snapshot) {
        return SizedBox(
          key: UniqueKey(),
          child: child,
        );
      },
      child: child,
    );
  }

  //
  //
  //

  static TSharedGlobalDoublePod? _pAppScale;
  static double? get snapshot => _pAppScale?.value;

  //
  //
  //

  static const _KEY = '<df_app_scale>';

  //
  //
  //

  static final Future<TSharedGlobalDoublePod> _pFutureAppScale =
      SharedDoublePodCreator.global(_KEY).then((e) => _pAppScale = e);

  //
  //
  //

  static Future<void> set(double value) async {
    final e = await _pFutureAppScale;
    await e.set(value);
  }

  //
  //
  //

  static Future<double?> get() async {
    final e = await _pFutureAppScale;
    return e.value;
  }

  //
  //
  //

  static Future<PodListenable<double?>> get pod async {
    return _pFutureAppScale;
  }
}

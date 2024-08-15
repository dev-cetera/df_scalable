//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by DevCetra.com & contributors. See LICENSE file
// in root directory.
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
      builder: (context, scale, child) {
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

  static double? _snapshot;
  static double? get snapshot => _snapshot;

  //
  //
  //

  static const _KEY = '<df_app_scale>';

  //
  //
  //

  static final Future<TSharedGlobalDoublePod> _pAppScale = SharedDoublePodCreator.global(_KEY).then(
    (e) => e
      ..addListener(
        () {
          _snapshot = e.value;
        },
      ),
  );

  //
  //
  //

  static Future<void> set(double value) async {
    final e = await _pAppScale;
    await e.set(value);
  }

  //
  //
  //

  static Future<double?> get() async {
    final e = await _pAppScale;
    return e.value;
  }

  //
  //
  //

  static Future<PodListenable<double?>> get pod async {
    return _pAppScale;
  }
}

import 'package:car_m/domain/entity/account.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../domain/data_provider/box_manager.dart';


class OtherProfileWidgetModel extends ChangeNotifier {
  late final Future<Box<Account>> profilesbox;
  ValueListenable<Object>? _listenable;
  List<Account>? accounts;

  OtherProfileWidgetModel() {
    _setup();
  }

  void _setup() async {
    profilesbox = BoxManager.instance.openAccountBox();
    await _readAccountsFromHive();
    _listenable = (await profilesbox).listenable();
    _listenable?.addListener(_readAccountsFromHive);
  }

  Future<void> _readAccountsFromHive() async {
    accounts = (await profilesbox).values.map((e) => e).toList();
    notifyListeners();
  }
}

class OtherProfileWidgetModelProvider extends InheritedNotifier {
  OtherProfileWidgetModel model;
  OtherProfileWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);
  static OtherProfileWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<OtherProfileWidgetModelProvider>();
  }

  static OtherProfileWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
        OtherProfileWidgetModelProvider>()
        ?.widget;
    return widget is OtherProfileWidgetModelProvider ? widget : null;
  }
}

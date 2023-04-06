import 'package:car_m/domain/data_provider/box_manager.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../domain/entity/own_account.dart';
class ProfileWidgetModel extends ChangeNotifier{
  Profile? account;
  Box? box;
  Profile? profile;
  Profile? getParameters(){
    _readFromHive();
    account = profile;
    return account;
  }
  Future<void> _readFromHive() async {
    final box = await BoxManager.instance.openProfileBox();
    profile = (await box).getAt(0) as Profile;
        notifyListeners();
  }
}


class  ProfileWidgetProvider extends InheritedNotifier {
  ProfileWidgetModel model;
   ProfileWidgetProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key,notifier: model, child: child);
  static ProfileWidgetProvider? watch(BuildContext context) {
  return context
      .dependOnInheritedWidgetOfExactType<ProfileWidgetProvider>();
  }

  static ProfileWidgetProvider? read(BuildContext context) {
  final widget = context
      .getElementForInheritedWidgetOfExactType<ProfileWidgetProvider>()
      ?.widget;
  return widget is ProfileWidgetProvider ? widget : null;
  }
}

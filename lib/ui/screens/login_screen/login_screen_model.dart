import 'package:car_m/domain/entity/own_account.dart';
import 'package:flutter/material.dart';
import '../../../domain/data_provider/box_manager.dart';
import '../../../secure_storage/shared_preferences.dart';
import '../../navigation/main_navigation.dart';

class LoginScreenModel extends ChangeNotifier {
  var _login = '';
  var _password = '';
  var _visibility = false;
  set visibility(bool value) {
    _visibility = value;
    notifyListeners();
  }

  final model = SharedPrefModel();
  set login(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _login = value;
  }

  set password(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _password = value;
  }

  String? errorText;
  String? errorPass;
  void signIn(BuildContext context) async {
    /*final a = await BoxManager.instance.openProfileBox();
    a.deleteFromDisk();*/
    if (_login.trim().length <= 4 && _password.trim().length <= 4) {
      errorText = "Логин должен иметь не менее 5 символов";
      errorPass = "Пароль должен иметь не менее 5 символов";
      notifyListeners();
      return;
    }
    if (_login.trim().length <= 4) {
      errorText = "Логин должен иметь не менее 5 символов";
      notifyListeners();
      return;
    }
    if (_password.trim().length <= 4) {
      errorPass = "Пароль должен иметь не менее 5 символов";
      notifyListeners();
      return;
    }
    final box = await BoxManager.instance.openAccountBox();
    /*print(box.values.map((e) => '${e.name},${e.nickname},${e.surname}'));*/
    final ownBox = await BoxManager.instance.openProfileBox();
    final Map<String, String> map = { for (var e in box.values) e.nickname : e.password };
    if (map.keys.contains(_login)) {
      for (int i = 0; i < map.keys.length; i++) {
        if (_login == map.keys.elementAt(i)) {
          if (_password == map.values.elementAt(i)) {
            if (await model.loggedRead() == 'N') {
              model.loggedWrite('Y');
            }
            final profile = Profile(
                clubs: 0,
                name: '${box.getAt(i)?.name}',
                surname: '${box.getAt(i)?.surname}',
                dateOfBirth: '${box.getAt(i)?.dateOfBirth}',
                number: '${box.getAt(i)?.number}',
                gender: '${box.getAt(i)?.gender}',
                followings: 0,
                followers: 0,
                nickname: '${box.getAt(i)?.nickname}');
            ownBox.add(profile);
            /*print(ownBox.values.map((e) => '${e.name},${e.nickname},${e.surname}'));*/
            await BoxManager.instance.closeBox(box);
            await BoxManager.instance.closeBox(ownBox);
            Navigator.of(context)
                .pushReplacementNamed(MainNavigationRouteNames.mainRoute);
          } else {
            errorPass = 'Пароль неверный';
            notifyListeners();
            return;
          }
        }
      }
    } else {
      errorText = 'Введенный логин неверный';
      notifyListeners();
      return;
    }
  }
}

class LoginScreenModelProvider extends InheritedNotifier {
  LoginScreenModel model;
  LoginScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static LoginScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LoginScreenModelProvider>();
  }

  static LoginScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<LoginScreenModelProvider>()
        ?.widget;
    return widget is LoginScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(LoginScreenModelProvider oldWidget) {
    return false;
  }
}

import 'package:car_m/domain/entity/account.dart';
import 'package:flutter/material.dart';
import '../../../domain/data_provider/box_manager.dart';

class InformationScreenModel extends ChangeNotifier {
  var _accountFirstName = '';
  var _accountSecondName = '';
  var _accountDateOfBirth = '';
  var _accountGender = '';
  var _accountNickname = '';
  set firstName(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _accountFirstName = value;
  }

  set secondName(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _accountSecondName = value;
  }

  set dateOfBirth(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _accountDateOfBirth = value;
  }

  set gender(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _accountGender = value;
  }

  set nickname(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _accountNickname = value;
  }

  String? errorText;
  void createAccount(BuildContext context) async {
    if (_accountFirstName.trim().isEmpty) {
      errorText = 'Enter something special';
      notifyListeners();
      return;
    }
    final box = await BoxManager.instance.openAccountBox();
    final account = Account(
      name: _accountFirstName,
      surname: _accountSecondName,
      dateOfBirth: _accountDateOfBirth,
      number: box.getAt(box.length - 1)?.number ?? '',
      gender: _accountGender,
      password: '',
      nickname: _accountNickname.toLowerCase(),
    );
    await box.putAt(box.length-1,account);
    await BoxManager.instance.closeBox(box);
  }
}

class InformationScreenModelProvider extends InheritedNotifier {
  final InformationScreenModel model;
  const InformationScreenModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static InformationScreenModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InformationScreenModelProvider>();
  }

  static InformationScreenModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            InformationScreenModelProvider>()
        ?.widget;
    return widget is InformationScreenModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(InformationScreenModelProvider oldWidget) {
    return false;
  }
}

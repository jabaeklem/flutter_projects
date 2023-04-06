import 'package:car_m/domain/data_provider/box_manager.dart';
import 'package:car_m/domain/entity/task.dart';
import 'package:flutter/material.dart';

class CreatePostWidgetModel extends ChangeNotifier {
  var _content = "";
  String? errorText;
  set content(String value) {
    if (errorText != null && value.trim().isNotEmpty) {
      errorText = null;
      notifyListeners();
    }
    _content = value;
  }

  void createPost(context) async {
    final box = await BoxManager.instance.openPostsBox();
    final ownBox = await BoxManager.instance.openProfileBox();
    final task = Task(
        content: _content,
        shares: 0,
        date: '${DateTime.now()}',
        author: '${ownBox.getAt(0)?.nickname}',
        likes: 0,
    id: box.length + 1);
    box.add(task);
    Navigator.pop(context);
  }
}

class CreatePostWidgetModelProvider extends InheritedNotifier {
  final CreatePostWidgetModel model;
  const CreatePostWidgetModelProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static CreatePostWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CreatePostWidgetModelProvider>();
  }

  static CreatePostWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            CreatePostWidgetModelProvider>()
        ?.widget;
    return widget is CreatePostWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(CreatePostWidgetModelProvider oldWidget) {
    return false;
  }
}

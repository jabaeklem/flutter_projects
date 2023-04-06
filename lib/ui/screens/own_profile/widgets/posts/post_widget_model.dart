import 'package:car_m/domain/data_provider/box_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../../../domain/entity/task.dart';

class SinglePostWidgetModel extends ChangeNotifier {
  List<Task>? tasks = [];
  late final Future<Box<Task>> postbox;
  late final ownbox;
  ValueListenable<Object>? _listenable;
  int? id = 0;
  final List<Task> ownTasks = [];
  SinglePostWidgetModel() {
    _setup();
  }
  void _setup() async {
    postbox = BoxManager.instance.openPostsBox();
    ownbox = await BoxManager.instance.openProfileBox();
    await _readGroupsFromHive();
    _listenable = (await postbox).listenable();
    _listenable?.addListener(_readGroupsFromHive);
  }

  Future<void> _readGroupsFromHive() async {
    final String? author = ownbox.getAt(0)?.nickname;
    tasks = (await postbox!)
        .values
        .map((e) => Task(
            content: e.content,
            shares: 0,
            date: e.date,
            author: e.author,
            likes: e.likes,
            id: e.id))
        .toList() as List<Task>;
    if (tasks != null) {
      for (int i = 0; i < tasks!.length; i++) {
        if (tasks![i].author == author!) {
          ownTasks.add(tasks![i]);
        }
      }
    }
    notifyListeners();
  }

  void likePost(int id) async {
    final postbox = await BoxManager.instance.openPostsBox();
    for (int i = 0; i < postbox.length; i++) {
      if (postbox.getAt(i)?.id == id) {
        postbox.putAt(
            i,
            Task(
                content: postbox.getAt(i)!.content,
                shares: postbox.getAt(i)!.shares,
                date: postbox.getAt(i)!.date,
                author: postbox.getAt(i)!.author,
                likes: (postbox.getAt(i)!.likes + 1),
                id: id));
        notifyListeners();
        break;
      }
    }
  }

  void deleteTask(int id) async {
    final box = await postbox;
    final taskId = id;
    for (int i = 0; i < (await postbox).length; i++) {
      if (taskId == (await postbox).getAt(i)?.id) {
        await box.deleteAt(i);
        notifyListeners();
        break;
      }
    }
  }
}

class SinglePostWidgetModelProvider extends InheritedNotifier {
  SinglePostWidgetModel model;
  SinglePostWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, notifier: model, child: child);
  static SinglePostWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SinglePostWidgetModelProvider>();
  }

  static SinglePostWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            SinglePostWidgetModelProvider>()
        ?.widget;
    return widget is SinglePostWidgetModelProvider ? widget : null;
  }
}

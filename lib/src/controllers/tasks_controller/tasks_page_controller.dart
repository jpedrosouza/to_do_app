import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_app/src/database/controllers/task_groups_controller.dart';
import 'package:to_do_app/src/database/controllers/tasks_controller.dart';
import 'package:to_do_app/src/models/task_model.dart';
part 'tasks_page_controller.g.dart';

class TasksPageController = _TasksPageStore with _$TasksPageController;

abstract class _TasksPageStore with Store {
  late int groupId;

  @observable
  bool loading = false;

  @observable
  List<Task> tasks = <Task>[];

  @observable
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  var txtTaskName = TextEditingController();

  @action
  Future getData(int groupId) async {
    loading = true;

    this.groupId = groupId;
    tasks = await TaskController().getTasksByGroupId(groupId);

    loading = false;
  }

  @action
  Future createTask(BuildContext context) async {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Inform the task name'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: txtTaskName,
              validator: (value) =>
                  value!.isEmpty ? 'Inform the task group name' : null,
              decoration: const InputDecoration(
                  labelText: 'Task Group Name', border: OutlineInputBorder()),
              keyboardType: TextInputType.text,
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            MaterialButton(
              onPressed: () => validateAndCreateTask(context),
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }

  @action
  Future validateAndCreateTask(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await TaskController().store(Task(
        taskName: txtTaskName.text,
        completed: false,
        groupId: groupId,
      ));

      Navigator.pop(context);

      txtTaskName.text = '';

      getData(groupId);
    }
  }

  @action
  Future deleteTask(int taskId, int index) async {
    tasks.removeAt(index);

    await TaskController().delete(taskId);
  }

  @action
  Future deleteTaskGroup(
      VoidCallback deletedGroup, BuildContext context) async {
    await TaskGroupsController().delete(groupId);

    deletedGroup();

    Navigator.pop(context);
  }
}

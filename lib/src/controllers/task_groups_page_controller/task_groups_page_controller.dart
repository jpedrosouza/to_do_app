import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_app/src/database/controllers/task_groups_controller.dart';
import 'package:to_do_app/src/models/task_groups_model.dart';
part 'task_groups_page_controller.g.dart';

class TaskGroupsPageController = _TaskGroupsPageStore
    with _$TaskGroupsPageController;

abstract class _TaskGroupsPageStore with Store {
  @observable
  bool loading = false;

  @observable
  List<TaskGroup> taskGroups = <TaskGroup>[];

  @observable
  GlobalKey<FormState> formKey = GlobalKey();

  @observable
  var txtTaskGroupName = TextEditingController();

  @action
  Future getData() async {
    loading = true;

    taskGroups = await TaskGroupsController().index();

    loading = false;
  }

  @action
  void createTaskGroup(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Inform the name of your task group'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: txtTaskGroupName,
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
              onPressed: () async {
                await validateFormAndCreateTaskGroup(context);
              },
              child: const Text('Create'),
            )
          ],
        ),
      ),
    );
  }

  @action
  Future validateFormAndCreateTaskGroup(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await TaskGroupsController()
          .store(TaskGroup(name: txtTaskGroupName.text));

      Navigator.pop(context);

      getData();
    }
  }
}

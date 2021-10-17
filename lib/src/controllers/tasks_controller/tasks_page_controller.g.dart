// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksPageController on _TasksPageStore, Store {
  final _$loadingAtom = Atom(name: '_TasksPageStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$tasksAtom = Atom(name: '_TasksPageStore.tasks');

  @override
  List<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_TasksPageStore.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$txtTaskNameAtom = Atom(name: '_TasksPageStore.txtTaskName');

  @override
  TextEditingController get txtTaskName {
    _$txtTaskNameAtom.reportRead();
    return super.txtTaskName;
  }

  @override
  set txtTaskName(TextEditingController value) {
    _$txtTaskNameAtom.reportWrite(value, super.txtTaskName, () {
      super.txtTaskName = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_TasksPageStore.getData');

  @override
  Future<dynamic> getData(int groupId) {
    return _$getDataAsyncAction.run(() => super.getData(groupId));
  }

  final _$createTaskAsyncAction = AsyncAction('_TasksPageStore.createTask');

  @override
  Future<dynamic> createTask(BuildContext context) {
    return _$createTaskAsyncAction.run(() => super.createTask(context));
  }

  final _$validateAndCreateTaskAsyncAction =
      AsyncAction('_TasksPageStore.validateAndCreateTask');

  @override
  Future<dynamic> validateAndCreateTask(BuildContext context) {
    return _$validateAndCreateTaskAsyncAction
        .run(() => super.validateAndCreateTask(context));
  }

  final _$deleteTaskAsyncAction = AsyncAction('_TasksPageStore.deleteTask');

  @override
  Future<dynamic> deleteTask(int taskId, int index) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(taskId, index));
  }

  final _$deleteTaskGroupAsyncAction =
      AsyncAction('_TasksPageStore.deleteTaskGroup');

  @override
  Future<dynamic> deleteTaskGroup(
      VoidCallback deletedGroup, BuildContext context) {
    return _$deleteTaskGroupAsyncAction
        .run(() => super.deleteTaskGroup(deletedGroup, context));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
tasks: ${tasks},
formKey: ${formKey},
txtTaskName: ${txtTaskName}
    ''';
  }
}

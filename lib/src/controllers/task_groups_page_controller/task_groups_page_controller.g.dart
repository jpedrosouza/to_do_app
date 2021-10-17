// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_groups_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TaskGroupsPageController on _TaskGroupsPageStore, Store {
  final _$loadingAtom = Atom(name: '_TaskGroupsPageStore.loading');

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

  final _$taskGroupsAtom = Atom(name: '_TaskGroupsPageStore.taskGroups');

  @override
  List<TaskGroup> get taskGroups {
    _$taskGroupsAtom.reportRead();
    return super.taskGroups;
  }

  @override
  set taskGroups(List<TaskGroup> value) {
    _$taskGroupsAtom.reportWrite(value, super.taskGroups, () {
      super.taskGroups = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_TaskGroupsPageStore.formKey');

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

  final _$txtTaskGroupNameAtom =
      Atom(name: '_TaskGroupsPageStore.txtTaskGroupName');

  @override
  TextEditingController get txtTaskGroupName {
    _$txtTaskGroupNameAtom.reportRead();
    return super.txtTaskGroupName;
  }

  @override
  set txtTaskGroupName(TextEditingController value) {
    _$txtTaskGroupNameAtom.reportWrite(value, super.txtTaskGroupName, () {
      super.txtTaskGroupName = value;
    });
  }

  final _$getDataAsyncAction = AsyncAction('_TaskGroupsPageStore.getData');

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  final _$validateFormAndCreateTaskGroupAsyncAction =
      AsyncAction('_TaskGroupsPageStore.validateFormAndCreateTaskGroup');

  @override
  Future<dynamic> validateFormAndCreateTaskGroup(BuildContext context) {
    return _$validateFormAndCreateTaskGroupAsyncAction
        .run(() => super.validateFormAndCreateTaskGroup(context));
  }

  final _$_TaskGroupsPageStoreActionController =
      ActionController(name: '_TaskGroupsPageStore');

  @override
  void createTaskGroup(BuildContext context) {
    final _$actionInfo = _$_TaskGroupsPageStoreActionController.startAction(
        name: '_TaskGroupsPageStore.createTaskGroup');
    try {
      return super.createTaskGroup(context);
    } finally {
      _$_TaskGroupsPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
taskGroups: ${taskGroups},
formKey: ${formKey},
txtTaskGroupName: ${txtTaskGroupName}
    ''';
  }
}

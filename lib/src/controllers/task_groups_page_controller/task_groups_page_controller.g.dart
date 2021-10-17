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

  final _$getDataAsyncAction = AsyncAction('_TaskGroupsPageStore.getData');

  @override
  Future<dynamic> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
taskGroups: ${taskGroups}
    ''';
  }
}

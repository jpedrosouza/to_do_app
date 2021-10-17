class Task {
  late final int? id;
  late final String? taskName;
  late final bool? completed;
  late final int? groupId;

  Task({this.id, this.taskName, this.completed, this.groupId});

  void setCompleted(bool completed) {
    this.completed = completed;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'task_name': taskName,
      'completed': completed,
      'group_id': groupId,
    };
  }

  @override
  String toString() {
    return 'Task{id: $id, task_name: $taskName, completed: $completed, group_id: $groupId}';
  }
}

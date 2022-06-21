class TaskModel {
  final int id;
  final String projectId;
  final String title;
  final String? completed;
  final String? deleted;

  const TaskModel({
    required this.id,
    required this.projectId,
    required this.title,
    this.completed,
    this.deleted,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      projectId: json['project_id'].toString(),
      title: json['title'],
      completed: json['completed'].toString(),
      deleted: json['deleted'].toString(),
    );
  }
}
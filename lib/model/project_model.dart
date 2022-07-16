class ProjectModel {
  final int id;
  final String? workspaceId;
  final String title;
  final String? description;
  final String? deadline;
  final String? visibility;
  final String? totalTask;

  const ProjectModel({
    required this.id,
    this.workspaceId,
    required this.title,
    this.description,
    this.deadline,
    this.visibility,
    this.totalTask,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      workspaceId: json['workspace_id'].toString(),
      title: json['title'],
      description: json['description'],
      deadline: json['deadline'],
      visibility: json['visibility'],
      totalTask: json['total_task'].toString(),
    );
  }
}
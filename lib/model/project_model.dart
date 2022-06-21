class ProjectModel {
  final int id;
  final String? workspaceId;
  final String title;
  final String? description;
  final String? deadline;
  final String? visibility;

  const ProjectModel({
    required this.id,
    this.workspaceId,
    required this.title,
    this.description,
    this.deadline,
    this.visibility,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      workspaceId: json['workspace_id'].toString(),
      title: json['title'],
      description: json['description'],
      deadline: json['deadline'],
      visibility: json['visibility'],
    );
  }
}
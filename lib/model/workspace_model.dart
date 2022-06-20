class WorkspaceModel {
  final int id;
  final String title;
  final String? description;
  final String? visibility;

  const WorkspaceModel({
    required this.id,
    required this.title,
    this.description,
    this.visibility,
  });

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) {
    return WorkspaceModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      visibility: json['visibility'],
    );
  }
}
class MemberModel {
  final int id;
  final String name;
  final int userId;
  final int workspaceId;
  final String role;
  final int access;

  const MemberModel({
    required this.id,
    required this.name,
    required this.userId,
    required this.workspaceId,
    required this.role,
    required this.access,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      name: json['name'],
      userId: json['user_id'],
      workspaceId: json['workspace_id'],
      role: json['role'],
      access: json['access'],
    );
  }
}
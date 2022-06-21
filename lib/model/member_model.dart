class MemberModel {
  final int id;
  final String name;
  final String userId;
  final String workspaceId;
  final String role;
  final String access;

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
      userId: json['user_id'].toString(),
      workspaceId: json['workspace_id'].toString(),
      role: json['role'],
      access: json['access'].toString(),
    );
  }
}
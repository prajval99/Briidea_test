class ChatGroup {
  bool status;
  String message;
  List<GroupData> data;
  List<NewGroupData> newGroup;

  ChatGroup({
    required this.status,
    required this.message,
    required this.data,
    required this.newGroup,
  });

  factory ChatGroup.fromJson(Map<String, dynamic> json) {
    return ChatGroup(
      status: json['status'],
      message: json['message'],
      data: List<GroupData>.from(json['data'].map((x) => GroupData.fromJson(x))),
      newGroup: List<NewGroupData>.from(json['new_group'].map((x) => NewGroupData.fromJson(x))),
    );
  }
}

class GroupData {
  String isActive;
  String isDeleted;
  String groupId;
  dynamic chatGroupProfile;
  String chatGroupName;
  String groupMessagesId;
  String unseenMsgs;
  String groupMessageTime;
  String? groupMessage;
  dynamic groupMessageFile;

  GroupData({
    required this.isActive,
    required this.isDeleted,
    required this.groupId,
    required this.chatGroupProfile,
    required this.chatGroupName,
    required this.groupMessagesId,
    required this.unseenMsgs,
    required this.groupMessageTime,
    this.groupMessage,
    required this.groupMessageFile,
  });

  factory GroupData.fromJson(Map<String, dynamic> json) {
    return GroupData(
      isActive: json['is_active'],
      isDeleted: json['is_deleted'],
      groupId: json['group_id'],
      chatGroupProfile: json['chat_group_profile'],
      chatGroupName: json['chat_group_name'],
      groupMessagesId: json['group_messages_id'],
      unseenMsgs: json['unseen_msgs'],
      groupMessageTime: json['group_message_time'],
      groupMessage: json['group_message'],
      groupMessageFile: json['group_message_file'],
    );
  }
}

class NewGroupData {
  String groupId;
  String companyId;
  String createdBy;
  String chatGroupName;
  dynamic chatGroupProfile;
  String groupDescription;
  String isActive;
  String isDeleted;
  String createdOn;
  String updatedOn;
  String userId;

  NewGroupData({
    required this.groupId,
    required this.companyId,
    required this.createdBy,
    required this.chatGroupName,
    required this.chatGroupProfile,
    required this.groupDescription,
    required this.isActive,
    required this.isDeleted,
    required this.createdOn,
    required this.updatedOn,
    required this.userId,
  });

  factory NewGroupData.fromJson(Map<String, dynamic> json) {
    return NewGroupData(
      groupId: json['group_id'],
      companyId: json['company_id'],
      createdBy: json['created_by'],
      chatGroupName: json['chat_group_name'],
      chatGroupProfile: json['chat_group_profile'],
      groupDescription: json['group_description'],
      isActive: json['is_active'],
      isDeleted: json['is_deleted'],
      createdOn: json['created_on'],
      updatedOn: json['updated_on'],
      userId: json['user_id'],
    );
  }
}

class User {
  final String messageId;
  final String sender_info;
  final String receiver_info;
  final String message;
  final String message_file;
  final String message_time;
  final String is_seen;
  final String is_deleted;
  final String is_delivered;
  final String is_sent;
  final String sender_message_id;
  final String receiver_message_id;
  final String id;
  final String firstname;
  final String lastname;
  final String company_id;
  final String last_online_at;
  final String profile;
  final bool? is_online;
  final String count_unseenmessage_info;
  final String company_name;
  final String address;
  final String designation_name;

  User({
    required this.messageId,
    required this.message,
    required this.sender_info,
    required this.receiver_info,
    required this.message_file,
    required this.message_time,
    required this.is_seen,
    required this.is_deleted,
    required this.is_delivered,
    required this.is_sent,
    required this.id,
    required this.sender_message_id,
    required this.receiver_message_id,
    required this.firstname,
    required this.lastname,
    required this.profile,
    required this.company_id,
    required this.last_online_at,
    this.is_online,
    required this.address,
    required this.count_unseenmessage_info,
    required this.company_name,
    required this.designation_name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      messageId: json['message_id'] ?? '',
      message: json['message'] ?? '',
      message_file: json['message_file'] ?? '',
      message_time: json['message_time'] ?? '',
      is_seen: json['is_seen'] ?? '',
      is_deleted: json['is_deleted'] ?? '',
      is_delivered: json['is_delivered'] ?? '',
      is_sent: json['is_sent'] ?? '',
      sender_message_id: json['sender_message_id'] ?? '',
      receiver_message_id: json['receiver_message_id'] ?? '',
      id: json['id'] ?? '',
      firstname: json['firstname'] ?? '',
      lastname: json['lastname'] ?? '',
      company_id: json['company_id'] ?? '',
      last_online_at: json['last_online_at'] ?? '',
      profile: json['profile'] ?? '',
      is_online: json['is_online'] == 'true', // Convert string to boolean
      count_unseenmessage_info: json['count_unseenmessage_info'] ?? '',
      company_name: json['company_name'] ?? '',
      address: json['address'] ?? '',
      designation_name: json['designation_name'] ?? '',
      sender_info: json['sender_info'] ?? '',
      receiver_info: json['receiver_info'] ?? '',
    );
  }
}

class UserResponse {
  final bool status;
  final String message;
  final List<User> data;
  final List<User> newChat;

  UserResponse({
    required this.status,
    required this.message,
    required this.data,
    required this.newChat,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'],
      message: json['message'],
      data: List<User>.from(json['data'].map((x) => User.fromJson(x))),
      newChat: List<User>.from(json['new_chat'].map((x) => User.fromJson(x))),
    );
  }
}

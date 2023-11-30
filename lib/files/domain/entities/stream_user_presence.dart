import 'package:equatable/equatable.dart';

class StreamUserPresenceModel extends Equatable {
  final String userId;
  final bool online;
  final DateTime? lastActive;
  const StreamUserPresenceModel({
    required this.userId,
    required this.online,
    required this.lastActive,
  });

  StreamUserPresenceModel copyWith({
    String? userId,
    bool? online,
    DateTime? lastActive,
  }) {
    return StreamUserPresenceModel(
      userId: userId ?? this.userId,
      online: online ?? this.online,
      lastActive: lastActive ?? this.lastActive,
    );
  }

  @override
  List<Object?> get props => [userId, online, lastActive];
}

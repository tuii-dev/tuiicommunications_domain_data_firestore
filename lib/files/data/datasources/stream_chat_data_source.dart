import 'package:tuiientitymodels/files/communications/data/models/create_stream_token_response.dart';

abstract class StreamChatDataSource {
  Future<CreateStreamTokenResponse> getStreamToken(
      String streamCreateTokenUrl, String userId, String firebaseToken);

  Future<bool> revokeStreamToken(
      String streamRevokeTokenUrl, String userId, String firebaseToken);

  Future<bool> addChannelMessage(String streamMessageUrl, String channelId,
      String userId, String message, String firebaseToken);
}

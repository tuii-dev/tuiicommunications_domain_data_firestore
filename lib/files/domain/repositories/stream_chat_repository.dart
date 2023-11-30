import 'package:dartz/dartz.dart';
import 'package:tuiicore/core/errors/failure.dart';
import 'package:tuiientitymodels/files/communications/data/models/create_stream_token_response.dart';

abstract class StreamChatRepository {
  Future<Either<Failure, CreateStreamTokenResponse>> getStreamToken(
      String streamCreateTokenUrl, String userId, String firebaseToken);

  Future<Either<Failure, bool>> revokeStreamToken(
      String streamRevokeTokenUrl, String userId, String firebaseToken);

  Future<Either<Failure, bool>> addChannelMessage(String streamMessageUrl,
      String channelId, String userId, String message, String firebaseToken);
}

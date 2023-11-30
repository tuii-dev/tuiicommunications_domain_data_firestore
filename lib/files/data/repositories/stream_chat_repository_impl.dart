import 'package:dartz/dartz.dart';
import 'package:tuiicommunications_domain_data_firestore/files/data/datasources/stream_chat_data_source.dart';
import 'package:tuiicommunications_domain_data_firestore/files/domain/repositories/stream_chat_repository.dart';
import 'package:tuiicore/core/errors/failure.dart';
import 'package:tuiientitymodels/files/communications/data/models/create_stream_token_response.dart';

class StreamChatRepositoryImpl implements StreamChatRepository {
  final StreamChatDataSource dataSource;

  StreamChatRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, CreateStreamTokenResponse>> getStreamToken(
      String streamCreateTokenUrl, String userId, String firebaseToken) async {
    try {
      final streamTokenResponse = await dataSource.getStreamToken(
          streamCreateTokenUrl, userId, firebaseToken);

      return Right(streamTokenResponse);
    } on Failure catch (err) {
      return Left(err);
    }
  }

  @override
  Future<Either<Failure, bool>> revokeStreamToken(
      String streamRevokeTokenUrl, String userId, String firebaseToken) async {
    try {
      final success = await dataSource.revokeStreamToken(
          streamRevokeTokenUrl, userId, firebaseToken);

      return Right(success);
    } on Failure catch (err) {
      return Left(err);
    }
  }

  @override
  Future<Either<Failure, bool>> addChannelMessage(
      String streamMessageUrl,
      String channelId,
      String userId,
      String message,
      String firebaseToken) async {
    try {
      final success = await dataSource.addChannelMessage(
          streamMessageUrl, channelId, userId, message, firebaseToken);

      return Right(success);
    } on Failure catch (err) {
      return Left(err);
    }
  }
}

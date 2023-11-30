import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tuiicommunications_domain_data_firestore/files/domain/repositories/stream_chat_repository.dart';
import 'package:tuiicore/core/errors/failure.dart';
import 'package:tuiicore/core/usecases/usecase.dart';
import 'package:tuiientitymodels/files/communications/data/models/create_stream_token_response.dart';

class CreateStreamTokenUseCase
    extends UseCase<CreateStreamTokenResponse, CreateStreamTokenParams> {
  final StreamChatRepository repository;

  CreateStreamTokenUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, CreateStreamTokenResponse>> call(
      CreateStreamTokenParams params) async {
    final tokenEither = await repository.getStreamToken(
        params.streamCreateTokenUrl, params.userId, params.firebaseToken);

    return tokenEither.fold((failure) {
      return Left(failure);
    }, (response) {
      return Right(response);
    });
  }
}

class CreateStreamTokenParams extends Equatable {
  final String userId;
  final String streamCreateTokenUrl;
  final String firebaseToken;

  const CreateStreamTokenParams({
    required this.userId,
    required this.streamCreateTokenUrl,
    required this.firebaseToken,
  });

  @override
  List<Object?> get props {
    return [
      userId,
      streamCreateTokenUrl,
      firebaseToken,
    ];
  }
}

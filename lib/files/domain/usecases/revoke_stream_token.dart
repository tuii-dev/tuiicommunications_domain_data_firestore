import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tuiicommunications_domain_data_firestore/files/domain/repositories/stream_chat_repository.dart';
import 'package:tuiicore/core/errors/failure.dart';
import 'package:tuiicore/core/usecases/usecase.dart';

class RevokeStreamTokenUseCase extends UseCase<bool, RevokeStreamTokenParams> {
  final StreamChatRepository repository;

  RevokeStreamTokenUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(RevokeStreamTokenParams params) async {
    final tokenEither = await repository.revokeStreamToken(
        params.streamRevokeTokenUrl, params.userId, params.firebaseToken);

    return tokenEither.fold((failure) {
      return Left(failure);
    }, (response) {
      return Right(response);
    });
  }
}

class RevokeStreamTokenParams extends Equatable {
  final String userId;
  final String streamRevokeTokenUrl;
  final String firebaseToken;

  const RevokeStreamTokenParams({
    required this.userId,
    required this.streamRevokeTokenUrl,
    required this.firebaseToken,
  });

  @override
  List<Object?> get props {
    return [
      userId,
      streamRevokeTokenUrl,
      firebaseToken,
    ];
  }
}

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tuiicommunications_domain_data_firestore/files/domain/repositories/stream_chat_repository.dart';
import 'package:tuiicore/core/errors/failure.dart';
import 'package:tuiicore/core/usecases/usecase.dart';

class AddChannelMessageUseCase extends UseCase<bool, AddChannelMessageParams> {
  final StreamChatRepository repository;

  AddChannelMessageUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, bool>> call(AddChannelMessageParams params) async {
    final messageEither = await repository.addChannelMessage(
        params.streamMessageUrl,
        params.channelId,
        params.userId,
        params.message,
        params.firebaseToken);

    return messageEither.fold((failure) {
      return Left(failure);
    }, (response) {
      return Right(response);
    });
  }
}

class AddChannelMessageParams extends Equatable {
  final String streamMessageUrl;
  final String firebaseToken;
  final String channelId;
  final String userId;
  final String message;

  const AddChannelMessageParams({
    required this.streamMessageUrl,
    required this.firebaseToken,
    required this.channelId,
    required this.userId,
    required this.message,
  });

  @override
  List<Object?> get props {
    return [
      streamMessageUrl,
      firebaseToken,
      channelId,
      userId,
      message,
    ];
  }
}

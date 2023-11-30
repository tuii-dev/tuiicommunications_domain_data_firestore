import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuiicommunications_domain_data_firestore/files/data/datasources/stream_chat_data_source.dart';
import 'package:tuiicore/core/errors/failure.dart';
import 'package:tuiientitymodels/files/communications/data/models/add_message_model.dart';
import 'package:tuiientitymodels/files/communications/data/models/create_stream_token_response.dart';

class StreamChatDataSourceImpl implements StreamChatDataSource {
  @override
  Future<CreateStreamTokenResponse> getStreamToken(
      String streamCreateTokenUrl, String userId, String firebaseToken) async {
    final url = Uri.parse(streamCreateTokenUrl + userId);
    debugPrint('Firebase token: $firebaseToken');
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $firebaseToken',
    });

    if (response.statusCode == 200) {
      return CreateStreamTokenResponse.fromMap(json.decode(response.body));
    } else {
      throw const Failure(message: 'Failed to create zoom token.');
    }
  }

  @override
  Future<bool> revokeStreamToken(
      String streamRevokeTokenUrl, String userId, String firebaseToken) async {
    final url = Uri.parse(streamRevokeTokenUrl + userId);
    debugPrint('Firebase token: $firebaseToken');
    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $firebaseToken',
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw const Failure(message: 'Failed to revoke stream token.');
    }
  }

  @override
  Future<bool> addChannelMessage(String streamMessageUrl, String channelId,
      String userId, String message, String firebaseToken) async {
    final url = Uri.parse(streamMessageUrl);
    debugPrint('Firebase token: $firebaseToken');

    final payload =
        AddMessageModel(channelId: channelId, userId: userId, message: message);

    final response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $firebaseToken',
        },
        body: payload.toJson());

    if (response.statusCode == 200) {
      return true;
    } else {
      throw const Failure(message: 'Failed to add message to channel.');
    }
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class HttpClientMockAdapter implements HttpClientAdapter {
  static const mockHost = 'mockserver';
  static const mockBase = 'https://$mockHost';
  final _adapter = IOHttpClientAdapter();
  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final uri = options.uri;
    if (uri.host == mockHost) {
      switch (uri.path) {
        case '/login/':
          return ResponseBody.fromString(
            jsonEncode({'name': 'test', 'token': 'token'}),
            200,
            headers: {
              Headers.contentTypeHeader: [Headers.jsonContentType],
            },
          );
        default:
          return ResponseBody.fromString('', 404);
      }
    }
    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}

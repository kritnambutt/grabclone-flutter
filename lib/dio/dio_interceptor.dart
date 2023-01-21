import 'package:dio/dio.dart';
import 'package:grabclone/dio/dio_client.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // do something before request is sent

    // 1. Add userId to private endpoints
    // Suppose the path contains open in public
    if (!options.path.contains('open')) {
      options.queryParameters["userId"] = "xxx";
    }

    // 2. Validate the user and append the token
    // token can be obtained from shared preference
    options.headers["token"] = "xxx";

    // 3. Requesting a refresh token
    if (options.headers['refreshToken'] == null) {
      // ignore: deprecated_member_use
      DioClient.dio.lock();
      Dio _tokenDio = Dio();
      _tokenDio.get('/token').then((d) {
        options.headers['refreshToken'] = d.data['data']['token'];
        handler.next(options);
      }).catchError((error, stackTrace) {
        handler.reject(error, true);
      }).whenComplete(() {
        // ignore: deprecated_member_use
        DioClient.dio.unlock();
      });
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // do something before response
    if (response.statusCode == 200) {
    } else {
      if (response.requestOptions.baseUrl.contains("secret")) {}

      // forward the response
      return super.onResponse(response, handler);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // do something to error
    switch (err.type) {
      case DioErrorType.connectTimeout:
        {}
        break;
      case DioErrorType.receiveTimeout:
        {}
        break;
      case DioErrorType.sendTimeout:
        {}
        break;
      case DioErrorType.cancel:
        {}
        break;
      case DioErrorType.response:
        {}
        break;
      case DioErrorType.other:
        {}
        break;
      default:
        break;
    }

    // forward the error
    super.onError(err, handler);
  }
}

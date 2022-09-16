import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioModule {
  DioModule();

  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }
    BaseOptions options = BaseOptions(
      //baseUrl: 'http://10.0.2.2:3333/',
      //baseUrl: 'http://192.168.1.101:1337' // local address
      //baseUrl: 'https://testingservices321.azurewebsites.net' //cloud
      baseUrl: 'https://reqres.in/',
    );
    _dio = Dio(options);

    _dio!.interceptors
        .add(PrettyDioLogger(request: true, requestBody: false, responseBody: false, requestHeader: false));
    // _dio!.interceptors.add(RetryInterceptor(
    //   dio: dio,
    //   logPrint: print, // specify log function (optional)
    //   retries: 4, // retry count (optional)
    //   retryDelays: const [
    //     // set delays between retries (optional)
    //     Duration(seconds: 1), // wait 1 sec before the first retry
    //     Duration(seconds: 2), // wait 2 sec before the second retry
    //     Duration(seconds: 3), // wait 3 sec before the third retry
    //     Duration(seconds: 4), // wait 4 sec before the fourth retry
    //   ],
    //   //retryableExtraStatuses: {status401Unauthorized},
    // ));

    return _dio!;
  }
}

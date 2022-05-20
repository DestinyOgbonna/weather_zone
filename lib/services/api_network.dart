import 'package:dio/dio.dart';

class NetworkCalls {
  final dio= Dio ();
  //NetworkCalls({required this.dio});
  Future getData(
    String apiUrl,
    //equired String token,
  ) async {
    var getDataFromApi = await dio.get(apiUrl).timeout(
          const Duration(milliseconds: 3000),
        );

    return getDataFromApi;
  }
}

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../features/tafseer/data/models/aya_tafseer_model.dart';
import 'api_constant.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET('${ApiConstant.translation}{index}')
  Future<TafseerModel> tafseerSurah(@Path('index') int index);
}

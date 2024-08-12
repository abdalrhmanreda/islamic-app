import '../../../../core/api/api_result.dart';
import '../../../../core/api/api_service.dart';

class TafseerRepo {
  final ApiService _apiService;
  TafseerRepo(this._apiService);

  Future<ApiResult> getTafseer(int index) async {
    try {
      final response = await _apiService.tafseerSurah(index);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.error(e.toString());
    }
  }
}

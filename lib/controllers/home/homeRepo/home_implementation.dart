import 'package:smartpay/controllers/home/homeRepo/home_services.dart';
import 'package:smartpay/models/dashboard/dashboardResponse.dart';
import 'package:smartpay/network_helper.dart/api_constants.dart';
import 'package:smartpay/network_helper.dart/dio_client.dart';

class DashboardImpl extends DashoardService {
  @override
  Future<DashboardResponse> dashboard() async {
    try {
      final res = await DioClient.apiCall(
        apiPath: ApiPath.getSecretMsg,
        method: RequestMethod.get,
      );

      return DashboardResponse.fromJson(res?.data);
    } catch (e) {
      rethrow;
    }
  }
}

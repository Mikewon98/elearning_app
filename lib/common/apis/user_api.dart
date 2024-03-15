import 'package:learningapp/common/entities/entities.dart';
import 'package:learningapp/common/utils/http_util.dart';

class UserAPI {
  static login({LoginRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/login',
      queryParameters: params?.toJson(),
    );

    print(response.toString());
  }
}

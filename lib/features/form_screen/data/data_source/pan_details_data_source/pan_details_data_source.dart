import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pixel6_assignment/features/form_screen/data/model/pan_detail_model/pan_detail_model.dart';

class PanDetailsDataSource {
  Dio dio = Dio();

  Future<List<PanDetailModel>> postPanNumberToDataSource(
      {required String panNumber}) async {
    try {
      const url = 'lab.pixel6.co/api/verify-pan.php';
      //const url = 'http://lab.pixel6.co/api/verify-pan.php';

      log('request');
      Response response = await dio.post(url, data: {"panNumber": panNumber});
      print(response.data);
      if (response.statusCode == 200) {
        print('successs');

        List<dynamic> panInfoList = await response.data;
        List<PanDetailModel> panDetailsList =
            panInfoList.map((item) => PanDetailModel.fromJson(item)).toList();
        return panDetailsList;
      } else {
        print('request fail ${response.statusCode}');
        return [];
      }
    } catch (e) {
      throw (Exception(e));
    }
  }
}

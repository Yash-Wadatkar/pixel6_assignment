import 'package:pixel6_assignment/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:pixel6_assignment/features/form_screen/data/data_source/pan_details_data_source/pan_details_data_source.dart';
import 'package:pixel6_assignment/features/form_screen/data/model/pan_detail_model/pan_detail_model.dart';
import 'package:pixel6_assignment/features/form_screen/domain/entity/pan_details_entity/pan_details_entity.dart';
import 'package:pixel6_assignment/features/form_screen/domain/repository/pan_details_repository/pan_details_repository.dart';

class PanDetailRepositoryImpl implements PanDetailsRepository {
  @override
  Future<List<PanDetailsEntity>> postPanNumber(
      {required String panNumber}) async {
    // TODO: implement postPanNumber
    // throw UnimplementedError();
    final panDetails = await locator<PanDetailsDataSource>()
        .postPanNumberToDataSource(panNumber: panNumber);
    return panDetails
        .map(
            (detail) => PanDetailModel.fromJson(detail as Map<String, dynamic>))
        .toList();
  }
}

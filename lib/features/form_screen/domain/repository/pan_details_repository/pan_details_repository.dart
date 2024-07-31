import 'package:pixel6_assignment/features/form_screen/domain/entity/pan_details_entity/pan_details_entity.dart';

abstract class PanDetailsRepository {
  //Future<List<PanDetailsEntity>> getPanDetails();

  Future<List<PanDetailsEntity>> postPanNumber({required String panNumber});
}

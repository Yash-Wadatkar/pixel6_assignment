import 'package:pixel6_assignment/features/form_screen/domain/entity/pan_details_entity/pan_details_entity.dart';
import 'package:pixel6_assignment/features/form_screen/domain/repository/pan_details_repository/pan_details_repository.dart';

class PanDetailsUsecase {
  final PanDetailsRepository panDetailsRepository;

  PanDetailsUsecase({required this.panDetailsRepository});

  // Future<List<PanDetailsEntity>> getPanDetailsUsecase() {
  //   return panDetailsRepository.getPanDetails();
  // }

  Future<List<PanDetailsEntity>> postPanNumberUsecase(
      {required String panNumber}) {
    return panDetailsRepository.postPanNumber(panNumber: panNumber);
  }
}

import 'package:pixel6_assignment/features/form_screen/domain/entity/pan_details_entity/pan_details_entity.dart';

class PanDetailModel extends PanDetailsEntity {
  final bool isValid;
  final String fullName;

  PanDetailModel({required this.isValid, required this.fullName})
      : super(fullName: fullName, isValid: isValid);

  factory PanDetailModel.fromJson(Map<String, dynamic> map) {
    return PanDetailModel(isValid: map['isValid'], fullName: map['fullName']);
  }
}

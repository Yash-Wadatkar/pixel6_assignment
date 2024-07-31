import 'package:get_it/get_it.dart';
import 'package:pixel6_assignment/features/form_screen/data/data_source/pan_details_data_source/pan_details_data_source.dart';
import 'package:pixel6_assignment/features/form_screen/data/repository_impl/pan_detail_repository_impl/pan_detail_repository_impl.dart';
import 'package:pixel6_assignment/features/form_screen/domain/repository/pan_details_repository/pan_details_repository.dart';
import 'package:pixel6_assignment/features/form_screen/domain/usecase/pan_details_usecase/pan_details_usecase.dart';

GetIt locator = GetIt.instance;

void setUp() {
  locator.registerSingleton(PanDetailsDataSource());
  locator.registerSingleton(PanDetailRepositoryImpl());
  locator.registerSingleton(PanDetailsUsecase(
      panDetailsRepository: locator<PanDetailRepositoryImpl>()));
}

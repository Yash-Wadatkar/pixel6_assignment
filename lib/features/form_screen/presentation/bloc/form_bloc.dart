import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel6_assignment/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:pixel6_assignment/features/form_screen/domain/usecase/pan_details_usecase/pan_details_usecase.dart';
import 'package:pixel6_assignment/features/form_screen/presentation/bloc/form_event.dart';
import 'package:pixel6_assignment/features/form_screen/presentation/bloc/form_state.dart';

class FormBloc extends Bloc<FormEvent, FormsState> {
  FormBloc() : super(AddressState(addresses: [0])) {
    on<AddAddressButtonClickedEvent>(addAddressButtonClickedEvent);
    on<DeleteAddressButtonClickedEvent>(deleteAddressButtonClickedEvent);
    on<SavedButtonClickedEvent>(savedButtonClickedEvent);
  }

  FutureOr<void> addAddressButtonClickedEvent(
      AddAddressButtonClickedEvent event, Emitter emit) {
    final addressState = state as AddressState;
    if (addressState.addresses.length < 10) {
      emit(AddressState(
          addresses: List.from(
              addressState.addresses..add(addressState.addresses.length))));
    }
  }

  FutureOr<void> deleteAddressButtonClickedEvent(
      DeleteAddressButtonClickedEvent event, Emitter<FormsState> emit) {
    final addressState = state as AddressState;
    if (addressState.addresses.length > 1) {
      emit(AddressState(
          addresses: List.from(addressState.addresses)..removeLast()));
    }
  }

  FutureOr<void> savedButtonClickedEvent(
      SavedButtonClickedEvent event, Emitter<FormsState> emit) async {
    try {
      await locator<PanDetailsUsecase>()
          .postPanNumberUsecase(panNumber: event.panNumber);
      emit(PanVerifiedState());
    } catch (e) {
      print('Error occurred while verifying PAN: $e');
      // Handle error state if needed
    }
  }
}

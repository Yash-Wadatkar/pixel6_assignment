sealed class FormsState {}

class FormInitialState extends FormsState {}

class AddressState extends FormsState {
  final List<int> addresses;
  AddressState({required this.addresses});
}

class PanVerifiedState extends FormsState {}

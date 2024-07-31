sealed class FormEvent {}

class FormInitialEvent extends FormEvent {}

class AddAddressButtonClickedEvent extends FormEvent {}

class DeleteAddressButtonClickedEvent extends FormEvent {}

class SavedButtonClickedEvent extends FormEvent {
  final String panNumber;

  SavedButtonClickedEvent({required this.panNumber});
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial());
  List<Contact> foundUsers = [];
  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is ContactInitialEvent) {
      if (await Permission.contacts.request().isGranted) {
        List<Contact> contact =
            (await ContactsService.getContacts(withThumbnails: false)).toList();
        foundUsers = contact;
      }
      yield ContactLoadedState();
    }
  }
}

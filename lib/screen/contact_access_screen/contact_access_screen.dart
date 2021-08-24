import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/screen/contact_access_screen/bloc/contact_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 12;

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController searchController = new TextEditingController();
  late ContactBloc contactBloc;

  @override
  void initState() {
    super.initState();

    contactBloc = ContactBloc()..add(ContactInitialEvent());
  }

  void runFilter(String enteredKeyword) {
    List<Contact> results = [];
    if (enteredKeyword.isEmpty) {
      results = contactBloc.foundUsers;
    } else {
      results = contactBloc.foundUsers
          .where((user) => user.displayName
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      contactBloc.foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactBloc, ContactState>(
      bloc: contactBloc,
      listener: (context, state) {},
      child: BlocBuilder<ContactBloc, ContactState>(
        bloc: contactBloc,
        builder: (context, state) {
          if (state is ContactLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is ContactLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.ContactsAccess,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Column(
                children: [
                  TABNAVIGATION(screenId: screenId),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      child: TextField(
                        controller: searchController,
                        onChanged: (value) => runFilter(value),
                        decoration: InputDecoration(
                            labelText: StringResource.Search,
                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                    color: Theme.of(context).primaryColor)),
                            prefixIcon: Icon(Icons.search,
                                color: Theme.of(context).primaryColor)),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  contactBloc.foundUsers == []
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: contactBloc.foundUsers.length,
                            itemBuilder: (context, index) {
                              Contact contact = contactBloc.foundUsers[index];
                              return ListTile(
                                  title: Text_Widget(
                                    text: contact.displayName.toString(),
                                    font_size: SizeResource.size12,
                                    colour: ColorResource.color1c1d22,
                                    font_family:
                                        FontFamilyResource.PoppinsMedium,
                                  ),
                                  subtitle: Text_Widget(
                                    text: contact.phones!
                                        .elementAt(0)
                                        .value
                                        .toString(),
                                    font_size: SizeResource.size12,
                                    colour: ColorResource.color1c1d22,
                                    font_family:
                                        FontFamilyResource.PoppinsMedium,
                                  ),
                                  leading: (contact.avatar != null &&
                                          contact.avatar!.length > 0)
                                      ? CircleAvatar(
                                          backgroundImage:
                                              MemoryImage(contact.avatar!),
                                        )
                                      : CircleAvatar(
                                          child: Center(
                                              child: Text(contact.initials())),
                                        ));
                            },
                          ),
                        ),
                ],
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

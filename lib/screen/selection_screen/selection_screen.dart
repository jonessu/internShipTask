import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/contact_list.dart';
import 'package:intershiptasks/data/models/contact_model.dart';
import 'package:intershiptasks/screen/selection_screen/bloc/selection_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 8;

class SelectionSCREEN extends StatefulWidget {
  SelectionSCREEN({Key? key}) : super(key: key);

  @override
  _SelectionSCREENState createState() => _SelectionSCREENState();
}

class _SelectionSCREENState extends State<SelectionSCREEN> {
  List<ContactModel> selectedContacts = [];
  late SelectionBloc selectionBloc;
  @override
  void initState() {
    super.initState();
    selectionBloc = SelectionBloc()..add(SelectionInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SelectionBloc, SelectionState>(
      bloc: selectionBloc,
      listener: (context, state) {},
      child: BlocBuilder<SelectionBloc, SelectionState>(
        bloc: selectionBloc,
        builder: (context, state) {
          if (state is SelectionLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is SelectionLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.SelectioninList,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Column(
                children: [
                  TABNAVIGATION(screenId: screenId),
                  Expanded(
                    child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green[700],
                              child: Icon(
                                Icons.person_outline_outlined,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              contacts[index].name,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(contacts[index].phoneNumber),
                            trailing: contacts[index].isSelected
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green[700],
                                  )
                                : Icon(
                                    Icons.check_circle_outline,
                                    color: Colors.grey,
                                  ),
                            onTap: () {
                              setState(() {
                                contacts[index].isSelected =
                                    !contacts[index].isSelected;
                                if (contacts[index].isSelected == true) {
                                  selectedContacts.add(ContactModel(
                                      contacts[index].name,
                                      contacts[index].phoneNumber,
                                      true));
                                } else if (contacts[index].isSelected ==
                                    false) {
                                  selectedContacts.removeWhere((element) =>
                                      element.name == contacts[index].name);
                                }
                              });
                            },
                          );
                        }),
                  ),
                  selectedContacts.length > 0
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 10,
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              color: Colors.green[700],
                              child: Text(
                                "Delete (${selectedContacts.length})",
                                style: TextStyle(
                                  color: ColorResource.colorwhite,
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            );
          }
          return Container(
            color: ColorResource.colorred,
          );
        },
      ),
    );
  }
}

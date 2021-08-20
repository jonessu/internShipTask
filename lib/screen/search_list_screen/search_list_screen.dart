import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/data/searching_data_list.dart';
import 'package:intershiptasks/screen/search_list_screen/bloc/searchlist_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/tab_navigaiton.dart';
import 'package:intershiptasks/widgets/text_widget.dart';

int screenId = 7;

class SearchlistSCREEN extends StatefulWidget {
  SearchlistSCREEN({Key? key}) : super(key: key);

  @override
  _SearchlistSCREENState createState() => _SearchlistSCREENState();
}

class _SearchlistSCREENState extends State<SearchlistSCREEN> {
  late SearchlistBloc searchlistBloc;

  @override
  void initState() {
    super.initState();
    searchlistBloc = SearchlistBloc()..add(SearchlistInitialEvent());
  }

  void runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = searchlist;
    } else {
      results = searchlist
          .where((user) => user["email"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      searchlistBloc.foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchlistBloc, SearchlistState>(
      bloc: searchlistBloc,
      listener: (context, state) {},
      child: BlocBuilder<SearchlistBloc, SearchlistState>(
        bloc: searchlistBloc,
        builder: (context, state) {
          if (state is SearchlistLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is SearchlistLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.ListDetail,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    TABNAVIGATION(screenId: screenId),
                    Padding(
                      padding: const EdgeInsets.all(
                        SizeResource.size10,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextField(
                              onChanged: (value) => runFilter(value),
                              decoration: InputDecoration(
                                  labelText: 'Search',
                                  suffixIcon: Icon(Icons.search)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: searchlistBloc.foundUsers.length > 0
                                ? ListView.builder(
                                    itemCount: searchlistBloc.foundUsers.length,
                                    itemBuilder: (context, index) => Card(
                                      key: ValueKey(searchlistBloc
                                          .foundUsers[index]["id"]),
                                      color: ColorResource.color0066cc,
                                      elevation: 4,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: ListTile(
                                        leading: Text_Widget(
                                          text: searchlistBloc.foundUsers[index]
                                                  ["id"]
                                              .toString(),
                                          colour: ColorResource.colorwhite,
                                          font_size: SizeResource.size30,
                                          font_family: FontFamilyResource
                                              .PoppinsSemiBold,
                                        ),
                                        title: Text_Widget(
                                          text: searchlistBloc.foundUsers[index]
                                              ['email'],
                                          colour: ColorResource.colorwhite,
                                          font_size: SizeResource.size20,
                                          font_family: FontFamilyResource
                                              .PoppinsSemiBold,
                                        ),
                                      ),
                                    ),
                                  )
                                : Text(
                                    'No List found',
                                    style: TextStyle(fontSize: 24),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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

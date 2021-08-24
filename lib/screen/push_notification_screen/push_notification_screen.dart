import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intershiptasks/main.dart';
import 'package:intershiptasks/screen/push_notification_screen/bloc/notification_bloc.dart';
import 'package:intershiptasks/utils/color_resource.dart';
import 'package:intershiptasks/utils/fontFamily_resource.dart';
import 'package:intershiptasks/utils/font_size_resource.dart';
import 'package:intershiptasks/utils/string_resources.dart';
import 'package:intershiptasks/widgets/text_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

int screenId = 28;

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationBloc notificationBloc;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    notificationBloc = NotificationBloc()..add(NotificationInitialEvent());
    // var androidInitilize = new AndroidInitializationSettings('ic_launcher');
    // var iOSinitilize = new IOSInitializationSettings();
    // var initilizationsSettings = new InitializationSettings(
    //     android: androidInitilize, iOS: iOSinitilize);
    // flutterNotification = new FlutterLocalNotificationsPlugin();
    // flutterNotification.initialize(initilizationsSettings,
    //     onSelectNotification: notificationSelected);
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
      "Channel ID",
      "Desi programmer",
      "This is my channel",
      importance: Importance.max,
    );
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails = new NotificationDetails(
      android: androidDetails,
      iOS: iSODetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      "Task",
      "You created a Task",
      generalNotificationDetails,
      payload: "Task",
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationBloc, NotificationState>(
      bloc: notificationBloc,
      listener: (context, state) {},
      child: BlocBuilder<NotificationBloc, NotificationState>(
        bloc: notificationBloc,
        builder: (context, state) {
          if (state is NotificationLoadingState) {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          } else if (state is NotificationLoadedState) {
            return Scaffold(
              appBar: AppBar(
                title: Text_Widget(
                  text: StringResource.PushNotification,
                  font_size: SizeResource.size20,
                  colour: ColorResource.colorwhite,
                  font_family: FontFamilyResource.PoppinsMedium,
                ),
              ),
              body: Center(
                child: RaisedButton(
                  onPressed: showNotification,
                  child: Text_Widget(
                    text: "Notification",
                    font_size: SizeResource.size20,
                    colour: ColorResource.color1c1d22,
                    font_family: FontFamilyResource.PoppinsSemiBold,
                  ),
                ),
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

  Future notificationSelected(String? payload) async {}
  // showDialog(
  //   context: context,
  //   builder: (context) => AlertDialog(
  //     content: Text("Notification : $payload"),
  //   ),
  // );

}

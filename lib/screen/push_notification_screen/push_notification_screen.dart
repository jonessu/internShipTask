import 'package:firebase_messaging/firebase_messaging.dart';
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
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text("title"),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("notification.body")],
                  ),
                ),
              );
            });
      }
    });
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
      "This is ",
      "my programmer",
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
      "I am created a Task",
      generalNotificationDetails,
      payload: "Task",
    );
  }

  int _counter = 0;

  void show1Notification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Testing $_counter",
        "How you doin ?",
        NotificationDetails(
            android: AndroidNotificationDetails(
                channel.id, channel.name, channel.description,
                importance: Importance.high,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher')));
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
              // body:
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: show1Notification,
                tooltip: 'Increment',
                child: Icon(Icons.add),
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

  Future notificationSelected(String? payload) async {
    print("Notification Clicked");
  }
  // showDialog(
  //   context: context,
  //   builder: (context) => AlertDialog(
  //     content: Text("Notification : $payload"),
  //   ),
  // );

}

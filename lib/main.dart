import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Notification research Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  String message;
  String channelId = "1000";
  String channelName = "FLUTTER_NOTIFICATION_CHANNEL";
  String channelDescription = "FLUTTER_NOTIFICATION_CHANNEL_DETAIL";

  @override
  initState() {
    message = "No message.";

    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {
      print("onDidReceiveLocalNotification called.");
    });
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      // when user tap on notification.
      print("onSelectNotification called.");
      setState(() {
        message = payload;
      });
    });
    super.initState();
  }

  set_noti_off(int id) {
    flutterLocalNotificationsPlugin.cancel(id);
  }

  sendNotification(int id, String testParam) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails('10000',
        'FLUTTER_NOTIFICATION_CHANNEL', 'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    if (testParam == "1 time") {
      await flutterLocalNotificationsPlugin.show(id, 'Hello, Mo.',
          'This is a mo\'s notifications. ', platformChannelSpecifics,
          payload: 'Hello I\'m payload from button A');
    } else {
      await flutterLocalNotificationsPlugin.periodicallyShow(
          id,
          'Hello, Mo.',
          'This is a mo\'s notifications. ',
          RepeatInterval.EveryMinute,
          platformChannelSpecifics,
          payload: 'Hello I\'m payload from button B');
    }
  }

  sendNotificationWithPictureUrl() async {
    // String pathFile = await downloadImage(
    //     "https://images.pexels.com/photos/2213547/pexels-photo-2213547.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     "example");

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        channelId, channelName, channelDescription,
        importance: Importance.Max,
        priority: Priority.High,
        largeIcon: "ic_launcher",
        // largeIconBitmapSource: BitmapSource.FilePath,
        style: AndroidNotificationStyle.BigPicture,
        styleInformation:
            BigPictureStyleInformation("photo_1", BitmapSource.Drawable));

    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(111, 'Hello, Mo again.',
        'This is a your notifications with picture. ', platformChannelSpecifics,
        payload: 'I just haven\'t Met You Yet');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              message,
              style: TextStyle(fontSize: 24),
            ),
            RaisedButton(
              onPressed: () {
                sendNotification(1, "1 time");
              },
              child: Text(
                'Button A [Noti when click]',
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              onPressed: () {
                sendNotification(2, "evey minute");
              },
              child: Text(
                'Button B [Every minutes noti]',
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              onPressed: () {
                set_noti_off(2);
              },
              child: Text(
                'Button C [Stop every minutes noti]',
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              onPressed: () {
                sendNotificationWithPictureUrl();
              },
              child: Text(
                'Button D [Noti with picture when click]',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     sendNotification();
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.send),
      // ),
    );
  }

  downloadImage(String s, String t) {}
}

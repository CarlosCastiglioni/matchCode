import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'api/notification_api.dart';
import 'app_widget.dart';
import 'firebase_options.dart';

void main() {
  runApp(const AppFirebase());
}

class AppFirebase extends StatefulWidget {
  const AppFirebase({Key? key}) : super(key: key);

  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    NotificationApi.init();

    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Material(
              child: Center(
                child: Text(
                  "Firebase not available",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return const AppWidget();
          } else {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

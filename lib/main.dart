import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:provider/provider.dart';
import 'package:sqflitenew/firebase_options.dart';
import 'package:sqflitenew/provider/database_provider.dart';
import 'package:http/http.dart' as http;
import 'package:sqflitenew/screens/splash/splash_screen.dart';
import 'package:sqflitenew/services/sqflite_db.dart';

bool shouldUseFirestoreEmulator = true;

void checkGooglePlayServices() async {
  GooglePlayServicesAvailability availability = await GoogleApiAvailability
      .instance
      .checkGooglePlayServicesAvailability();

  if (availability != GooglePlayServicesAvailability.success) {
    await GoogleApiAvailability.instance.makeGooglePlayServicesAvailable();
    print("Google Play Services are now available.");
  } else {
    print("Google Play Services are available.");
  }
}

Future<Uint8List> loadBundleSetup(int number) async {
  // endpoint serves a bundle with 3 documents each containing
  // a 'number' property that increments in value 1-3.
  final url =
      Uri.https('api.rnfirebase.io', '/firestore/e2e-tests/bundle-$number');
  final response = await http.get(url);
  String string = response.body;
  return Uint8List.fromList(string.codeUnits);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  checkGooglePlayServices();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  if (shouldUseFirestoreEmulator) {
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  }

  await DatabaseHelper().initDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DatabaseProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
         scaffoldBackgroundColor: Colors.white
        ),
        home: SplashScreen(),
      ),
    );
  }
}

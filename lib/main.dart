import 'package:flutter/material.dart';
import 'routes.dart';
import 'package:provider/provider.dart';
import 'application/auth/auth_notifier.dart';
import 'application/booking/booking_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'application/auth/auth_service.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthNotifier()),
        ChangeNotifierProvider(create: (context) => BookingNotifier()),
        Provider.value(value: authService), // Use the authService instance from routes.dart
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return MaterialApp(
      title: 'Sports Facility Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(authService: authService),
        '/signup': (context) => SignupPage(authService: authService),
        // Other routes
      },
    );
  }
}

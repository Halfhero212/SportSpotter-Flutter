import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'application/auth/auth_service.dart';
import 'presentation/pages/login_page.dart';
import 'presentation/pages/signup_page.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/pages/facility_details_page.dart';
import 'presentation/pages/booking_page.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

final AuthService authService = AuthService(_firebaseAuth, _googleSignIn);

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => LoginPage(authService: authService),
  '/signup': (BuildContext context) => SignupPage(authService: authService),
  '/home': (BuildContext context) => HomePage(),
  '/facilityDetails': (BuildContext context) => FacilityDetailsPage(),
  '/booking': (BuildContext context) => BookingPage(),
};

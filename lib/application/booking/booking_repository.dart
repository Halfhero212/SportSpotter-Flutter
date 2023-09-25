import 'package:firebase_database/firebase_database.dart';
import 'booking_model.dart';

class BookingRepository {
  final DatabaseReference _bookingRef =
      FirebaseDatabase.instance.reference().child('bookings');

  Future<void> saveBooking(Booking booking) async {
    final newBookingRef = _bookingRef.push();

    await newBookingRef.set({
      'facilityId': booking.facilityId,
      'userId': booking.userId,
      'startTime': booking.startTime.toIso8601String(),
      'endTime': booking.endTime.toIso8601String(),
      'price': booking.price,
    });
  }
}

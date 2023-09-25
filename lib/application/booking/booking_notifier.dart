import 'package:flutter/widgets.dart';
import 'booking_model.dart';
import 'booking_repository.dart';

class BookingNotifier extends ChangeNotifier {
  List<Booking> _bookings = [];
  final BookingRepository _bookingRepository = BookingRepository();

  List<Booking> get bookings => _bookings;

  Future<void> addBooking(Booking booking) async {
    _bookings.add(booking);
    await _bookingRepository.saveBooking(booking);
    notifyListeners();
  }
}

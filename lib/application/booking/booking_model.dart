class Booking {
  final String facilityId;
  final String userId;
  final DateTime startTime;
  final DateTime endTime;
  final double price;

  Booking({
    required this.facilityId,
    required this.userId,
    required this.startTime,
    required this.endTime,
    required this.price,
  });
}

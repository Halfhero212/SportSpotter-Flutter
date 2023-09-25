import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportspotter/application/booking/booking_model.dart';
import 'package:sportspotter/application/booking/booking_notifier.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now().add(Duration(hours: 1));
  double _price = 0.0;

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();

    final booking = Booking(
      facilityId: 'sample_facility_id',
      userId: 'sample_user_id',
      startTime: _startTime,
      endTime: _endTime,
      price: _price,
    );

    Provider.of<BookingNotifier>(context, listen: false).addBooking(booking);
    // Navigate to a confirmation page or show a success message.
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Booking')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            ListTile(
              title: Text('Start Time: ${_startTime.toString()}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final startTime = await showDatePicker(
                  context: context,
                  initialDate: _startTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (startTime != null) {
                  setState(() {
                    _startTime = startTime;
                  });
                }
              },
            ),
            ListTile(
              title: Text('End Time: ${_endTime.toString()}'),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                final endTime = await showDatePicker(
                  context: context,
                  initialDate: _endTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (endTime != null) {
                  setState(() {
                    _endTime = endTime;
                  });
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                return null;
              },
              onSaved: (value) {
                _price = double.tryParse(value!) ?? 0.0;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit Booking'),
            ),
          ],
        ),
      ),
    ),
  );
}
}
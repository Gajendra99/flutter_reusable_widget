import 'package:flutter/material.dart';
import 'package:flutter_page_transition/rating_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rating Widget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reusable Rating Widget'),
        ),
        body: Center(
            child: RatingWidget(
          maxRating: 5,
          initialRating: 3,
          onRatingChanged: (newRating) {
            print('New Rating : $newRating');
          },
          color: Colors.green,
        )),
      ),
    );
  }
}

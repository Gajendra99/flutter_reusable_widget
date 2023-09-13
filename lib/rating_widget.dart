import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final int maxRating;
  final int initialRating;
  final Function(int) onRatingChanged;
  final Color color;
  IconData? filledIcon;
  IconData? blankIcon;

  RatingWidget(
      {required this.maxRating,
      required this.initialRating,
      required this.onRatingChanged,
      required this.color,
      this.filledIcon,
      this.blankIcon});

  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _currentRating = 0;

  @override
  void initState() {
    super.initState();

    _currentRating = widget.initialRating;
    if (_currentRating > 0) {
      _currentRating = _currentRating - 1;
    }
  }

  void _updateRating(int newRating) {
    setState(() {
      _currentRating = newRating;
      widget.onRatingChanged(_currentRating + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> starWidgets = [];

    for (int i = 0; i < widget.maxRating; i++) {
      starWidgets.add(InkWell(
        onTap: () {
          _updateRating(i);
        },
        child: Icon(
          (_currentRating >= i
              ? (widget.filledIcon ?? Icons.star)
              : (widget.blankIcon ?? Icons.star_border)),
          color: widget.color,
        ),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: starWidgets,
    );
  }
}

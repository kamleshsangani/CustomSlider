import 'package:flutter/material.dart';
import 'polygon_thumb_shape.dart';
import 'polygon_thumb_shape1.dart';
import 'RoundedRectangleThumbShape.dart';
import 'constants.dart';

//https://levelup.gitconnected.com/custom-spinner-tooltip-flutter-e3576d531488
class CustomSlider extends StatefulWidget {
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider>
    with TickerProviderStateMixin {
  GlobalKey _sliderKey = GlobalKey();

  double _value = 50;

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = const LinearGradient(
        colors: <Color> [
          Color(0xff7FCCE6),
          Color(0xff13B3E6),
          Color(0xff0385BF),
        ]
    );
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackShape: GradientRectSliderTrackShape(gradient: gradient, darkenInactive: true),
        thumbShape: PolygonSliderThumb(
          thumbRadius: 10.0,
          sliderValue: _value,
        ),
        //thumbShape: RoundSliderThumbShape(elevation: 10),
        //overlayShape: RoundSliderOverlayShape(overlayRadius: 2),
        //overlayColor: Colors.red,
        inactiveTrackColor: Colors.grey.shade200,
        activeTrackColor: kCoolPurple,
        valueIndicatorColor: Color(0xff0385BF), //kCoolPurple,
        thumbColor: Colors.white, //Color(0xff0385BF), //kCoolPurple,
          inactiveTickMarkColor: Color(0xff13B3E6), //Colors.grey.shade200,
        activeTickMarkColor: Colors.grey.shade200, //Color(0xff13B3E6),
      ),
      child: Slider(
        key: _sliderKey,
        value: _value,
        min: 0,
        max: 100,
        divisions: 10,
        label: '${_value.toInt()}',
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
        },
      ),
    );
  }
}

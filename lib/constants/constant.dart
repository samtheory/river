import 'package:flutter/material.dart';

class KColors {
  KColors._();
  static const Color background = Color(0xffF6F6F8);
  static const Color text = Color(0xff252525);
  static const Color card = Color(0xff0E1B2B);
  static const Color header = Color(0xff363853);
}

class KGradiant {
  KGradiant._();
  static const LinearGradient purple = LinearGradient(
      colors: [
        Color(0xFF6C91F5),
        Color(0xFF3C91F9),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const LinearGradient blue = LinearGradient(
      colors: [
        Color(0xFF0F85F3),
        Color(0xFF0165C6),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);

  static const LinearGradient red = LinearGradient(
      colors: [
        Color(0xFFFB1A28),
        Color(0xFFCC2630),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1],
      tileMode: TileMode.clamp);
  static const LinearGradient cyanButton = LinearGradient(
      colors: [
        Color(0xFF6DF1ED),
        Color(0xFFA8E5E5),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.0, 1],
      tileMode: TileMode.clamp);

  static const LinearGradient pink = LinearGradient(
      colors: [
        Color(0xFFF4737B),
        Color(0xFFFE9577),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp);
}

class KShadow {
  KShadow._();
  static BoxShadow normal = BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 2,
    blurRadius: 5,
    offset: const Offset(0, 3), // changes position of shadow
  );
  static BoxShadow lightblue =  BoxShadow(
    color: Colors.lightBlue.withOpacity(0.4),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(3, 3), // changes position of shadow
  );
  static BoxShadow red =  BoxShadow(
    color: Colors.red.withOpacity(0.4),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(3, 3), // changes position of shadow
  );
  static BoxShadow yellow =  BoxShadow(
    color: Colors.yellowAccent.withOpacity(0.4),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(3, 3), // changes position of shadow
  );
  static BoxShadow orange =  BoxShadow(
    color: Colors.orangeAccent.withOpacity(0.4),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(3, 3), // changes position of shadow
  );
}

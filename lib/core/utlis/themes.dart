import 'package:flutter/material.dart';

import 'constants.dart';

final lightTheme = ThemeData.light().copyWith(
  iconTheme: const IconThemeData(
    color: secondColor
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: Color.fromRGBO(248, 251, 255, 1),
    surfaceTintColor: Color.fromRGBO(248, 251, 255, 1),
  ),
  appBarTheme: const AppBarTheme(
    color: Color.fromRGBO(248, 251, 255, 1),
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(248, 251, 255, 1),
  cardColor: Colors.white,
  shadowColor: Colors.grey.withOpacity(0.5),
  textButtonTheme:TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(249, 136, 31, 200)),
    )
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all<Color>(Colors.grey[700]!),
      overlayColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(249, 136, 31, 200)),
    ),
  ),
    // textSelectionTheme: TextSelectionThemeData(
    //   selectionColor: defaultColor.withOpacity(0.3),
    //   selectionHandleColor:defaultColor.withOpacity(0.7),
    // ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontFamily: 'Manrope',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
        fontFamily: 'Manrope',
        fontSize: 14,
        fontWeight: FontWeight.w500
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontFamily: 'Manrope',
      fontSize: 12,
    ),
    titleMedium:  TextStyle(
        color: Colors.black,
        fontFamily: 'Manrope',
        fontSize: 16,
        fontWeight: FontWeight.w700
    ),
    titleLarge: TextStyle(
        color: Colors.black,
        fontFamily: 'Bona',
        fontSize: 20,
        fontWeight: FontWeight.w600
    ),
    titleSmall:TextStyle(
        color: myColor,
        fontFamily: 'Manrope',
        fontSize: 12,
        fontWeight: FontWeight.w600
    ),
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
     selectedItemColor: Colors.grey[800],
    )
  // Add more colors as needed
);
final darkTheme = ThemeData.dark().copyWith(
  //   dialogTheme: const DialogTheme(
  //     backgroundColor: Color(0xFF212121),
  //     surfaceTintColor: Color(0xFF212121),
  //   ),
  // appBarTheme: const AppBarTheme(
  //   color: Color(0xFF424242),
  // ),
  // cardColor: const Color(0xFF424242),
  // shadowColor: const Color(0xFF0F0F0F),
  // iconButtonTheme: IconButtonThemeData(
  //   style: ButtonStyle(
  //     iconColor: MaterialStateProperty.all<Color>(Colors.grey[400]!),
  //     overlayColor:
  //     MaterialStateProperty.all<Color>(const Color.fromRGBO(249, 136, 31, 200)),
  //   ),
  // ),
    // textSelectionTheme: const TextSelectionThemeData(
    //   selectionColor: defaultColor.withOpacity(0.3),
    //   selectionHandleColor:defaultColor.withOpacity(0.7),
    // ),
  primaryColor: Colors.grey.shade50,
  scaffoldBackgroundColor: myColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.grey[50],
      fontFamily: 'Manrope',
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey[50],
      fontFamily: 'Manrope',
      fontSize: 14,
      fontWeight: FontWeight.w500
    ),
    bodySmall: TextStyle(
      color: Colors.grey[50],
      fontFamily: 'Manrope',
      fontSize: 12,
    ),
    titleMedium:  TextStyle(
      color: Colors.grey[50],
      fontFamily: 'Manrope',
      fontSize: 16,
      fontWeight: FontWeight.w700
    ),
    titleLarge: TextStyle(
      color: Colors.grey[50],
      fontFamily: 'Bona',
      fontSize: 20,
      fontWeight: FontWeight.w600
    ),
    titleSmall: TextStyle(
        color: Colors.grey.shade50,
        fontFamily: 'Manrope',
        fontSize: 12,
        fontWeight: FontWeight.w600
    ),
  ),
  // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //   backgroundColor: Color(0xFF424242),
  //   selectedItemColor: Colors.white70,
  // )
  // Add more colors as needed
);

import 'package:earthquake_listing/product/constants/colors.dart';
import 'package:flutter/material.dart';

class themes{

  ThemeData darkTheme = ThemeData.dark().copyWith(

    scaffoldBackgroundColor: colors().primaryColor,
    cardColor: colors().cardColor,


    inputDecorationTheme: InputDecorationTheme(

      fillColor: colors().cardColor,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide.none,
      ),
    ),

    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

      backgroundColor: colors().cardColor,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
      contentTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,

      ),
    ),

    appBarTheme: AppBarTheme(

      backgroundColor:  Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );

  ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}
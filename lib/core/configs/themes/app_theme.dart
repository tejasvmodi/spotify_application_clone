import 'package:flutter/material.dart';
import 'package:spotify_application_clone/core/configs/themes/app_color.dart';

class AppTheme{

  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'Satoshi',
    inputDecorationTheme:   InputDecorationTheme(
        fillColor: Colors.transparent,
          hintStyle: TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
        filled: true,
        contentPadding: EdgeInsets.all(30),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.4
          )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.4
          )
        ),
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      
      style: ElevatedButton.styleFrom(
      elevation : 0,
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        
        shape: RoundedRectangleBorder(
        
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'Satoshi',
    inputDecorationTheme:   InputDecorationTheme(
      hintStyle: TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w500,
      ),
        fillColor: Colors.transparent,
        filled: true,
        contentPadding: EdgeInsets.all(30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.white,
          width: 0.4
        )
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(
          color: Colors.white,
          width: 0.4
        )
        ),
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
      elevation : 0,
        backgroundColor: AppColors.primary,
        textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        
        shape: RoundedRectangleBorder(
        
          borderRadius: BorderRadius.circular(30)
        )
      )
    )
  );
}
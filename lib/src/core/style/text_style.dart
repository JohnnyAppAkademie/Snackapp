import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//  General - Header  //

TextStyle get header => GoogleFonts.inter(
  textStyle: TextStyle(
    fontSize: 22,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w900,
  ),
);

TextStyle get headerSubText => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 14,
    color: Color.fromARGB(125, 235, 235, 245),
    fontWeight: FontWeight.w400,
  ),
);

/*  Favouriten Cards */

TextStyle get headerCard => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w900,
  ),
);

TextStyle get textCard => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 12,
    color: Color.fromARGB(150, 255, 255, 255),
    fontWeight: FontWeight.w400,
  ),
);

TextStyle get cardPriceTag => GoogleFonts.inter(
  textStyle: TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w500,
  ),
);

TextStyle get likesCard => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 12,
    color: Color.fromARGB(150, 255, 255, 255),
    fontWeight: FontWeight.w400,
  ),
);

/*  Showcase Card */

TextStyle get showcaseCardHeader => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w700,
  ),
);

TextStyle get showcaseCardText => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 12,
    color: Color.fromARGB(255, 217, 217, 217),
    fontWeight: FontWeight.w500,
  ),
);

TextStyle get showcaseCardPrice => GoogleFonts.inter(
  textStyle: TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w500,
  ),
);

/*  Detail Card */

TextStyle get detailCardHeader => GoogleFonts.inter(
  textStyle: TextStyle(
    fontSize: 24,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w900,
  ),
);

TextStyle get detailCardText => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 13,
    color: Color.fromARGB(180, 235, 235, 245),
    fontWeight: FontWeight.w400,
  ),
);

TextStyle get detailCardPriceTag => GoogleFonts.inter(
  textStyle: TextStyle(
    fontSize: 17,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w700,
  ),
);

/* Button */

TextStyle get buttonText => GoogleFonts.inter(
  textStyle: TextStyle(
    fontSize: 17,
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
  ),
);

/* Optionen */

TextStyle get optionText => GoogleFonts.manrope(
  textStyle: TextStyle(
    fontSize: 11,
    color: Color.fromARGB(255, 235, 235, 245),
    fontWeight: FontWeight.w600,
  ),
);

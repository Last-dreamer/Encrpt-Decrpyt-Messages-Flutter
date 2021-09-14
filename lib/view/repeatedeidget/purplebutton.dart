import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PurpleButton extends StatelessWidget {
  final String tittle;
  final IconData? icon;
  PurpleButton({required this.tittle, this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 1,
            offset: Offset(1, 3),
            color: Colors.grey.shade500.withOpacity(0.7))
      ], borderRadius: BorderRadius.circular(5), color: Color(0xFF6200EE)),
      width: 70.w,
      height: 6.5.h,
      child: Row(
        children: [
          SizedBox(
            width: 2.w,
          ),
          Icon(
            icon,
            size: 5.h,
            color: Colors.white,
          ),
          SizedBox(
            width: 2.w,
          ),
          Text(tittle,
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

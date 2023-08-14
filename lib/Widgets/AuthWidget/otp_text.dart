import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fine_tune/Theme/app_color.dart';

class OtpText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final FocusNode currNode;
  final FocusNode nextNode;
  final FocusNode prevNode;

  final RxBool isFilled;
  const OtpText(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.inputType,
      required this.currNode,
      required this.nextNode,
      required this.prevNode,
      required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => Container(
            decoration: BoxDecoration(
              color: isFilled.value
                  ? const Color(0xffEEEEF2).withOpacity(0.5)
                  : whiteColor.withOpacity(0.25),
              borderRadius: BorderRadius.circular(8.w),
            ),
            height: 55.h,
            width: 60.w,
            child: TextFormField(
              maxLength: 1,
              controller: controller,
              focusNode: currNode,
              onChanged: (value) {
                if (controller.text.isNotEmpty) {
                  isFilled.value = true;
                  FocusScope.of(context).requestFocus(nextNode);
                  if (currNode == nextNode) {
                    Get.focusScope!.unfocus();
                  }
                } else {
                  isFilled.value = false;
                  FocusScope.of(context).requestFocus(prevNode);
                }
              },
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: inputType == TextInputType.visiblePassword,
              style: GoogleFonts.poppins(color: Colors.white),
              expands: !(inputType == TextInputType.visiblePassword),
              maxLines: inputType == TextInputType.visiblePassword ? 1 : null,
              minLines: inputType == TextInputType.visiblePassword ? 1 : null,
              keyboardType: inputType,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: "",
                hintStyle:
                    GoogleFonts.poppins(color: whiteColor.withOpacity(0.25)),
                hintText: hintText,
                border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.transparent, width: double.minPositive),
                    borderRadius: BorderRadius.circular(8.w)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.transparent, width: double.minPositive),
                    borderRadius: BorderRadius.circular(8.w)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.transparent, width: double.minPositive),
                    borderRadius: BorderRadius.circular(8.w)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

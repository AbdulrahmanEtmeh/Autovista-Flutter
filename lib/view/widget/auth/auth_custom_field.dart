import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_colors.dart';

class AuthCustomField extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? iconOnTap;

  const AuthCustomField({
    super.key,
    required this.labelText,
    required this.icon,
    required this.controller,
    required this.validator,
    this.keyboardType,
    this.obscureText,
    this.iconOnTap,
  });

  @override
  State<AuthCustomField> createState() => _AuthCustomFieldState();
}

class _AuthCustomFieldState extends State<AuthCustomField>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _lineAnimation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _lineAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _onFocusChange(bool focused) {
    setState(() => _isFocused = focused);
    if (focused) {
      _animController.forward();
    } else {
      _animController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Detect background brightness to adapt text color
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black87;
    final labelColor = isDark ? Colors.white38 : Colors.black38;
    final iconColor = isDark ? Colors.white24 : Colors.black26;

    return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.03),
      child: Focus(
        onFocusChange: _onFocusChange,
        child: Stack(
          children: [
            // ── Text Field ───────────────────────────────────────────────
            TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              obscureText:
                  widget.obscureText == null || widget.obscureText == false
                      ? false
                      : true,
              keyboardType: widget.keyboardType,
              cursorColor: AppColors.primaryRed,
              cursorWidth: 1.5,
             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
  color: Colors.black87,  // ← ثابت أسود
  fontSize: Get.height * 0.018,
),
              decoration: InputDecoration(
                labelText: widget.labelText,
                labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: _isFocused ? AppColors.primaryRed : Colors.black45,
                      fontSize: Get.height * 0.016,
                      letterSpacing: 0.5,
                    ),
                floatingLabelStyle:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.primaryRed,
                          fontSize: Get.height * 0.013,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12, width: 1
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 1),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 1),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.redAccent, width: 1),
                ),
                errorStyle: TextStyle(
                  color: Colors.redAccent,
                  fontSize: Get.height * 0.013,
                ),
                suffixIcon: Padding(
                  padding: EdgeInsetsDirectional.only(end: Get.width * 0.02),
                  child: InkWell(
                    onTap: widget.iconOnTap,
                    borderRadius: BorderRadius.circular(20),
                    child: Icon(
                      widget.icon,
                      color: _isFocused ? AppColors.primaryRed : Colors.black38,
                      size: Get.width * 0.052,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.only(
                  bottom: Get.height * 0.01,
                  top: Get.height * 0.01,
                ),
              ),
            ),

            // ── Animated red underline on focus ──────────────────────────
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _lineAnimation,
                builder: (context, _) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 1.5,
                      width: Get.width * _lineAnimation.value,
                      decoration: BoxDecoration(
                        color: AppColors.primaryRed,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';


class ErrorText extends StatelessWidget {
  final Map<String, String?> errors;
  final String fieldKey;

  const ErrorText({super.key, required this.errors, required this.fieldKey});

  @override
  Widget build(BuildContext context) {
    final error = errors[fieldKey];
    if (error == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 4, right: 4),
      child: Text(
        error,
        style: const TextStyle(
          color: Colors.redAccent,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class FormManagementButtons extends StatelessWidget {
  const FormManagementButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final form = Form.maybeOf(context);
    if (form == null) {
      return const Text('親ウィジェットにFormがありません');
    }

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 16,
        children: [
          FilledButton(
            onPressed: form.validate,
            child: const Text('Validate'),
          ),
          OutlinedButton(
            onPressed: form.reset,
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}

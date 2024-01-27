import 'package:amc_2024/src/theme/colors.dart';
import 'package:flutter/material.dart';

class EchoHubTextInput extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final int? maxLength;
  final bool? obscureText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? enabled;

  const EchoHubTextInput({
    Key? key,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.maxLength,
    this.obscureText = false,
    this.focusNode,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.validator,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      focusNode: focusNode,
      controller: controller,
      obscureText: obscureText!,
      cursorColor: kcLightSecondary,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: kcPrimaryVariant,
          ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        hintText: hintText,
        labelText: labelText,
        labelStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: kcLightSecondary),
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: kcLightSecondary),
        fillColor: kcPrimaryVariant,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: kcLightSecondary),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kcLightSecondary),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kcPrimaryVariant),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kcError),
        ),
        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall!
            .copyWith(color: kcError),
      ),
    );
  }
}

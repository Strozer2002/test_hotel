import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:test_hotel/app_data/app_data.dart';

// ignore: must_be_immutable
class CustomInput extends StatefulWidget {
  final GlobalKey<FormState> keyForm;
  final TextInputType? keyboardType;
  final String label;
  const CustomInput({
    super.key,
    this.keyboardType,
    required this.label,
    required this.keyForm,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  String? errorText;
  TextEditingController? controller;
  @override
  void initState() {
    super.initState();
    if (widget.keyboardType == TextInputType.phone) {
      controller = MaskedTextController(mask: '+7 (000) 000-00-00');
    } else {
      controller = TextEditingController();
    }
  }

  String? onChange(String? value) {
    if (widget.keyboardType == TextInputType.phone) {
      setState(() {
        errorText = AppData.utils.validatePhoneNumber(value!);
      });
    } else if (widget.keyboardType == TextInputType.emailAddress) {
      setState(() {
        errorText = AppData.utils.validateMail(value!);
      });
    } else {
      setState(() {
        errorText = AppData.utils.checkTextField(value!);
      });
    }
    setState(() {});
    return errorText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: (value) => onChange(value),
        controller: controller,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          errorText: errorText,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
        style: const TextStyle(fontSize: 17),
        onChanged: (text) {
          widget.keyForm.currentState!.validate();
          setState(() {
            onChange(text);
          });
        },
      ),
    );
  }
}

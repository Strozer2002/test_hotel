import 'package:flutter/material.dart';

import '../../../../app_data/app_data.dart';
import '../../../widgets/header_text.dart';
import 'custom_input.dart';

// ignore: must_be_immutable
class TouristWidget extends StatefulWidget {
  final GlobalKey<FormState> keyForm;
  final String id;
  const TouristWidget({
    super.key,
    required this.id,
    required this.keyForm,
  });

  @override
  State<TouristWidget> createState() => _TouristWidgetState();
}

class _TouristWidgetState extends State<TouristWidget> {
  bool isHide = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: HeaderText(text: "${widget.id} "),
            ),
            IconButton(
              style: AppData.theme.button.defaultIconButton20,
              onPressed: () {
                setState(() {
                  isHide = !isHide;
                });
              },
              icon: !isHide
                  ? AppData.assets.svg.vector1(size: 12)
                  : AppData.assets.svg.vector2(size: 12),
            ),
          ],
        ),
        Visibility(
          maintainState: true,
          visible: !isHide,
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomInput(
                label: "Имя",
                keyForm: widget.keyForm,
              ),
              const SizedBox(height: 8),
              CustomInput(
                label: "Фамилия",
                keyForm: widget.keyForm,
              ),
              const SizedBox(height: 8),
              CustomInput(
                label: "Дата рождения",
                keyForm: widget.keyForm,
              ),
              const SizedBox(height: 8),
              CustomInput(
                label: "Гражданство",
                keyForm: widget.keyForm,
              ),
              const SizedBox(height: 8),
              CustomInput(
                label: "Номер загранпаспорта",
                keyForm: widget.keyForm,
              ),
              const SizedBox(height: 8),
              CustomInput(
                label: "Срок действия загранпаспорта",
                keyForm: widget.keyForm,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

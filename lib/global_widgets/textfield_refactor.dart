import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RefactoredTextField extends StatelessWidget {
  const RefactoredTextField({
    super.key,
    required this.name,
    this.iseye,
    this.hinttext,
    this.controller,
    this.fromKey,
    this.validator,
    this.keyboardType,
    this.autofocus = false,
    this.autovalidateMode,
    this.decoration,
    this.enabled,
    this.enableInteractiveSelection,
    this.expands = false,
    this.inputFormatters,
    this.maxLength,
    this.maxLengthEnforced = true,
    this.maxLines,
    this.minLines,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.scrollController,
    this.showCursor,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.toolbarOptions,
  });

  final String name;
  final String? hinttext;
  final bool? iseye;
  final TextEditingController? controller;
  final Key? fromKey;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool autofocus;
  final AutovalidateMode? autovalidateMode;
  final InputDecoration? decoration;
  final bool? enabled;
  final bool? enableInteractiveSelection;
  final bool expands;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool maxLengthEnforced;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final ScrollController? scrollController;
  final bool? showCursor;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final ToolbarOptions? toolbarOptions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 10),
        SizedBox(
          child: Form(
            key: fromKey,
            child: TextFormField(
              autofocus: autofocus,
              keyboardType: keyboardType,
              controller: controller,
              obscureText: iseye == true ? true : false,
              decoration: decoration ??
                  InputDecoration(
                    labelText: hinttext ?? name,
                    hintText: hinttext ?? name,
                    border: OutlineInputBorder(),
                    suffixIcon: iseye == true ? Icon(Icons.remove_red_eye) : SizedBox(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  ),
              validator: validator,
              autovalidateMode: autovalidateMode,
              enabled: enabled,
              enableInteractiveSelection: enableInteractiveSelection,
              expands: expands,
              inputFormatters: inputFormatters,
              maxLength: maxLength,
              maxLines: maxLines,
              minLines: minLines,
              onChanged: onChanged,
              onEditingComplete: onEditingComplete,
              onFieldSubmitted: onFieldSubmitted,
              onSaved: onSaved,
              onTap: onTap,
              readOnly: readOnly,
              scrollController: scrollController,
              showCursor: showCursor,
              textAlign: textAlign,
              textAlignVertical: textAlignVertical,
              textCapitalization: textCapitalization,
              textInputAction: textInputAction,
              style: style,
              strutStyle: strutStyle,
              toolbarOptions: toolbarOptions,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

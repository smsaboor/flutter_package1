import 'package:flutter/material.dart';
class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {Key? key, required this.maxLimit,required this.maxLimitError,required this.readOnly,required this.controlller, required this.errorMsg, required this.labelText, required this.icon, required this.textInputType})
      : super(key: key);
  final TextEditingController controlller;
  final errorMsg;
  final labelText;
  final icon;
  final textInputType;
  final readOnly;
  final maxLimit;
  final maxLimitError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child: TextFormField(
          textInputAction: TextInputAction.next,
          readOnly: readOnly,
          controller: controlller,
          validator: (value) {
            if (value!.isEmpty) {
              return errorMsg;
            }
            else if (value!.length>maxLimit) {
              return 'Limit $maxLimit character';
            }
            return null;
          },
          keyboardType: textInputType,
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal)),
              labelText: labelText,
              prefixText: ' ',

              prefixIcon: Icon(
                icon,
                color: Colors.blue,
              ),
              suffixStyle: const TextStyle(color: Colors.green)),
        ),
      ),
    );
  }
}

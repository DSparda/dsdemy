import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';
import 'package:udemy1/src/ui/widgets/dumb/custom_container.dart';

class CustomDropdown extends StatelessWidget {
  final double margin;
  final IconData icon;
  final List<String> list;
  final String hint;
  final Function onSelected;
  final String selected;

  const CustomDropdown({
    Key key,
    this.margin = 12,
    this.icon,
    this.list,
    this.hint,
    this.onSelected,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 16, 0),
            child: Icon(
              icon,
              color: Constants.black54,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
                iconEnabledColor: Constants.black54,
                value: selected,
                hint: Text(hint,
                    style: GoogleFonts.roboto(
                      color: Constants.black45,
                    )),
                items: toDropdownItems(list),
                onChanged: onSelected),
          )
        ],
      ),
    );
  }

  List<DropdownMenuItem> toDropdownItems(List<String> list) => list
      .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemy1/src/app/utils/constants.dart';

const _height = 50.0;
const _widthPadding = 80.0;
final _borderRadius = BorderRadius.circular(40.0);

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
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width - _widthPadding,
      height: _height,
      margin: EdgeInsets.only(bottom: margin),
      decoration: BoxDecoration(
        color: Constants.pink18,
        borderRadius: _borderRadius,
        border: Border.all(
          color: Constants.black54,
          width: 1.0,
        ),
      ),
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

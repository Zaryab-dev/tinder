import 'package:flutter/material.dart';
import 'package:tinder/common/global_var.dart';

class ApplyFilters extends StatefulWidget {
  ApplyFilters({super.key});

  @override
  State<ApplyFilters> createState() => _ApplyFiltersState();
}

class _ApplyFiltersState extends State<ApplyFilters> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButton<String>(
          hint: const Text('Choose gender'),
            underline: Container(),
            value: chooseGenders,
            items: genderList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (String? value) {
              chooseGenders = value;
              setState(() {});
            }),
        DropdownButton<String>(
            hint: const Text('Choose Country'),
            underline: Container(),
            value: chooseCountries,
            items: countryList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (String? value) {
              chooseCountries = value;
              setState(() {});
            }),
        DropdownButton<String>(
            hint: const Text('Choose age'),
            underline: Container(),
            value: age,
            items: ageList.map((e) {
              return DropdownMenuItem(
                value: e,
                child: Text(e),
              );
            }).toList(),
            onChanged: (String? value) {
              age = value;
              setState(() {});
            }),

      ],
    );
  }
}

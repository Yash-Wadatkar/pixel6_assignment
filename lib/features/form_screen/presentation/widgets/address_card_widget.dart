import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressCardWidget extends StatefulWidget {
  const AddressCardWidget({super.key});

  @override
  State<AddressCardWidget> createState() => _AddressCardWidgetState();
}

class _AddressCardWidgetState extends State<AddressCardWidget> {
  String dropdownValueForStates = 'State';
  String dropdownValueForCities = 'City';

  // List of items in our dropdown menu
  var states = [
    'State',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  var cities = [
    'City',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Address Line 1',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff626262))),
                TextSpan(
                    text: ' *',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red[300]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                cursorColor: const Color(0xffb49beb),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb49beb)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  filled: true,
                  fillColor: const Color(0xffF1F4FF),
                  hintText: 'Address Line 1',
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff626262)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Address Line 2',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff626262))),
                TextSpan(
                    text: ' (Optional)',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 180, 177, 177)))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                cursorColor: const Color(0xffb49beb),
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb49beb)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  filled: true,
                  fillColor: const Color(0xffF1F4FF),
                  hintText: 'Address Line 2',
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff626262)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: 'Postal Code',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff626262))),
                TextSpan(
                    text: ' *',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.red[300]))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: TextFormField(
                inputFormatters: [LengthLimitingTextInputFormatter(6)],
                keyboardType: TextInputType.phone,
                cursorColor: const Color(0xffb49beb),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Postal Code is required';
                  } else if (value.length != 6) {
                    return 'Postal Code must be 6 digits';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffb49beb)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  filled: true,
                  fillColor: const Color(0xffF1F4FF),
                  hintText: 'Postal Code',
                  hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff626262)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 50, right: 150),
                      child: DropdownButton<String>(
                        value: dropdownValueForStates,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: states.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(
                              items,
                              overflow: TextOverflow.ellipsis,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValueForStates = newValue!;
                          });
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: DropdownButton<String>(
                      value: dropdownValueForCities,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cities.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValueForCities = newValue!;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}

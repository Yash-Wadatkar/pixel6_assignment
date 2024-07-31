import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pixel6_assignment/features/form_screen/presentation/bloc/form_bloc.dart';
import 'package:pixel6_assignment/features/form_screen/presentation/bloc/form_event.dart';
import 'package:pixel6_assignment/features/form_screen/presentation/bloc/form_state.dart';
import 'package:pixel6_assignment/features/form_screen/presentation/widgets/address_card_widget.dart';

@RoutePage()
class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController panNumberController = TextEditingController();
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController mobileNumberController =
        TextEditingController();
    final TextEditingController addressLineOneController =
        TextEditingController();
    final TextEditingController addressLineTwoController =
        TextEditingController();
    final TextEditingController postalCodeController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController cityController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffb49beb),
        title: Text(
          'User Form',
          style: GoogleFonts.alata(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 27),
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'PAN Number',
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 6),
                  child: TextFormField(
                    controller: panNumberController,
                    maxLength: 10,
                    cursorColor: const Color(0xffb49beb),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'PAN is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb49beb)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      filled: true,
                      fillColor: const Color(0xffF1F4FF),
                      hintText: 'PAN Number',
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
                        text: 'Full Name',
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
                  padding: const EdgeInsets.only(top: 10, bottom: 6),
                  child: TextFormField(
                    maxLength: 140,
                    cursorColor: const Color(0xffb49beb),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Full Name is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb49beb)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      filled: true,
                      fillColor: const Color(0xffF1F4FF),
                      hintText: 'Full Name',
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
                        text: 'Email',
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
                  padding: const EdgeInsets.only(top: 10, bottom: 6),
                  child: TextFormField(
                    maxLength: 250,
                    cursorColor: const Color(0xffb49beb),
                    validator: (value) {
                      const emailPattern = r'^[^@]+@[^@]+\.[^@]+';
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(emailPattern).hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb49beb)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      filled: true,
                      fillColor: const Color(0xffF1F4FF),
                      hintText: 'Email',
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
                        text: 'Mobile Number',
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
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    cursorColor: const Color(0xffb49beb),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Mobile Number is required';
                      } else if (value.length != 10) {
                        return 'Mobile number must be 10 digits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffb49beb)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          '+91',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff626262)),
                        ),
                      ),
                      filled: true,
                      fillColor: const Color(0xffF1F4FF),
                      hintText: 'Mobile Number',
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
                Text(
                  'Address',
                  style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff626262)),
                ),
                BlocBuilder<FormBloc, FormsState>(
                  builder: (context, state) {
                    if (state is AddressState) {
                      final addAddressState = state as AddressState;
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: addAddressState.addresses.length,
                        itemBuilder: (context, index) {
                          return const AddressCardWidget();
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: ElevatedButton(
                          style: const ButtonStyle(
                              minimumSize: WidgetStatePropertyAll(Size(55, 55)),
                              shape: WidgetStatePropertyAll(CircleBorder())),
                          onPressed: () {
                            BlocProvider.of<FormBloc>(context)
                                .add(AddAddressButtonClickedEvent());
                          },
                          child: const Icon(
                            Icons.add,
                            size: 30,
                          )),
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            minimumSize: WidgetStatePropertyAll(Size(55, 55)),
                            shape: WidgetStatePropertyAll(CircleBorder())),
                        onPressed: () {
                          BlocProvider.of<FormBloc>(context)
                              .add(DeleteAddressButtonClickedEvent());
                        },
                        child: const Icon(
                          Icons.delete,
                          size: 30,
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Color(0xffb49beb)),
                            foregroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(
                                ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10))))),
                        onPressed: () {
                          BlocProvider.of<FormBloc>(context).add(
                              SavedButtonClickedEvent(
                                  panNumber: panNumberController.text));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Save',
                            style: GoogleFonts.alata(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:jd_web/models/contact_form.dart';
import 'package:jd_web/theme/colors.dart';
import 'package:jd_web/viewmodels/contact_viewmodel.dart';
import 'package:jd_web/widgets/primary_button.dart';
import 'package:jd_web/widgets/primary_form_field.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Contact extends StatelessWidget {
  TextEditingController emailCont = TextEditingController();
  TextEditingController firstNameCont = TextEditingController();
  TextEditingController lastNameCont = TextEditingController();
  TextEditingController messageCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final contactModel = Provider.of<ContactViewModel>(context, listen: false);
    return ResponsiveBuilder(builder: (context, sizeInfo) {
      return Container(
        padding: EdgeInsets.only(top: 32, bottom: 32),
        width: MediaQuery.of(context).size.width,
        color: JDColors.offBlack,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 1200),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "SAY HI",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                  SizedBox(height: 32),
                  _buildContactForm(contactModel),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _buildContactForm(ContactViewModel contactModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: PrimaryFormField(
                label: "First Name",
                controller: firstNameCont,
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              child: PrimaryFormField(
                label: "Last Name",
                controller: lastNameCont,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: PrimaryFormField(
                label: "Email",
                controller: emailCont,
              ),
            ),
            SizedBox(width: 32),
            Expanded(
              child: PrimaryFormField(
                label: "Telephone",
                controller: phoneCont,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        PrimaryFormField(
          label: "Message",
          minLines: 5,
          radius: 35,
          controller: messageCont,
        ),
        SizedBox(height: 16),
        PrimaryButton(
          label: 'SUBMIT',
          onPressed: () {
            contactModel.submitContactForm(
              ContactForm(
                emailAddress: emailCont.text,
                firstName: firstNameCont.text,
                lastName: lastNameCont.text,
                message: messageCont.text,
                phoneNumber: phoneCont.text,
              ),
            );
          },
        ),
      ],
    );
  }
}

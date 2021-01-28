import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jd_web/models/contact_form.dart';

class ContactService {
  Future<void> contactFormCompleted(ContactForm contactForm) async {
    /// Need to check for doc first (do this later)
    await FirebaseFirestore.instance
        .collection('contact')
        .doc('${contactForm.emailAddress}')
        .set({
      'emailAddress': contactForm.emailAddress,
      'firstName': contactForm.firstName,
      'lastName': contactForm.lastName,
      'message': contactForm.message,
      'phoneNumber': contactForm.phoneNumber,
      'submittedAt': DateTime.now(),
    });
  }
}

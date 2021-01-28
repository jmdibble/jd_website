import 'package:flutter/cupertino.dart';
import 'package:jd_web/models/contact_form.dart';
import 'package:jd_web/services/contact_service.dart';

class ContactViewModel extends ChangeNotifier {
  ContactService contactService = ContactService();

  Future<void> submitContactForm(ContactForm contactForm) async {
    await contactService.contactFormCompleted(contactForm);
    notifyListeners();
  }
}

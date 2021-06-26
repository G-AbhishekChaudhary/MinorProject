import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: ContactUs(
        logo: AssetImage('images/contact.png'),
        email: 'xyz@gmail.com',
        cardColor: Colors.white,
        companyColor: Colors.white,
        textColor: Colors.black,
        taglineColor: Colors.yellow,
        companyName: 'Abhishek Chaudhary',
        websiteText: "www.google.com",
        phoneNumber: '+91123456789',
        githubUserName: 'Abhishek',
        linkedinURL: 'https://www.linkedin.com/',
        tagLine: 'Flutter Developer',
      ),
      bottomNavigationBar: ContactUsBottomAppBar(
        companyName: 'Abhishek Chaudhary',
        textColor: Colors.black,
        backgroundColor: Colors.white,
        email: 'xyz@gmail.com',
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portfolio/features/contact/widgets/custom_textfield.dart';
import 'package:portfolio/features/shared/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactRight extends StatefulWidget {
  const ContactRight({super.key});

  @override
  State<ContactRight> createState() => _ContactRightState();
}

class _ContactRightState extends State<ContactRight> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController content = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    content.dispose();
    super.dispose();
  }

  Future<void> sendEmail() async {
    final email = emailController.text;
    final message = content.text;

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'aswin_asokan@outlook.com',
      query: Uri.encodeFull('subject=New Message from $email&body=$message'),
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch email client';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextfield(
            controller: emailController,
            hintText: "Your Email",
            maxline: 1,
          ),
          SizedBox(height: 10),
          CustomTextfield(
            controller: content,
            hintText: "Your Message",
            maxline: 6,
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: CustomButton(label: "Send Message", onPress: sendEmail),
          ),
        ],
      ),
    );
  }
}

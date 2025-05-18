import 'package:flutter/material.dart';
import 'package:portfolio/contact/widgets/contact_left.dart';
import 'package:portfolio/contact/widgets/custom_textfield.dart';
import 'package:portfolio/shared/widgets/custom_button.dart';
import 'package:portfolio/shared/widgets/custom_container.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMe extends StatelessWidget {
  ContactMe({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController content = TextEditingController();
  Future<void> sendEmail() async {
    final email = emailController.text;
    final message = content.text;

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'aswin_asokan@outlook.com', // Replace with your target email
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
    return CustomContainer(
      child: Row(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ContactLeft()),
          Expanded(
            child: Column(
              spacing: 10,
              children: [
                CustomTextfield(
                  controller: emailController,
                  hintText: "Your Email",
                  maxline: 1,
                ),
                CustomTextfield(
                  controller: content,
                  hintText: "Your Message",
                  maxline: 6,
                ),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    label: "Send Message",
                    onPress: sendEmail,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

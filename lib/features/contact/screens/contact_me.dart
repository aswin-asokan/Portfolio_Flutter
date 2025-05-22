import 'package:flutter/material.dart';
import 'package:portfolio/features/contact/widgets/contact_left.dart';
import 'package:portfolio/features/contact/widgets/contact_right.dart';
import 'package:portfolio/features/shared/widgets/custom_container.dart';
import 'package:portfolio/responsive/responsive.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (Responsive.isMobile(context)) {
            return Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ContactLeft(), ContactRight()],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Expanded(child: ContactLeft()),
                Expanded(child: ContactRight()),
              ],
            );
          }
        },
      ),
    );
  }
}

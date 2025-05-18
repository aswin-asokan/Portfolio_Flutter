import 'package:flutter/material.dart';
import 'package:portfolio/shared/extension/theme_extension.dart';
import 'package:portfolio/shared/widgets/custom_container.dart';

class ExpCard extends StatefulWidget {
  const ExpCard({
    super.key,
    required this.icon,
    required this.org,
    required this.role,
    required this.period,
    required this.summary,
  });
  final IconData icon;
  final String role;
  final String org;
  final String period;
  final List<String> summary;

  @override
  State<ExpCard> createState() => _ExpCardState();
}

class _ExpCardState extends State<ExpCard> {
  String get formattedText =>
      widget.summary.map((item) => "•\t\t$item").join("\n");

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: SizedBox(
        height: 220,
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    widget.icon,
                    color: context.colorScheme.primary,
                    size: 50,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.role, style: context.textTheme.bodyMedium),
                    Text(widget.org, style: context.textTheme.bodySmall),
                    SizedBox(height: 2),
                    Text(widget.period, style: context.textTheme.displaySmall),
                  ],
                ),
              ],
            ),

            SizedBox(height: 8),
            Text(formattedText, style: context.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

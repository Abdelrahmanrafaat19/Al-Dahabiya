import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/method.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/core/theme/color.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailAndPhoneColumn extends StatelessWidget {
  const EmailAndPhoneColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      scroll: false,
      shrinkWrap: true,
      desiredItemWidth: 400,
      children: [
        Row(
          children: [
            Icon(
              Icons.phone,
              color: SharedColor.mainColor,
              size: getResponsiveFont(context, fontSize: 30),
            ),
            SizedBox(
              width: responsiveWeidth(context, 10),
            ),
            Expanded(
              child: customText(
                text: "1999",
                color: Colors.black,
                fontSize: getResponsiveFont(context, fontSize: 30),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Icon(
              Icons.email_outlined,
              color: SharedColor.mainColor,
              size: getResponsiveFont(context, fontSize: 30),
            ),
            SizedBox(
              width: responsiveWeidth(context, 10),
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  String? encodeQueryParameters(Map<String, String> params) {
                    return params.entries
                        .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                        .join('&');
                  }

                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'aldahabiya@gmail.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': 'Example Subject & Symbols are allowed!',
                    }),
                  );

                  if (await canLaunchUrl(emailLaunchUri)) {
                    launchUrl(Uri.parse(emailLaunchUri.toString()));
                  } else {
                    throw "$emailLaunchUri";
                  }
                },
                child: customText(
                  text: "aldahabiys@gmail.com",
                  color: Colors.black,
                  fontSize: getResponsiveFont(context, fontSize: 30),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

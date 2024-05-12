import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/feature/contact_us/presentation/views/widgets/contact_us_body.dart';

import '../../../../generated/l10n.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            size: getResponsiveFont(context, fontSize: 30),
          ),
        ),
        title: customText(
          text: S.of(context).contactus,
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ContatctUsBody(),
    );
  }
}

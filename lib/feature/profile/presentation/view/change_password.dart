import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/chabge_password_body.dart';

import '../../../../generated/l10n.dart';

class ChangePasswordScreed extends StatefulWidget {
  const ChangePasswordScreed({super.key});

  @override
  State<ChangePasswordScreed> createState() => _ChangePasswordScreedState();
}

class _ChangePasswordScreedState extends State<ChangePasswordScreed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: getResponsiveFont(context, fontSize: 30),
          ),
        ),
        centerTitle: true,
        title: customText(
          text: S.of(context).changepassword,
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const ChangePasswordBpdy(),
    );
  }
}

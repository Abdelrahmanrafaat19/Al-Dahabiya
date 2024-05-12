import 'package:flutter/material.dart';
import 'package:secondwork/core/componant/custam_text.dart';
import 'package:secondwork/core/scal_factor_method.dart';
import 'package:secondwork/feature/profile/presentation/view/widget/edit_profile_body.dart';

import '../../../../generated/l10n.dart';

class EditPofileScreen extends StatefulWidget {
  const EditPofileScreen({super.key});

  @override
  State<EditPofileScreen> createState() => _EditPofileScreenState();
}

class _EditPofileScreenState extends State<EditPofileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: getResponsiveFont(context, fontSize: 30),
          ),
        ),
        centerTitle: true,
        title: customText(
          text: S.of(context).editprofile,
          color: Colors.black,
          fontSize: getResponsiveFont(context, fontSize: 20),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: const EditProfileBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/function/custom_app_bar.dart';
import 'package:graduation_project/view/widget/settings/avatar_container.dart';
import 'package:graduation_project/view/widget/shared/custom_text_field.dart';
import 'package:graduation_project/view/widget/shared/field_title.dart';

import '../../../controller/settings/account_settings_controller.dart';
import '../../widget/shared/main_button.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AccountSettingsController controller = Get.put(AccountSettingsController());
    return Scaffold(
      appBar: customAppBar(context, title: 'Account Settings'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: Get.height * 0.2,
                  width: Get.width * 0.45,
                  child: Stack(
                    children: [
                      const Center(child: AvatarContainer()),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_a_photo,
                              color: AppColors.pureWhite,
                              size: Get.height * 0.03),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              const FieldTitle(text: 'Full Name'),
              CustomTextField(hintText: controller.userName ?? 'User Name'),
              const FieldTitle(text: 'Phone Number'),
              const CustomTextField(hintText: 'Enter your phone number ...'),
              const FieldTitle(text: 'Email'),
              CustomTextField(hintText: controller.email ?? 'Email Address'),
              SizedBox(height: Get.height * 0.02),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          right: Get.width * 0.05,
          left: Get.width * 0.05,
          bottom: Get.height * 0.03,
        ),
        child: MainButton(
          buttonText: 'Save',
          onPressed: () {},
          height: Get.height * 0.05,
          width: Get.width,
        ),
      ),
    );
  }
}

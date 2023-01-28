import 'package:buahtangan/app/modules/gift-planner/widgets/add_gift_from_directory_button.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/add_gift_from_favorites_button.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/add_planner_picture_receiver.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/date_picker_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/empty_gift_list_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_label_text_field_widget.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_primary_button.dart';
import 'package:buahtangan/app/modules/gift-planner/widgets/planner_text_field_widget.dart';
import 'package:buahtangan/app/themes/color_theme.dart';
import 'package:buahtangan/app/themes/decoration.dart';
import 'package:buahtangan/app/themes/text_theme.dart';
import 'package:buahtangan/app/widgets/button/back_button.dart';
import 'package:buahtangan/app/widgets/colored_status_bar.dart';
import 'package:buahtangan/app/widgets/dropdown/dropdown_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:get/get.dart';

import '../controllers/planner_add_controller.dart';

class PlannerAddView extends StatelessWidget {
  const PlannerAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlannerAddController>(
      builder: (controller) {
        return ColoredStatusBar(
          child: Scaffold(
            backgroundColor: primaryColor,
            body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const BackButtonWidget(),
                Container(
                    width: 100.w,
                    constraints: BoxConstraints(minHeight: 90.h),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      boxShadow: [dropShadow()],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30), 
                        topRight: Radius.circular(30), 
                      )
                    ),
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddPlannerPictureReceiver(
                          controller: controller
                        ),
                        const SizedBox(height: 8),
                        const PlannerLabelTextField(
                          labelText: "Date"
                        ),
                        DatePickerWidget(
                          controller: controller,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Event"
                        ),
                        DropdownWidget(
                          dropdownValue: controller.eventValue.value,
                          items: controller.eventItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) 
                            => controller.eventValue.value = newValue!,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Budget"
                        ),
                        DropdownWidget(
                          dropdownValue: controller.budgetValue.value,
                          items: controller.budgetItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) 
                            => controller.budgetValue.value = newValue!,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Messages"
                        ),
                        PlannerTextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          hintText: "Messages",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Notes"
                        ),
                        PlannerTextFieldWidget(
                          controller: controller.testC,
                          keyboardType: TextInputType.name,
                          hintText: "Notes",
                        ),
                        const PlannerLabelTextField(
                          labelText: "Notification"
                        ),
                        DropdownWidget(
                          dropdownValue: controller.notifValue.value,
                          items: controller.notifItems.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                            );
                          }).toList(),
                          onChanged: (String? newValue) 
                            => controller.notifValue.value = newValue!,
                        ),
                        const PlannerLabelTextField(
                          labelText: "Gift List"
                        ),
                        Obx(
                          () => controller.giftsSlugs.isEmpty
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  EmptyGiftListWidget(),
                                  SizedBox(height: 16),
                                  AddGiftFromFavoritesButton(),
                                ],
                              )
                            : Text(controller.giftsSlugs.first)
                        ),
                        // const SizedBox(height: 8),
                        // Center(
                        //   child: Text(
                        //     "Or",
                        //     style: projectTextTheme.caption!.copyWith(
                        //       color: onBackgroundColor
                        //     ),
                        //   ),
                        // ),
                        // const SizedBox(height: 8),
                        // const AddGiftFromDirectoryButton(),
                        const SizedBox(height: 40),
                        PlannerPrimaryButton(
                          onTap: () {
                            controller.createNewPlanner();
                          },
                          buttonText: "Add Receiver",
                        ),
                      ]
                    ),
                )
              ],
            ),
            ),
          ),
        );
      }
    );
  }
}
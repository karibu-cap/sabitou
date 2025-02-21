import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabitou_dart/models.dart';

import '../../providers/dashboard/dasboard.dart';
import '../../routes/pages_routes.dart';
import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';
import '../../utils/user_preference.dart';
import '../../widgets/base_page.dart';
import '../../widgets/components/input_textfield.dart';
import '../../widgets/components/loading_button.dart';
import '../../widgets/components/sb_container.dart';

/// The home screen.
final class DashboardView extends StatelessWidget {
  /// Constructor of new [DashboardView].
  const DashboardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userPreference = UserPreferences.instance;

    return BasePageView(
      itemPage: DashboardLabelPage.dashboard.name,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          switch (userPreference.business) {
            final Business business => Text(
                business.name,
              ),
            _ => _AddNewBusinessForm(),
          },
        ],
      ),
    );
  }
}

final class _AddNewBusinessForm extends GetView<DashboardProvider> {
  @override
  Widget build(BuildContext context) {
    return SbContainer(
      level: 5,
      endBlurOffset: -const Offset(
        2,
        2,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(
          40,
        ),
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(20),
      width: (MediaQuery.sizeOf(context).width * 0.7).clamp(450, 800),
      child: Column(
        children: [
          SbInput(
            labelText: AppInternationalizationService.to.businessName,
            validator: (value) => switch (value) {
              final String value => value.length < 2
                  ? AppInternationalizationService.to.minimum3Characters
                  : null,
              _ => AppInternationalizationService.to.inputRequired,
            },
            onChanged: (value) => controller.formBusinessName = value ?? '',
          ),
          SbInput(
            labelText: AppInternationalizationService.to.businessDescription,
            validator: (value) => switch (value) {
              final String value => value.length < 2
                  ? AppInternationalizationService.to.minimum3Characters
                  : null,
              _ => AppInternationalizationService.to.inputRequired,
            },
            onChanged: (value) =>
                controller.formBusinessDescription = value ?? '',
          ),
          const SizedBox(height: 20),
          Text(
            AppInternationalizationService.to.storeForYourBusiness,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 10),
          SbInput(
            labelText: AppInternationalizationService.to.storeName,
            validator: (value) => switch (value) {
              final String value => value.length < 2
                  ? AppInternationalizationService.to.minimum3Characters
                  : null,
              _ => AppInternationalizationService.to.inputRequired,
            },
            onChanged: (value) =>
                controller.formBusinessDescription = value ?? '',
          ),
          SbInput(
            labelText: AppInternationalizationService.to.storeDescription,
            validator: (value) => switch (value) {
              final String value => value.length < 2
                  ? AppInternationalizationService.to.minimum3Characters
                  : null,
              _ => AppInternationalizationService.to.inputRequired,
            },
            onChanged: (value) =>
                controller.formBusinessDescription = value ?? '',
          ),
          SbInput(
            labelText: AppInternationalizationService.to.storeAddress,
            validator: (value) => switch (value) {
              final String value => value.length < 2
                  ? AppInternationalizationService.to.minimum3Characters
                  : null,
              _ => AppInternationalizationService.to.inputRequired,
            },
            onChanged: (value) =>
                controller.formBusinessDescription = value ?? '',
          ),
          const SizedBox(height: 20),
          LoadingButton(
            label: AppInternationalizationService.to.save,
            onSubmit: (buttonController) {},
            failedText: AppInternationalizationService.to.failed,
            successText: AppInternationalizationService.to.success,
            successColor: AppColors.success600,
            failedColor: AppColors.error600,
            buttonColor: Theme.of(context).colorScheme.primary,
            textStyle: const TextStyle(
              color: AppColors.grey0,
            ),
            initialWidth: MediaQuery.sizeOf(context).width.clamp(0, 360),
          ),
        ],
      ),
    );
  }
}

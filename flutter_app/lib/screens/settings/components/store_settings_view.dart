import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/form/validation.dart';
import '../../../utils/user_preference.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_grid.dart';
import '../settings_controller.dart';

/// The [StoreSettingsView] widget.
class StoreSettingsView extends StatelessWidget {
  /// Constructs of new [StoreSettingsView].
  const StoreSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> _isValidForm = ValueNotifier(true);
    final controller = context.watch<SettingsController>();
    final userPreferences = UserPreferences.instance;
    final store = userPreferences.store;
    final formKey = GlobalKey<ShadFormState>();

    if (store == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            const Icon(LucideIcons.building400, size: 25),
            Text(Intls.to.yourAreNotAssociatedWithAnyStore),
          ],
        ),
      );
    }

    final tempsStore = Store()..mergeFromProto3Json(store.toProto3Json());

    Future<void> onSave() async {
      if (formKey.currentState?.validate() == false) {
        _isValidForm.value = false;

        return;
      }
      _isValidForm.value = true;
      final result = await controller.saveStoreInfo(store: tempsStore);
      if (result) {
        showSuccessToast(
          context: context,
          message: Intls.to.businessUpdatedSuccessfully,
        );

        return;
      }

      showErrorToast(context: context, message: Intls.to.genericErrorMessage);
    }

    void cancelStoreUpdate() {
      tempsStore.mergeFromProto3Json(store.toProto3Json());
      controller.rebuild();
    }

    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.storeDetails,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          ListenableBuilder(
            listenable: _isValidForm,
            builder: (context, value) {
              return CustomGrid(
                minItemWidth: 250,
                mainAxisExtent: _isValidForm.value ? 65 : 100,
                children: [
                  ShadInputFormField(
                    id: Intls.to.storeName,
                    label: Text(Intls.to.storeName),
                    initialValue: store.name,
                    validator: ValidationFormUtils.validateCompanyName,
                    onChanged: (value) {
                      tempsStore.name = value;
                    },
                  ),
                  ShadInputFormField(
                    id: Intls.to.storeEmail,
                    label: Text(Intls.to.storeEmail),
                    initialValue: store.email,
                    validator: ValidationFormUtils.validateEmail,
                    onChanged: (value) {
                      tempsStore.email = value;
                    },
                  ),
                  ShadInputFormField(
                    id: Intls.to.storePhone,
                    label: Text(Intls.to.storePhone),
                    initialValue: store.contactInfo,
                    keyboardType: TextInputType.phone,
                    validator: ValidationFormUtils.validatePhoneNumber,
                    onChanged: (value) {
                      tempsStore.contactInfo = value;
                    },
                  ),
                  ShadInputFormField(
                    id: Intls.to.storeAddress,
                    label: Text(Intls.to.storeAddress),
                    initialValue: store.address,
                    validator: ValidationFormUtils.validateAddress,
                    onChanged: (value) {
                      tempsStore.address = value;
                    },
                  ),
                  ShadInputFormField(
                    id: Intls.to.storeDescription,
                    label: Text(Intls.to.storeDescription),
                    initialValue: store.description,
                    validator: ValidationFormUtils.validateAddress,
                    onChanged: (value) {
                      tempsStore.description = value;
                    },
                  ),
                ],
              );
            },
          ),
          Divider(
            color: ShadTheme.of(context).colorScheme.border,
            thickness: 1,
          ),
          _StoreLogo(store: store),
          Divider(
            color: ShadTheme.of(context).colorScheme.border,
            thickness: 1,
          ),
          Row(
            spacing: 12,
            children: [
              Flexible(
                child: ShadButton(
                  onPressed: onSave,
                  leading: const Icon(LucideIcons.save400),
                  child: Flexible(
                    child: Text(
                      Intls.to.saveChanges,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              ShadButton.ghost(
                onPressed: cancelStoreUpdate,
                child: Text(Intls.to.cancel),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StoreLogo extends StatelessWidget {
  final Store store;
  const _StoreLogo({required this.store});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    Future<void> uploadNewMedia() async {
      await showShadSheet(
        side: ShadSheetSide.bottom,
        context: context,
        backgroundColor: AppColors.grey0,
        builder: (context) => ShadSheet(
          padding: EdgeInsets.zero,
          closeIcon: const SizedBox.shrink(),
          radius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          child: Material(
            color: AppColors.grey0,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: const Icon(LucideIcons.fileImage),
                    title: Text(Intls.to.photoLibrary),
                    onTap: (() async {
                      final result = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      controller.setStoreTempLogo(result);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }),
                  ),
                  ListTile(
                    leading: const Icon(LucideIcons.camera),
                    title: Text(Intls.to.camera),
                    onTap: (() async {
                      final result = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      controller.setStoreTempLogo(result);
                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Text(
          Intls.to.storeLogo,
          style: ShadTheme.of(
            context,
          ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            ShadCard(
              padding: EdgeInsets.zero,
              height: 80,
              width: 80,
              child: Center(
                child: FutureBuilder(
                  future: precacheImage(
                    NetworkImage(store.logoLinkId),
                    context,
                    onError: (error, stackTrace) {
                      return null;
                    },
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.error == null) {
                      return FadeInImage(
                        placeholder: const AssetImage(StaticImages.placeholder),
                        image: switch ((
                          store.logoLinkId,
                          controller.storeTempLogo,
                        )) {
                          (_, final XFile tempFile) =>
                            kIsWeb
                                ? Image.network(tempFile.path).image
                                : Image.file(File(tempFile.path)).image,
                          (final String logoLinkId, null) =>
                            AppUtils.isURL(logoLinkId)
                                ? Image.network(logoLinkId).image
                                : Image.asset(StaticImages.placeholder).image,
                        },
                        fit: BoxFit.contain,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Icon(LucideIcons.store400, size: 30);
                        },
                        placeholderErrorBuilder: (context, error, stackTrace) {
                          return const Icon(LucideIcons.store400, size: 24);
                        },
                      );
                    }

                    return const Icon(LucideIcons.store400, size: 30);
                  },
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intls.to.uploadYourBusinessLogo,
                  style: ShadTheme.of(context).textTheme.muted,
                ),
                const SizedBox(height: 8),
                ShadButton.ghost(
                  onPressed: uploadNewMedia,
                  mainAxisAlignment: MainAxisAlignment.start,
                  leading: const Icon(LucideIcons.camera400),
                  child: Text(Intls.to.changeLogo),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

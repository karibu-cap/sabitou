import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../routes/pages_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_layout.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/base_page.dart';
import '../../../widgets/components/sb_container.dart';

/// User profile screen.
class ProfileView extends StatelessWidget {
  /// Constructor of profile view.
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageView(
      itemPage: DashboardLabelPage.profile.name,
      child: const _ProfileBody(),
    );
  }
}

class _AvatarEditButtons extends StatelessWidget {
  const _AvatarEditButtons();

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout = AppLayout(context);

    return Align(
      alignment: Alignment.centerRight,
      child: Wrap(
        runSpacing: 16.0,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                (MediaQuery.sizeOf(context).width * 0.4).clamp(90, 250),
                appLayout.isMobile
                    ? (MediaQuery.sizeOf(context).height * 0.08).clamp(50, 100)
                    : 50,
              ),
            ),
            child: Text(
              AppInternationalizationService.to.uploadNewPicture,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 16.0),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              fixedSize: Size(
                (MediaQuery.sizeOf(context).width * 0.4).clamp(90, 250),
                appLayout.isMobile
                    ? (MediaQuery.sizeOf(context).height * 0.08).clamp(50, 100)
                    : 50,
              ),
            ),
            child: Text(
              AppInternationalizationService.to.deletePicture,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _BusinessSection extends StatelessWidget {
  final String business;
  final bool isAdmin;
  const _BusinessSection({
    required this.business,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppInternationalizationService.to.business,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(AppInternationalizationService.to.manageYourBusiness),
        const SizedBox(
          height: 5.0,
        ),
        Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green, width: 2.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: Text(
                business,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 16.0),
            if (isAdmin)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                ),
                child: Text(
                  AppInternationalizationService.to.changeTheBusiness,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _BusinessStoreSection extends StatelessWidget {
  final User user;
  final bool isAdmin;
  const _BusinessStoreSection({
    required this.user,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BusinessSection(business: 'Santa Lucia', isAdmin: isAdmin),
        const SizedBox(height: 10.0),
        _StoreSection(store: 'Santa Lucia', isAdmin: isAdmin),
        const SizedBox(height: 16.0),
        Text(
          AppInternationalizationService.to.accountSecurity,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          AppInternationalizationService.to.manageYourAccountSecurity,
        ),
      ],
    );
  }
}

class _EmailPasswordFields extends StatelessWidget {
  final String email;
  final String password;
  final RxBool isPasswordVisible = false.obs;

  _EmailPasswordFields({
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final AppLayout appLayout = AppLayout(context);

        return Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            SizedBox(
              width: !appLayout.isMobile
                  ? ((constraints.maxWidth / 2) - 8)
                  : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppInternationalizationService.to.email),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: TextEditingController(text: email),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: !appLayout.isMobile
                  ? ((constraints.maxWidth / 2) - 8)
                  : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppInternationalizationService.to.password),
                  const SizedBox(height: 5.0),
                  Obx(
                    () => TextField(
                      controller: TextEditingController(text: password),
                      readOnly: true,
                      obscureText: !isPasswordVisible.value,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2.0,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 2.5,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8.0)),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                        prefixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: _togglePassword,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}

class _NameFields extends StatelessWidget {
  final String firstName;
  final String lastName;

  const _NameFields({
    required this.firstName,
    required this.lastName,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final AppLayout appLayout = AppLayout(context);

        return Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            SizedBox(
              width: !appLayout.isMobile
                  ? ((constraints.maxWidth / 2) - 8)
                  : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppInternationalizationService.to.firstName),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: TextEditingController(text: firstName),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: !appLayout.isMobile
                  ? ((constraints.maxWidth / 2) - 8)
                  : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppInternationalizationService.to.lastName),
                  const SizedBox(height: 5.0),
                  TextField(
                    controller: TextEditingController(text: lastName),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.0,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 2.5,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileBody extends StatelessWidget {
  const _ProfileBody();

  @override
  Widget build(BuildContext context) {
    /*final User user = adminUser;*/
    const bool isAdmin = true;
    final AppLayout appLayout = AppLayout(context);
    final user = UserPreferences.instance.user;

    if (user == null) {
      return const Center(
        child: Text('User not found'),
      );
    }

    return Padding(
      padding: EdgeInsets.all(appLayout.isMobile ? 20.0 : 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ProfileSection(isAdmin: isAdmin, user: user),
          _UserInfoSection(user: user),
          _BusinessStoreSection(user: user, isAdmin: isAdmin),
        ],
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final bool isAdmin;
  final User user;

  const _ProfileSection({
    required this.isAdmin,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppInternationalizationService.to.account,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  isAdmin
                      ? AppInternationalizationService.to.adminManager
                      : AppInternationalizationService.to.inventoryManager,
                ),
              ],
            ),
            if (isAdmin)
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.person,
                  size: 35.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
          ],
        ),
        const _Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _UserAvatar(
              imageUrl: const Icon(Icons.person),
              fullName: '${user.firstName} ${user.lastName}',
              isOnline: true,
            ),
            const SizedBox(width: 20.0),
            if (isAdmin)
              const Expanded(
                child: _AvatarEditButtons(),
              ),
          ],
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}

class _Spacer extends StatelessWidget {
  const _Spacer();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 5.0),
        Divider(thickness: 3.0),
        SizedBox(height: 10.0),
      ],
    );
  }
}

class _StoreSection extends StatelessWidget {
  final String store;
  final bool isAdmin;
  const _StoreSection({
    required this.store,
    required this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppInternationalizationService.to.store,
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(AppInternationalizationService.to.manageTheStore),
        const SizedBox(height: 5.0),
        Wrap(
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.green, width: 2.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
              ),
              child: Text(
                store,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(width: 16.0),
            if (isAdmin)
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 24.0,
                  ),
                ),
                child: Text(
                  AppInternationalizationService.to.changeTheStore,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String fullName;
  final Icon imageUrl;
  final bool isOnline;

  const _UserAvatar({
    required this.imageUrl,
    required this.fullName,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    final double width =
        (MediaQuery.sizeOf(context).width * 0.2).clamp(70, 100);
    final double height =
        (MediaQuery.sizeOf(context).width * 0.2).clamp(70, 100);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SbContainer(
          height: height,
          width: width,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: Badge(
            label: const SizedBox.shrink(),
            offset: Offset(-width * 0.15, -height * 0.25),
            alignment: Alignment.bottomRight,
            smallSize: 50,
            backgroundColor:
                isOnline ? AppColors.success500 : AppColors.error500,
            child: const ClipOval(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Icon(Icons.person),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Text(
          fullName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _UserInfoSection extends StatelessWidget {
  final User user;
  const _UserInfoSection({required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _NameFields(firstName: user.firstName, lastName: user.lastName),
        const _Spacer(),
        Text(
          AppInternationalizationService.to.contactEmail,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          AppInternationalizationService.to.manageYourAccountEmailAddress,
        ),
        const SizedBox(height: 16.0),
        _EmailPasswordFields(
          email: user.email,
          password: '********',
        ),
        const _Spacer(),
      ],
    );
  }
}

/*
/// Temporal mock user data.

class User {
  /// Temporal mock user data.
  final String imageUrl;

  /// Temporal mock user data.
  final String id;

  /// Temporal mock user data.
  final String firstName;

  /// Temporal mock user data.
  final String lastName;

  /// Temporal mock user data.
  final String email;

  /// Temporal mock user data.
  final String contact;

  /// Temporal mock user data.
  final String business;

  /// Temporal mock user data.
  final UserType role;

  /// Temporal mock user data.
  final String store;

  /// Temporal mock user data.
  final String password;

  /// Temporal mock user data.
  User({
    required this.imageUrl,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.contact,
    required this.business,
    required this.store,
    required this.role,
  });
}

/// Temporal mock user data.
final adminUser = User(
  imageUrl: 'assets/images/avatar-placeholder.png',
  id: '0',
  firstName: 'John',
  lastName: 'Doe',
  email: 'johndoe@sab.tu',
  contact: '+2377777777',
  business: 'Santa Lucia',
  store: 'Santa Lucia-Mendon',
  role: UserType.admin,
  password: 'password',
);

/// Temporal mock user data.
final manUser = User(
  imageUrl: 'assets/images/avatar-placeholder.png',
  id: '0',
  firstName: 'John',
  lastName: 'Doe',
  email: 'johdoe@sab.tu',
  contact: '+2377777777',
  business: 'Santa Lucia',
  store: 'Santa Lucia-Mendon',
  role: UserType.manager,
  password: 'password',
);

/// Temporal mock user data.
enum UserType {
  /// Temporal mock user data.
  admin,

  /// Temporal mock user data.
  manager,
}*/

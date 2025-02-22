import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The dashboard provider.
final class DashboardProvider extends GetxController {
  /// The form business name.
  String formBusinessName = '';

  /// The form business description.
  String formBusinessDescription = '';

  /// The from key.
  final formKey = GlobalKey<FormState>();
}

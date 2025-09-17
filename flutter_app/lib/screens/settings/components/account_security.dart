import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';

/// The [AccountSecurity] widget.
class AccountSecurity extends StatelessWidget {
  /// Constructs of new [AccountSecurity].
  const AccountSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return ShadForm(
      key: formKey,
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _AccountSecurity(),
          Divider(
            color: ShadTheme.of(context).colorScheme.border,
            thickness: 1,
          ),

          const _DataAndPrivacy(),
          Divider(
            color: ShadTheme.of(context).colorScheme.border,
            thickness: 1,
          ),
          Row(
            spacing: 12,
            children: [
              Flexible(
                child: ShadButton(
                  onPressed: () {},
                  leading: const Icon(LucideIcons.save400),
                  child: Flexible(
                    child: Text(
                      Intls.to.saveChanges,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              ShadButton.ghost(onPressed: () {}, child: Text(Intls.to.cancel)),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountSecurity extends StatelessWidget {
  const _AccountSecurity();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          Intls.to.accountSecurity,
          style: ShadTheme.of(
            context,
          ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
        ),
        ShadCard(
          child: Row(
            spacing: 12,
            children: [
              const Icon(LucideIcons.key400),
              Expanded(child: Text(Intls.to.password)),
              ShadButton.ghost(
                onPressed: () {},
                child: Text(Intls.to.changePassword),
              ),
            ],
          ),
        ),
        ShadCard(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 12,
                children: [
                  const Icon(LucideIcons.shield400),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Intls.to.twoFactorAuthentication),
                        Text(Intls.to.twoFactorAuthenticationDescription),
                      ],
                    ),
                  ),
                  ShadBadge(child: Text(Intls.to.notEnabled)),
                ],
              ),
              ShadButton(onPressed: () {}, child: Text(Intls.to.enable2FA)),
            ],
          ),
        ),
      ],
    );
  }
}

class _DataAndPrivacy extends StatelessWidget {
  const _DataAndPrivacy();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Text(
          Intls.to.dataAndPrivacy,
          style: ShadTheme.of(
            context,
          ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
        ),
        ShadButton.ghost(
          onPressed: () {},
          leading: const Icon(LucideIcons.download400),
          child: Text(Intls.to.exportMyData),
        ),
      ],
    );
  }
}

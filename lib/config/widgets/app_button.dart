import 'package:flutter/material.dart';
import 'package:ubt_pbb/config/constants/app_colors.dart';

/// Primary rounded button.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.icon,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
   /// When true, button is visually and functionally disabled.
  final bool isDisabled;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bool _isDisabledEffective = isDisabled || onPressed == null || isLoading;

    final Color primary = theme.colorScheme.primary;
    final Color onPrimary = theme.colorScheme.onPrimary;
    final Color disabledBackground = theme.colorScheme.onSurface.withOpacity(0.08);
    final Color disabledForeground = theme.colorScheme.onSurface.withOpacity(0.4);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: _isDisabledEffective ? 0 : 4,
          shadowColor: _isDisabledEffective ? Colors.transparent : primary.withOpacity(0.5),
          backgroundColor: AppColors.mainBlue,
          foregroundColor: _isDisabledEffective ? disabledForeground : onPrimary,
        ),
        onPressed: _isDisabledEffective ? null : onPressed,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: _isDisabledEffective
                ? LinearGradient(
                    colors: <Color>[
                      disabledBackground,
                      disabledBackground,
                    ],
                  )
                : LinearGradient(
                    colors: <Color>[
                      primary,
                      primary.withOpacity(0.85),
                    ],
                  ),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _isDisabledEffective ? disabledForeground : onPrimary,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (icon != null) ...<Widget>[
                        Icon(icon, size: 20),
                        const SizedBox(width: 8),
                      ],
                      Text(
                        text,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

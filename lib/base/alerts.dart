import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Alerts {

  //ok alert
  Future<OkCancelResult> showOkAlertDialog({
    String? title,
    String? message,
    String? okLabel,
    bool barrierDismissible = true,
    @Deprecated('Use `style` instead.') AdaptiveStyle? alertStyle,
    AdaptiveStyle? style,
    @Deprecated('Use `ios` instead. Will be removed in v2.')
    bool useActionSheetForCupertino = false,
    bool useActionSheetForIOS = false,
    bool useRootNavigator = true,
    VerticalDirection actionsOverflowDirection = VerticalDirection.up,
    bool fullyCapitalizedForMaterial = true,
    WillPopCallback? onWillPop,
    AdaptiveDialogBuilder? builder,
  }) async {
    final theme = Theme.of(Get.context!);
    final adaptiveStyle = style ?? AdaptiveDialog.instance.defaultStyle;
    final isMacOS = adaptiveStyle.effectiveStyle(theme) == AdaptiveStyle.macOS;
    final result = await showAlertDialog<OkCancelResult>(
      context: Get.context!,
      title: title,
      message: message,
      barrierDismissible: barrierDismissible,
      style: alertStyle ?? style,
      useActionSheetForIOS: useActionSheetForCupertino || useActionSheetForIOS,
      useRootNavigator: useRootNavigator,
      actionsOverflowDirection: actionsOverflowDirection,
      fullyCapitalizedForMaterial: fullyCapitalizedForMaterial,
      onWillPop: onWillPop,
      builder: builder,
      actions: [
        AlertDialogAction(
          label: okLabel ?? MaterialLocalizations.of( Get.context!).okButtonLabel,
          key: OkCancelResult.ok,
          isDefaultAction: isMacOS,
        )
      ],
    );
    return result ?? OkCancelResult.cancel;
  }

  Future<OkCancelResult> showOkCancelAlertDialog({
    String? title,
    String? message,
    String? okLabel,
    String? cancelLabel,
    OkCancelAlertDefaultType? defaultType,
    bool isDestructiveAction = false,
    bool barrierDismissible = true,
    @Deprecated('Use `style` instead.') AdaptiveStyle? alertStyle,
    AdaptiveStyle? style,
    @Deprecated('Use `ios` instead. Will be removed in v2.')
    bool useActionSheetForCupertino = false,
    bool useActionSheetForIOS = false,
    bool useRootNavigator = true,
    VerticalDirection actionsOverflowDirection = VerticalDirection.up,
    bool fullyCapitalizedForMaterial = true,
    WillPopCallback? onWillPop,
    AdaptiveDialogBuilder? builder,
  }) async {
    final theme = Theme.of(Get.context!);
    final adaptiveStyle = style ?? AdaptiveDialog.instance.defaultStyle;
    final isMaterial = adaptiveStyle.isMaterial(theme);
    String defaultCancelLabel() {
      final label = MaterialLocalizations.of(Get.context!).cancelButtonLabel;
      return label;
    }

    final result = await showAlertDialog<OkCancelResult>(
      context: Get.context!,
      title: title,
      message: message,
      barrierDismissible: barrierDismissible,
      style: alertStyle ?? style,
      useActionSheetForIOS: useActionSheetForCupertino || useActionSheetForIOS,
      useRootNavigator: useRootNavigator,
      actionsOverflowDirection: actionsOverflowDirection,
      fullyCapitalizedForMaterial: fullyCapitalizedForMaterial,
      onWillPop: onWillPop,
      builder: builder,
      actions: [
        AlertDialogAction(
          label: cancelLabel ?? defaultCancelLabel(),
          key: OkCancelResult.cancel,
          isDefaultAction: defaultType == OkCancelAlertDefaultType.cancel,
        ),
        AlertDialogAction(
          label: okLabel ?? MaterialLocalizations.of(Get.context!).okButtonLabel,
          key: OkCancelResult.ok,
          isDefaultAction:
          defaultType == null || defaultType == OkCancelAlertDefaultType.ok,
          isDestructiveAction: isDestructiveAction,
        ),
      ],
    );
    return result ?? OkCancelResult.cancel;
  }



  Future<OkCancelResult> showOkLogOutAlertDialog({
    String? title,
    String? message,
    String? okLabel,
    String? cancelLabel,
    OkCancelAlertDefaultType? defaultType,
    bool isDestructiveAction = false,
    bool barrierDismissible = true,
    @Deprecated('Use `style` instead.') AdaptiveStyle? alertStyle,
    AdaptiveStyle? style,
    @Deprecated('Use `ios` instead. Will be removed in v2.')
    bool useActionSheetForCupertino = false,
    bool useActionSheetForIOS = false,
    bool useRootNavigator = true,
    VerticalDirection actionsOverflowDirection = VerticalDirection.up,
    bool fullyCapitalizedForMaterial = true,
    WillPopCallback? onWillPop,
    AdaptiveDialogBuilder? builder,
  }) async {
    final theme = Theme.of(Get.context!);
    final adaptiveStyle = style ?? AdaptiveDialog.instance.defaultStyle;
    final isMaterial = adaptiveStyle.isMaterial(theme);
    String defaultCancelLabel() {
      final label = MaterialLocalizations.of(Get.context!).cancelButtonLabel;
      return label;
    }

    final result = await showAlertDialog<OkCancelResult>(
      context: Get.context!,
      title: title,
      message: message,
      barrierDismissible: barrierDismissible,
      style: alertStyle ?? style,
      useActionSheetForIOS: useActionSheetForCupertino || useActionSheetForIOS,
      useRootNavigator: useRootNavigator,
      actionsOverflowDirection: actionsOverflowDirection,
      fullyCapitalizedForMaterial: fullyCapitalizedForMaterial,
      onWillPop: onWillPop,
      builder: builder,
      actions: [
        AlertDialogAction(
          label: cancelLabel ?? defaultCancelLabel(),
          key: OkCancelResult.cancel,
          isDefaultAction: defaultType == OkCancelAlertDefaultType.cancel,
        ),
        AlertDialogAction(
          label: okLabel ?? MaterialLocalizations.of(Get.context!).okButtonLabel,
          key: OkCancelResult.ok,
          isDefaultAction:
          defaultType == null || defaultType == OkCancelAlertDefaultType.ok,
          isDestructiveAction: isDestructiveAction,
        ),
      ],
    );
    return result ?? OkCancelResult.cancel;
  }

}
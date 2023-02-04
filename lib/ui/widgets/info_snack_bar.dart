import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum StatusSnackBar { error, done, info }

/// Muestra una alerta de confirmación según el [statusSnackBar] recibido.
class InfoSnackbar extends GetSnackBar {
  final StatusSnackBar statusSnackBar;
  const InfoSnackbar({
    Key? key,
    required this.statusSnackBar,
    required String message,
  }) : super(key: key, message: message);

  @override
  Color get backgroundColor {
    switch (statusSnackBar) {
      case StatusSnackBar.error:
        return Colors.redAccent;
      case StatusSnackBar.done:
        return Colors.greenAccent;
      case StatusSnackBar.info:
      default:
        return Colors.blueAccent;
    }
  }

  @override
  Widget? get icon {
    switch (statusSnackBar) {
      case StatusSnackBar.error:
        return const Icon(Icons.error_outline, color: Colors.white);
      case StatusSnackBar.done:
        return const Icon(Icons.done_outline, color: Colors.black87);
      case StatusSnackBar.info:
      default:
        return const Icon(Icons.info_outline, color: Colors.white);
    }
  }

  @override
  Widget? get mainButton {
    return IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(Icons.close_outlined),
    );
  }

  @override
  Duration? get duration => const Duration(seconds: 3);

  @override
  Widget? get messageText {
    return SelectableText(
      message!,
      style: TextStyle(
        fontSize: 12,
        overflow: TextOverflow.ellipsis,
        color: _getColorMessageText(),
      ),
      maxLines: 1,
    );
  }

  @override
  SnackPosition get snackPosition => SnackPosition.TOP;

  Color _getColorMessageText() {
    switch (statusSnackBar) {
      case StatusSnackBar.done:
        return Colors.black87;
      case StatusSnackBar.error:
      case StatusSnackBar.info:
      default:
        return Colors.white;
    }
  }
}

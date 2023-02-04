import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_firebase/injector.dart';
import 'package:flutter_app_firebase/ui/extensions/context_extension.dart';
import 'package:flutter_app_firebase/ui/pages/login_page/login_controller.dart';
import 'package:flutter_app_firebase/ui/widgets/info_snack_bar.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller = Get.find<LoginController>();
  bool valueSwitch = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildHeader(),
            _buildBodyPage(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Expanded(
      flex: 25,
      child: Container(
        alignment: Alignment.center,
        color: context.colorScheme.inversePrimary,
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Text(
              "AMB APP",
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onPrimary,
              ),
            ),
            Text(
              "Login",
              style: context.textTheme.titleMedium?.copyWith(
                color: context.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyPage() {
    return Expanded(
      flex: 75,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 18),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Celular",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 15,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                  NumberTextInputFormatter(),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  counterText: "",
                  isCollapsed: true,
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 22),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Clave",
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 34,
                  height: 26 / 34,
                ),
                obscuringCharacter: '●',
                scrollPadding: EdgeInsets.zero,
                controller: controller.passwordController,
                obscureText: true,
                maxLength: 50,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  counterText: "",
                  isCollapsed: true,
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Switch(
                    value: valueSwitch,
                    activeTrackColor: context.colorScheme.inversePrimary,
                    onChanged: (value) {
                      setState(() {
                        valueSwitch = !valueSwitch;
                      });
                    },
                  ),
                  const SizedBox(width: 16),
                  Text(
                    "Recordar",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
              const SizedBox(height: 50),
              _buildBottomPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: controller.isOkInfoLogin()
              ? () async {
                  final result = await controller.signIn();
                  print(result);
                  if (result) {
                    await Get.offNamed(Injector.homePath);
                  } else {
                    Get.showSnackbar(const InfoSnackbar(
                      message: "No se encontro el usuario",
                      statusSnackBar: StatusSnackBar.info,
                    ));
                  }
                }
              : null,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              controller.isOkInfoLogin()
                  ? context.colorScheme.scrim
                  : context.colorScheme.surfaceVariant,
            ),
            foregroundColor: MaterialStatePropertyAll(
              context.colorScheme.background,
            ),
            textStyle: MaterialStatePropertyAll(
              context.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: context.colorScheme.background,
                fontSize: 22,
              ),
            ),
            padding: const MaterialStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: 46,
                vertical: 10,
              ),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: const Text('Entrar'),
        ),
        const SizedBox(height: 16),
        RichText(
          text: TextSpan(
            text: "Olvido su clave?",
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                print("onPressed to forget password");
              },
          ),
        ),
      ],
    );
  }
}

/// Para dar un formateo al textField del numero de celular.
class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write('${newValue.text.substring(0, usedSubstringIndex = 2)} ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex) {
      newText.write(newValue.text.substring(usedSubstringIndex));
    }
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}

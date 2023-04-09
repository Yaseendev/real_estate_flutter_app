import 'package:flutter/material.dart';
import 'package:real_estate_app/Utils/themes.dart';

enum ButtonState { idle, loading }

class AccountButton extends StatefulWidget {
  final VoidCallback onPress;
  final String label;
  const AccountButton({
    Key? key,
    required this.onPress,
    required this.label,
  }) : super(key: key);

  @override
  State<AccountButton> createState() => _AccountButtonState();
}

class _AccountButtonState extends State<AccountButton> {
  ButtonState buttonState = ButtonState.idle;
  bool isAnimating = true;

  @override
  Widget build(BuildContext context) {
    final isStretched = isAnimating || buttonState == ButtonState.idle;
    return Container(
      alignment: Alignment.center,
      child: AnimatedContainer(
        width: buttonState == ButtonState.idle
            ? MediaQuery.of(context).size.width
            : 80,
        duration: Duration(milliseconds: 250),
        onEnd: () => setState(() => isAnimating = !isAnimating),
        curve: Curves.easeIn,
        child: isStretched
            ? ElevatedButton.icon(
                icon: const Icon(Icons.login),
                label: Text(
                  widget.label,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () async {
                  setState(() {
                    buttonState = ButtonState.loading;
                  });
                  await Future.delayed(Duration(seconds: 3));
                  setState(() {
                    buttonState = ButtonState.idle;
                  });
                  // if (widget._formKey.currentState!.validate()) {
                  // context.read<AccountBloc>().add(
                  //     LoginWithEmailEvent(email: email, password: password));

                  //}
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.PRIMARY_COLOR),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 35)),
                ),
              )
            : Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.PRIMARY_COLOR,
                ),
                padding: EdgeInsets.all(12),
                child: Center(
                    child: CircularProgressIndicator(color: Colors.white)),
              ),
      ),
    );
  }
}

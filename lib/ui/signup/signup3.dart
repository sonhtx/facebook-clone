

import 'package:anti_fb/ui/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextWidget.dart';


class SignupForm3 extends StatelessWidget{
  DateTime birthday;

  SignupForm3(this.birthday, {super.key });

  void onBirthdayChanged(DateTime newDate) {
    birthday = newDate;
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const TextWidget(text: "What's your birthday?", fontSize: 20, textColor: Colors.cyan),
        const TextWidget(text: "Choose your date of birth. You can always make it private later.",
            fontSize: 10, textColor: Colors.grey, paddingTop: 5.0),

        Container(
          padding: const EdgeInsets.only(top: 50.0),
          child: DatePicker(
              birthday: birthday,
              onBirthdayChanged: onBirthdayChanged,
            )
        ),

        ButtonWidget(buttonText: 'Next', paddingTop: 10.0, textColor: Colors.white,
            backgroundColor: Colors.cyan,
            onPressed: (){
              final SignupState? signupState = context.findAncestorStateOfType<SignupState>();

              signupState?.signupData.birthday = birthday;
              signupState?.moveFoward();
              // TODO: Signup new user
            }),
      ],
    );
  }


}

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key, required this.birthday, required this.onBirthdayChanged}) : super(key: key);

  final DateTime birthday;
  final Function(DateTime) onBirthdayChanged;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime bday ;

  @override
  void initState() {
    super.initState();
    bday = widget.birthday;
  }

  // This function displays a CupertinoModalPopup with a reasonable fixed height
  // which hosts CupertinoDatePicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            _DatePickerItem(
              children: <Widget>[
                const Text('Birthday'),
                CupertinoButton(
                  // Display a CupertinoDatePicker in date picker mode.
                  onPressed: () => _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: bday,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      // This shows day of week alongside day of month
                      showDayOfWeek: true,
                      // This is called when the user changes the date.
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() => bday = newDate);
                        widget.onBirthdayChanged(bday);
                      },
                    ),
                  ),
                  // In this example, the date is formatted manually. You can
                  // use the intl package to format the value based on the
                  // user's locale settings.
                  child: Text(
                    '${bday.month}-${bday.day}-${bday.year}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      )
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: children,
        ),
      ),
    );
  }
}

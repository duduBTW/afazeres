import 'package:flutter/material.dart';

import 'components/date.dart';

class SelectDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NewPageDate(
      label: "Select date",
      onCancel: () => Navigator.of(context).pop(),
      onNext: () => Navigator.of(context).pushNamed("/new/selectTime"),
    );
  }
}

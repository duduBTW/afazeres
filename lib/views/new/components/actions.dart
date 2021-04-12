import 'package:flutter/material.dart';

class ActionsNew extends StatelessWidget {
  final Function onNext;
  final Function onCancel;

  const ActionsNew({Key key, this.onNext, this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ActionItem("Back", onCancel),
        ActionItem.end("Next", onNext),
      ],
    );
  }
}

enum ActionAligm { start, end, center }

class ActionItem extends StatelessWidget {
  final String label;
  final ActionAligm align;
  final Function onClick;

  const ActionItem(this.label, this.onClick) : align = ActionAligm.start;
  const ActionItem.start(this.label, this.onClick) : align = ActionAligm.start;
  const ActionItem.end(this.label, this.onClick) : align = ActionAligm.end;
  const ActionItem.center(this.label, this.onClick)
      : align = ActionAligm.center;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          // height: 30,
          width: 100,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            alignment: align == ActionAligm.start
                ? Alignment(-1, 0)
                : align == ActionAligm.center
                    ? Alignment(0, 0)
                    : Alignment(1, 0),
            child: Text(
              label.toUpperCase(),
              style: align == ActionAligm.end || align == ActionAligm.center
                  ? Theme.of(context).textTheme.button
                  : Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ),
    );
  }
}

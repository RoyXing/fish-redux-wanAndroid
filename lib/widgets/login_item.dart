import 'package:fishreduxwanandroid/utils/colors.dart';
import 'package:fishreduxwanandroid/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginItem extends StatefulWidget {
  LoginItem({
    Key key,
    this.prefixIcon,
    this.hasSuffixIcon = false,
    this.hintText,
    this.controller,
    this.color,
  }) : super(key: key);

  final IconData prefixIcon;
  final bool hasSuffixIcon;
  final String hintText;
  final TextEditingController controller;
  final Color color;

  @override
  _LoginItemState createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasSuffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          iconSize: 28,
          icon: Icon(
            widget.prefixIcon,
            color: widget.color ?? Theme.of(context).primaryColor,
          ),
        ),
        Gaps.hGap30,
        Expanded(
          child: TextField(
            obscureText: _obscureText,
            controller: widget.controller,
            style: TextStyle(color: Colours.gray_66, fontSize: 14),
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.hasSuffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colours.gray_66,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: widget.color ?? Colours.green_1),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: Colours.green_de),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
    this.width,
    this.height = 50,
    this.margin,
    this.radius,
    this.bgColor,
    this.highlightColor,
    this.splashColor,
    this.child,
    this.text,
    this.style,
    this.onPressed,
  }) : super(key: key);
  final double width;
  final double height;

  final EdgeInsetsGeometry margin;
  final double radius;
  final Color bgColor;
  final Color highlightColor;
  final Color splashColor;

  final Widget child;
  final String text;
  final TextStyle style;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Color _bgColor = bgColor ?? Theme.of(context).primaryColor;
    BorderRadius _borderRadius = BorderRadius.circular(radius ?? (height / 2));

    return Container(
      width: width,
      height: height,
      margin: margin,
      child: Material(
        borderRadius: _borderRadius,
        color: _bgColor,
        child: InkWell(
          borderRadius: _borderRadius,
          onTap: () {
            onPressed();
          },
          child: child ??
              Center(
                child: Text(
                  text,
                  style: style ?? TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
        ),
      ),
    );
  }
}

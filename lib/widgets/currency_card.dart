import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final int index;
  final String name, code, amount;
  final bool isInverted;
  final IconData icon;

  final _blackColor = const Color(0xFF1F2123);
  final Color _whiteColor = Colors.white;

  Color get innerColor => isInverted ? _blackColor : _whiteColor;

  const CurrencyCard({
    super.key,
    required this.index,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, index * -20),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: innerColor,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(color: innerColor, fontSize: 20),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        code,
                        style: TextStyle(
                          color: innerColor.withAlpha(204),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.2,
                child: Transform.translate(
                  offset: const Offset(-5, 12),
                  child: Icon(icon, color: innerColor, size: 88),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

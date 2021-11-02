import 'package:flutter/material.dart';
import 'package:housing_app/helpers/responsive_helper.dart';
import 'package:housing_app/helpers/session_data.dart';
import 'package:housing_app/helpers/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';

class IdCard extends StatelessWidget {
  final int index, dayCount;
  IdCard(this.index, this.dayCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponseHelper.instance.width - 90,
      height: ResponseHelper.instance.width * 0.35,
      margin: const EdgeInsets.only(left: 20, right: 10, bottom: 5),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Color(0xFF3A5160).withOpacity(0.3),
              offset: Offset(1.0, 1.0),
              blurRadius: 4.0),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                SessionData.instance.idCards[index],
                style: TextStyles.regboldTxtStyle,
              ),
              Text(
                "Active",
                style: TextStyles.regboldTxtStyle.copyWith(color: Colors.green),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            width: ResponseHelper.instance.width,
            height: 1,
            color: Colors.black45,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SessionData.instance.name,
                      style: TextStyles.regboldTxtStyle,
                    ),
                    Text(
                      SessionData.instance.flatNo.toString(),
                      style: TextStyles.regboldTxtStyle,
                    ),
                    Text(
                      "Valid - " +
                          DateFormat("dd-MM-yyyy").format(
                              DateTime.now().add(Duration(days: dayCount))),
                      style: TextStyles.regboldTxtStyle,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: QrImage(
                    data: SessionData.instance.idCards[index],
                    version: QrVersions.auto,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

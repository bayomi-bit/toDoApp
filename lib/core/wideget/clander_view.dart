import 'package:db/provider/data_provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../const/colors.dart';

class ClanderView extends StatelessWidget {
  const ClanderView({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return EasyInfiniteDateTimeLine(
      showTimelineHeader: false,

      timeLineProps: const EasyTimeLineProps(),

      dayProps: const EasyDayProps(
        dayStructure: DayStructure.dayNumDayStr,
        inactiveDayStyle: DayStyle(

            decoration: BoxDecoration(

              borderRadius: BorderRadius.all(Radius.circular(10)),
              color:    Color(0xffDEB5E4),
            ),
            dayNumStyle: TextStyle(
              fontSize: 18.0,
            )),
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                ColorsManager.primaryColor,
                ColorsManager.primaryColor,
              ],
            ),
          ),
          dayNumStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        width: 48.0,
        height: 68,
      ),
      activeColor: ColorsManager.primaryColor,
      firstDate: DateTime(2023),
      focusDate: dataProvider.focusDate,
      lastDate:  DateTime.now(),
      onDateChange: (selectedDate) {
        dataProvider.changeData(selectedDate);
      },
    );
  }
}

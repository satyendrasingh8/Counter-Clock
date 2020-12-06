import 'package:CountDown_Timer/alarm_info.dart';
import 'package:CountDown_Timer/enums.dart';
import 'package:CountDown_Timer/menu_info.dart';
import 'package:CountDown_Timer/theme_data.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock', imageSource: 'assets/clock_icon.png'),
  MenuInfo(MenuType.alarm,
      title: 'Alarm', imageSource: 'assets/alarm_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer', imageSource: 'assets/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch', imageSource: 'assets/stopwatch_icon.png')
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(Duration(hours: 1)),
   description: 'office',
  gradientColors: GradientColors.sky),
  AlarmInfo(DateTime.now().add(Duration(hours: 2)), 
  description: 'School',
  gradientColors: GradientColors.sunset
  
  ),
];

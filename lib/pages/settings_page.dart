import 'package:flutter/material.dart';
import 'package:back_pal/widgets/settingsPage_widgets/language_row.dart';
import 'package:back_pal/widgets/settingsPage_widgets/interval_row.dart';
import 'package:back_pal/widgets/settingsPage_widgets/startTime_row.dart';
import 'package:back_pal/widgets/settingsPage_widgets/endTime_row.dart';
import 'package:back_pal/widgets/settingsPage_widgets/includeWeekends_row.dart';
import 'package:back_pal/widgets/settingsPage_widgets/proSettingsHeader.dart';
import 'package:back_pal/widgets/settingsPage_widgets/showAds_row.dart';
import 'package:back_pal/widgets/settingsPage_widgets/selectCountry_row.dart';
import 'package:back_pal/widgets/settingsPage_widgets/switchOffOnHolidays_row.dart';
import 'package:back_pal/services/language_service.dart';
import 'package:back_pal/services/notification_service.dart';
import 'package:back_pal/utilities/dailyTimeChangeHandler.dart'; //added

class SettingsPage extends StatelessWidget {
  final TimeChangeHandler timeChangeHandler;
  final NotificationService notificationService;
  final Function(bool) updateIsRunningCallback;
  final bool isRunning; // Add this

  SettingsPage({
    required this.timeChangeHandler,
    required this.notificationService,
    required this.updateIsRunningCallback,
    required this.isRunning, // Add this
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          LanguageService.getTranslation('app_settings') ?? 'Settings',
          style: TextStyle(
            fontSize: 26.0,
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white), //makes arrow white
      ),

      body: Container(
        color: Colors.grey[850],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView(
            children: [
              // Your existing Column content here
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  // Language Row
                  LanguageRow(),
                  const SizedBox(height: 20.0),
                  // Interval reminder Row
                  IntervalReminderRow(),
                  const SizedBox(height: 20.0),
                  DailyStartTimeRow(
                    timeChangeHandler: timeChangeHandler,
                    notificationService: notificationService,
                    isRunning: isRunning,
                  ),
                  const SizedBox(height: 20.0),
                  DailyEndTimeRow(
                    timeChangeHandler: timeChangeHandler,
                  ),

                  // Daily start time Row
                  // DailyStartTimeRow(),
                  // const SizedBox(height: 20.0),
                  // // Daily end time Row
                  // DailyEndTimeRow(),
                  const SizedBox(height: 20.0),
                  // Include weekends Row
                  IncludeWeekendsRow(),
                  const SizedBox(height: 20.0),
                  //double boxes

                  const SizedBox(height: 20.0),
                  // Pro settings heading
                  ProSettingsHeader(),
                  const SizedBox(height: 20.0),
                  // Show ads Row
                  ShowAdsRow(isEnabled: false),
                  // isEnabled as false to disable
                  const SizedBox(height: 20.0),
                  // Select country Row
                  SelectCountryRow(isEnabled: false),
                  // isEnabled as false to disable
                  const SizedBox(height: 20.0),
                  // Switch off on holidays Row
                  SwitchOffOnHolidays(isEnabled: false),
                  // isEnabled as false to disable
                  const SizedBox(height: 20.0),
                  // Disable certain days Row
                  // DisableDaysRow(),
                ],
              ),
            ],
          )
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';


class NotificationsManager extends StatelessWidget {
  final List<String> _notifications_list = ['You failed to reach your monthly goal!','You used more than your actual consumption limit','You used 90% of you water consumption limit','You successfully reached your monthly goal!','You used 90% of you water consumption limit','You successfully reached your monthly goal!','Leakage detection alert!','Monthly goal successfully changed'];
  final List<String> _notifications_date = ['01 Dec.','25 Nov.','20 Nov.','01 Nov.','23 Oct.','01 Oct.','09 Sep.','02 Sep.'];
  final List<String> _notifications_details = ['The last month you used 14,369l of water. The consumption limit was set at 13,000l.','You just used 100% of your consumption, that is currently set at 13,000. Be careful!','You just reached 90% of your consumption limit, that is currently set at 13,000.','Good job! Last month you used less than your consumption limit. Keep up the good work!','You just reached 90% of your consumption limit, that is currently set at 13,000.','Good job! Last month you used less than your consumption limit. Keep up the good work!','ALERT! There is a suspicion of water leakage with the Kitchen Sink!','You successfully set the monthly consumption limit to 13,000l (previous was 15,000l)'];

  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      home: Scaffold(
          body: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: _notifications_list.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
                  leading: ThumbnailsManager(_notifications_list[index]),
                  //Image.asset("./asset/images/hanyang.png"),
                  title: Text(_notifications_list[index]),
                  subtitle: Text(_notifications_details[index]),
                  /*onTap: () =>
                      setState(() {
                        String id = snapshot
                            .data[_notifications_list[index]]["_id"].toString();
                        //var x = snapshot.data[appliancesNameList[index]]['measurementsTotal'].toString();
                        dataChart = CallApi().getOne(id);
                      }),*/
                  trailing: Text(_notifications_date[index])
              ),
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(),
          ),
      ),
    );
  }
}
ThumbnailsManager(String notificationType) {
  switch(notificationType) {
    case "Leakage detection alert!":{
      return Icon(Icons.notification_important, color: Colors.red);
    }
    case "You failed to reach your monthly goal!":{
      return Icon(Icons.notifications);//Image.asset("./asset/images/DishWasher.png");
    }
    default:{
      return Icon(Icons.notifications_none);
    }
  }
}

import 'package:flutter/material.dart';
final _callData = List<Map<String, Object>>.generate(10, (int index) {  
  return {
    'avatar': Icon(Icons.person),
    'name': 'shehroze $index',
    'lastmessage': 'incomming call',
    'lastseen': '1:00 pm',
  };
}
);
class Callitem{
  final Icon avatar;
  final String name;
  final String lastmessage;
  final String lastseen;
  Callitem.fromdata(data):
  this.avatar=data['avatar'],
  this.name=data['name'],
  this.lastmessage=data['lastmessage'],
  this.lastseen=data['lastseen'];

  static fromData(Map<String, Object> callData) {}
  }
  class CallList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: _callData.length,
        itemBuilder: (BuildContext context, int index) {
          final callItem = Callitem.fromData(_callData[index]);
        final avatarRadius = 25.0;

        return ListTile(
          leading: CircleAvatar( 
            radius: avatarRadius,
            child: callItem.avatar,
          ),
          title: Text(
            callItem.name,
            style: Theme.of(context).textTheme.subhead,
          ),
          subtitle: Text(
            callItem.lastmessage,
            style: TextStyle(
              color: Theme.of(context).textTheme.caption.color,
            ),
          ),
          trailing: Text(
            callItem.lastseen,
            style: TextStyle(color: Colors.grey),
          ),
        );
      },
    );
  }
}
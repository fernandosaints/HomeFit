import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CalendarScreenState();
  }
}

class _CalendarScreenState extends State<CalendarScreen> {

  TextEditingController _textFieldController = TextEditingController();

  List _selectedEvents;
  DateTime _selectedDay;

  // final Map<DateTime, List> _events = {
  //   DateTime(2020, 5, 7): [
  //     {'name': 'Event A', 'isDone': true},
  //   ],
  //   DateTime(2020, 5, 9): [
  //     {'name': 'Event A', 'isDone': true},
  //     {'name': 'Event B', 'isDone': true},
  //   ],
  //   DateTime(2020, 5, 10): [
  //     {'name': 'Event A', 'isDone': true},
  //     {'name': 'Event B', 'isDone': true},
  //   ],
  //   DateTime(2020, 5, 13): [
  //     {'name': 'Event A', 'isDone': true},
  //     {'name': 'Event B', 'isDone': true},
  //     {'name': 'Event C', 'isDone': false},
  //   ],
  //   DateTime(2020, 5, 25): [
  //     {'name': 'Event A', 'isDone': true},
  //     {'name': 'Event B', 'isDone': true},
  //     {'name': 'Event C', 'isDone': false},
  //   ],
  //   DateTime(2020, 6, 6): [
  //     {'name': 'Event A', 'isDone': false},
  //   ],
  // };

  final Map<DateTime, List> _events = {};

  _displayDialog(BuildContext context) async {
    _textFieldController.clear();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Adicionar Tarefa'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Tarefa"),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child:  new Text('Confirmar'),
                onPressed: () {
                  if(_textFieldController.text.isNotEmpty){
                    if(_events[_selectedDay] == null){
                      _events[_selectedDay] = [{'name': _textFieldController.text, 'isDone': false}];
                    }
                    else {
                      _events[_selectedDay].add({'name': _textFieldController.text, 'isDone': false});
                    }
                  }
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void _handleNewDate(date) {
    super.setState(() {
      _selectedDay = date;
      _selectedEvents = _events[_selectedDay] ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedEvents = _events[_selectedDay] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Calendário", style: TextStyle(color:Colors.black),),
        centerTitle: true,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => _displayDialog(context),
          ),
        ]
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              color: Colors.white,
              //padding: EdgeInsets.only(top: 50),
              child: Calendar(
                startOnMonday: true,
                weekDays: ["Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
                events: _events,
                onRangeSelected: (range) =>
                    print("Range is ${range.from}, ${range.to}"),
                onDateSelected: (date) => _handleNewDate(date),
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                todayColor: Colors.yellow,
                eventColor: Colors.grey,
                dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 12),
              ),
            ),
            _buildEventList()
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.5, color: Colors.black12),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: ListTile(
            title: Text(_selectedEvents[index]['name'].toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    size: 20.0,
                    color: Colors.black
                  ),
                  onPressed: () {
                    setState(() { _events[_selectedDay].removeAt(index);  });
                  },
              ),]
            ),
          ),
        ),
        itemCount: _selectedEvents.length,
      ),
    );
  }
}
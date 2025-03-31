
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  const Schedule({super.key});

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  // Selected date from calendar
  DateTime _selectedDate = DateTime.now();
  
  // Selected tab for week/month view
  int _selectedViewTab = 0;
  
  // Mock schedule data
  final List<Map<String, dynamic>> classes = [
    {
      'title': 'Morning Flow',
      'day': 'Monday',
      'time': '7:30 AM - 8:15 AM',
      'type': 'Yoga',
      'students': 12,
      'recurring': true,
      'location': 'Studio A'
    },
    {
      'title': 'Meditation Basics',
      'day': 'Monday',
      'time': '6:00 PM - 6:45 PM',
      'type': 'Meditation',
      'students': 8,
      'recurring': true,
      'location': 'Studio B'
    },
    {
      'title': 'Power Yoga',
      'day': 'Tuesday',
      'time': '5:30 PM - 6:30 PM',
      'type': 'Yoga',
      'students': 10,
      'recurring': true,
      'location': 'Studio A'
    },
    {
      'title': 'Breathwork for Anxiety',
      'day': 'Wednesday',
      'time': '12:00 PM - 12:45 PM',
      'type': 'Breathing',
      'students': 6,
      'recurring': true,
      'location': 'Studio B'
    },
    {
      'title': 'Gentle Yoga',
      'day': 'Thursday',
      'time': '9:00 AM - 10:00 AM',
      'type': 'Yoga',
      'students': 8,
      'recurring': true,
      'location': 'Studio A'
    },
    {
      'title': 'Deep Meditation',
      'day': 'Friday',
      'time': '7:00 PM - 8:00 PM',
      'type': 'Meditation',
      'students': 15,
      'recurring': true,
      'location': 'Studio B'
    },
    {
      'title': 'Weekend Warrior Flow',
      'day': 'Saturday',
      'time': '10:00 AM - 11:15 AM',
      'type': 'Yoga',
      'students': 20,
      'recurring': true,
      'location': 'Studio A'
    },
    {
      'title': 'Mindfulness Session',
      'day': 'Sunday',
      'time': '4:00 PM - 5:00 PM',
      'type': 'Meditation',
      'students': 12,
      'recurring': true,
      'location': 'Studio B'
    },
  ];
  
  // Private sessions (one-time appointments)
  final List<Map<String, dynamic>> privateSessions = [
    {
      'title': 'Private Yoga',
      'client': 'Sarah Johnson',
      'date': '2025-04-02',
      'time': '2:00 PM - 3:00 PM',
      'type': 'Yoga',
      'location': 'Studio C',
      'notes': 'Focus on flexibility'
    },
    {
      'title': 'Private Meditation',
      'client': 'Michael Roberts',
      'date': '2025-04-05',
      'time': '11:00 AM - 12:00 PM',
      'type': 'Meditation',
      'location': 'Studio C',
      'notes': 'Beginner session'
    },
    {
      'title': 'Private Breathwork',
      'client': 'Lisa Chen',
      'date': '2025-04-10',
      'time': '4:30 PM - 5:30 PM',
      'type': 'Breathing',
      'location': 'Studio C',
      'notes': 'Anxiety management'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Class Schedule',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF634FBD),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Add new class
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Add new class would open here'))
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Calendar header
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFF634FBD),
            child: Column(
              children: [
                // Month and year
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, _selectedDate.day);
                        });
                      },
                    ),
                    Text(
                      _getMonthYearText(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, _selectedDate.day);
                        });
                      },
                    ),
                  ],
                ),
                
                SizedBox(height: 16),
                
                // Week days
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildWeekDay('Mon', 1),
                    _buildWeekDay('Tue', 2),
                    _buildWeekDay('Wed', 3),
                    _buildWeekDay('Thu', 4),
                    _buildWeekDay('Fri', 5),
                    _buildWeekDay('Sat', 6),
                    _buildWeekDay('Sun', 7),
                  ],
                ),
              ],
            ),
          ),
          
          // View tabs (Week/Month)
          Container(
            color: Color(0xFF634FBD).withOpacity(0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  _buildViewTab(0, "Week View"),
                  SizedBox(width: 16),
                  _buildViewTab(1, "Month View"),
                  Spacer(),
                  // Edit Schedule Button
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Edit schedule would open here'))
                      );
                    },
                    icon: Icon(Icons.edit, size: 16),
                    label: Text("Edit Schedule"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF634FBD),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Schedule content based on selected tab
          Expanded(
            child: _selectedViewTab == 0 ? _buildWeekView() : _buildMonthView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new class or appointment
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Add new class or session would open here'))
          );
        },
        backgroundColor: Color(0xFF634FBD),
        child: Icon(Icons.add),
      ),
    );
  }
  
  // Helper to format month and year text
  String _getMonthYearText() {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[_selectedDate.month - 1]} ${_selectedDate.year}';
  }
  
  // Weekday widget
  Widget _buildWeekDay(String day, int weekday) {
    // Check if this weekday matches the selected date's weekday
    bool isSelected = DateTime.now().weekday == weekday;
    
    return Container(
      width: 40,
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.white : Colors.transparent,
            ),
            child: Center(
              child: Text(
                _getDayNumberForWeekday(weekday).toString(),
                style: TextStyle(
                  color: isSelected ? Color(0xFF634FBD) : Colors.white,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Get day number for a specific weekday in the current week
  int _getDayNumberForWeekday(int weekday) {
    final now = DateTime.now();
    final difference = weekday - now.weekday;
    final date = now.add(Duration(days: difference));
    return date.day;
  }
  
  // View tab widget
  Widget _buildViewTab(int index, String title) {
    bool isSelected = _selectedViewTab == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedViewTab = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Color(0xFF634FBD) : Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
  
  // Week view content
  Widget _buildWeekView() {
    // Group classes by day
    Map<String, List<Map<String, dynamic>>> classesByDay = {};
    for (var cls in classes) {
      final day = cls['day'];
      if (!classesByDay.containsKey(day)) {
        classesByDay[day] = [];
      }
      classesByDay[day]!.add(cls);
    }
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Classes section
          Text(
            "Regular Classes",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Days with classes
          ...classesByDay.entries.map((entry) => _buildDaySchedule(entry.key, entry.value)).toList(),
          
          SizedBox(height: 24),
          
          // Private sessions section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Private Sessions",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF634FBD),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Add private session would open here'))
                  );
                },
                icon: Icon(Icons.add, size: 16),
                label: Text("Add Session"),
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF634FBD),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          
          // Private sessions list
          ...privateSessions.map((session) => _buildPrivateSession(session)).toList(),
        ],
      ),
    );
  }
  
  // Day schedule widget
  Widget _buildDaySchedule(String day, List<Map<String, dynamic>> dayClasses) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day header
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _getDayIcon(day),
                  color: Color(0xFF634FBD),
                  size: 20,
                ),
                SizedBox(width: 8),
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF634FBD),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          
          // Classes for this day
          ...dayClasses.map((cls) => _buildClassItem(cls)).toList(),
        ],
      ),
    );
  }
  
  // Class item widget
  Widget _buildClassItem(Map<String, dynamic> cls) {
    IconData typeIcon;
    Color typeColor;
    
    switch (cls['type']) {
      case 'Yoga':
        typeIcon = Icons.self_improvement;
        typeColor = Colors.green;
        break;
      case 'Meditation':
        typeIcon = Icons.spa;
        typeColor = Color(0xFF634FBD);
        break;
      case 'Breathing':
        typeIcon = Icons.air;
        typeColor = Colors.blue;
        break;
      default:
        typeIcon = Icons.fitness_center;
        typeColor = Colors.orange;
    }
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Time column
          Container(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cls['time'].split(' - ')[0],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  cls['time'].split(' - ')[1],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          
          // Class type icon
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              typeIcon,
              color: typeColor,
              size: 20,
            ),
          ),
          SizedBox(width: 12),
          
          // Class info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cls['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 4),
                    Text(
                      cls['location'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.person,
                      size: 12,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${cls['students']}",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Edit button
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey.shade600,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Edit class options would open here'))
              );
            },
          ),
        ],
      ),
    );
  }
  
  // Private session widget
  Widget _buildPrivateSession(Map<String, dynamic> session) {
    IconData typeIcon;
    Color typeColor;
    
    switch (session['type']) {
      case 'Yoga':
        typeIcon = Icons.self_improvement;
        typeColor = Colors.green;
        break;
      case 'Meditation':
        typeIcon = Icons.spa;
        typeColor = Color(0xFF634FBD);
        break;
      case 'Breathing':
        typeIcon = Icons.air;
        typeColor = Colors.blue;
        break;
      default:
        typeIcon = Icons.fitness_center;
        typeColor = Colors.orange;
    }
    
    // Parse date
    final dateParts = session['date'].split('-');
    final date = DateTime(
      int.parse(dateParts[0]),
      int.parse(dateParts[1]),
      int.parse(dateParts[2]),
    );
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: typeColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: typeColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  typeIcon,
                  color: typeColor,
                  size: 24,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      session['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "with ${session['client']}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey.shade600,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Edit session would open here'))
                  );
                },
              ),
            ],
          ),
          
          SizedBox(height: 16),
          
          // Date and time
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                size: 16,
                color: Colors.grey.shade700,
              ),
              SizedBox(width: 8),
              Text(
                "${_getFormattedDate(date)}",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(width: 16),
              Icon(
                Icons.access_time,
                size: 16,
                color: Colors.grey.shade700,
              ),
              SizedBox(width: 8),
              Text(
                session['time'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8),
          
          // Location
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Colors.grey.shade700,
              ),
              SizedBox(width: 8),
              Text(
                session['location'],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12),
          
          // Notes
          if (session['notes'] != null && session['notes'].isNotEmpty)
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.notes,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      session['notes'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
  
  // Month view content
  Widget _buildMonthView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Calendar UI would go here - simplified for this example
            Container(
              height: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Month header
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFF634FBD).withOpacity(0.1),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: Center(
                      child: Text(
                        _getMonthYearText(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF634FBD),
                        ),
                      ),
                    ),
                  ),
                  
                  // Calendar grid - simplified placeholder
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(16),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),
                      itemCount: _getDaysInMonth(),
                      itemBuilder: (context, index) {
                        final day = index + 1;
                        final isToday = day == DateTime.now().day && 
                                       _selectedDate.month == DateTime.now().month &&
                                       _selectedDate.year == DateTime.now().year;
                        
                        // Check if day has classes
                        bool hasClasses = _dayHasClasses(day);
                        
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: isToday ? Color(0xFF634FBD) : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: hasClasses && !isToday
                                  ? Border.all(color: Color(0xFF634FBD))
                                  : null,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    day.toString(),
                                    style: TextStyle(
                                      fontWeight: isToday || hasClasses ? FontWeight.bold : FontWeight.normal,
                                      color: isToday ? Colors.white : hasClasses ? Color(0xFF634FBD) : Colors.black,
                                    ),
                                  ),
                                  if (hasClasses)
                                    Container(
                                      width: 4,
                                      height: 4,
                                      margin: EdgeInsets.only(top: 2),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isToday ? Colors.white : Color(0xFF634FBD),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            
            // Selected day schedule
            Text(
              "Schedule for ${_getFormattedDate(_selectedDate)}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF634FBD),
              ),
            ),
            SizedBox(height: 16),
            
            // Classes for selected day
            Expanded(
              child: _buildSelectedDayClasses(),
            ),
          ],
        ),
      ),
    );
  }
  
  // Classes for selected day in month view
  Widget _buildSelectedDayClasses() {
    // Get day of week for the selected date
    final dayOfWeek = _getDayOfWeek(_selectedDate.weekday);
    
    // Filter classes for the selected day
    final dayClasses = classes.where((cls) => cls['day'] == dayOfWeek).toList();
    
    // Filter private sessions for the selected date
    final dateSessions = privateSessions.where((session) {
      final dateParts = session['date'].split('-');
      final sessionDate = DateTime(
        int.parse(dateParts[0]),
        int.parse(dateParts[1]),
        int.parse(dateParts[2]),
      );
      return sessionDate.year == _selectedDate.year &&
             sessionDate.month == _selectedDate.month &&
             sessionDate.day == _selectedDate.day;
    }).toList();
    
    if (dayClasses.isEmpty && dateSessions.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 48,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 16),
            Text(
              "No classes scheduled for this day",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Schedule class would open here'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text("Schedule Class"),
            ),
          ],
        ),
      );
    }
    
    return ListView(
      children: [
        if (dayClasses.isNotEmpty) ...[
          Text(
            "Regular Classes",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 8),
          ...dayClasses.map((cls) => _buildClassItem(cls)).toList(),
        ],
        
        if (dateSessions.isNotEmpty) ...[
          SizedBox(height: 16),
          Text(
            "Private Sessions",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.grey.shade800,
            ),
          ),
          SizedBox(height: 8),
          ...dateSessions.map((session) => _buildPrivateSession(session)).toList(),
        ],
      ],
    );}
  
  // Helper methods
  IconData _getDayIcon(String day) {
    switch (day) {
      case 'Monday':
        return Icons.looks_one;
      case 'Tuesday':
        return Icons.looks_two;
      case 'Wednesday':
        return Icons.looks_3;
      case 'Thursday':
        return Icons.looks_4;
      case 'Friday':
        return Icons.looks_5;
      case 'Saturday':
        return Icons.looks_6;
      case 'Sunday':
        return Icons.weekend;
      default:
        return Icons.calendar_today;
    }
  }
  
  // Format date as "Month Day, Year"
  String _getFormattedDate(DateTime date) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
  
  // Get number of days in the current month
  int _getDaysInMonth() {
    return DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
  }
  
  // Check if a day has any classes (simplified for demo)
  bool _dayHasClasses(int day) {
    // Simplified logic - just marking some days as having classes
    final weekday = DateTime(_selectedDate.year, _selectedDate.month, day).weekday;
    
    // Get day name for the weekday
    final dayName = _getDayOfWeek(weekday);
    
    // Check if there are regular classes for this day
    final hasRegularClasses = classes.any((cls) => cls['day'] == dayName);
    
    // Check if there are private sessions for this date
    final hasPrivateSession = privateSessions.any((session) {
      final dateParts = session['date'].split('-');
      return int.parse(dateParts[2]) == day && 
             int.parse(dateParts[1]) == _selectedDate.month &&
             int.parse(dateParts[0]) == _selectedDate.year;
    });
    
    return hasRegularClasses || hasPrivateSession;
  }
  
  // Convert weekday number to day name
  String _getDayOfWeek(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }
}
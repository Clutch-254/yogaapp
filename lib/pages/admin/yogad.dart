import 'package:flutter/material.dart';

class Yogad extends StatefulWidget {
  const Yogad({super.key});

  @override
  State<Yogad> createState() => _YogadState();
}

class _YogadState extends State<Yogad> {
  // Selected tab index
  int _selectedTabIndex = 0;
  
  // Selected filter
  String _selectedFilter = 'All';
  
  // Mock data for yoga classes
  final List<Map<String, dynamic>> yogaClasses = [
    {
      'title': 'Morning Vinyasa Flow',
      'description': 'Start your day with this energizing flow that connects breath with movement. Suitable for all levels.',
      'type': 'Virtual (Live)',
      'format': 'Live',
      'level': 'All Levels',
      'duration': '60 min',
      'instructor': 'Alex Johnson',
      'nextSession': 'Tomorrow, 7:30 AM',
      'studentsEnrolled': 18,
      'price': '\$20',
      'image': 'assets/yoga1.jpg',
      'isPopular': true,
    },
    {
      'title': 'Gentle Hatha Yoga',
      'description': 'A slow-paced class focusing on basic postures and breath awareness. Perfect for beginners and those seeking gentle practice.',
      'type': 'Physical',
      'format': 'In-Person',
      'level': 'Beginner',
      'duration': '45 min',
      'instructor': 'Maria Chen',
      'nextSession': 'Today, 5:30 PM',
      'location': 'Studio A',
      'studentsEnrolled': 12,
      'price': '\$25',
      'image': 'assets/yoga2.jpg',
      'isPopular': false,
    },
    {
      'title': 'Power Yoga',
      'description': 'Build strength and endurance in this dynamic, fast-paced yoga class that will challenge your body and mind.',
      'type': 'Virtual (Video)',
      'format': 'Recorded',
      'level': 'Intermediate',
      'duration': '75 min',
      'instructor': 'David Kim',
      'recordedDate': 'March 15, 2025',
      'downloads': 45,
      'price': '\$18',
      'image': 'assets/yoga3.jpg',
      'isPopular': true,
    },
    {
      'title': 'Yin Yoga for Relaxation',
      'description': 'Hold gentle poses for longer periods to target deep connective tissues and promote relaxation and stress relief.',
      'type': 'Virtual (Live)',
      'format': 'Live',
      'level': 'All Levels',
      'duration': '60 min',
      'instructor': 'Sarah Miller',
      'nextSession': 'Friday, 6:00 PM',
      'studentsEnrolled': 14,
      'price': '\$20',
      'image': 'assets/yoga4.jpg',
      'isPopular': false,
    },
    {
      'title': 'Yoga for Flexibility',
      'description': 'Focus on stretching tight muscles and increasing range of motion in this slow and deliberate practice.',
      'type': 'Physical',
      'format': 'In-Person',
      'level': 'All Levels',
      'duration': '50 min',
      'instructor': 'Michael Brown',
      'nextSession': 'Wednesday, 9:00 AM',
      'location': 'Studio B',
      'studentsEnrolled': 10,
      'price': '\$25',
      'image': 'assets/yoga5.jpg',
      'isPopular': true,
    },
    {
      'title': 'Restorative Yoga',
      'description': 'Use props to support your body in gentle poses held for extended periods to promote deep relaxation and healing.',
      'type': 'Virtual (Video)',
      'format': 'Recorded',
      'level': 'All Levels',
      'duration': '75 min',
      'instructor': 'Alex Johnson',
      'recordedDate': 'March 25, 2025',
      'downloads': 38,
      'price': '\$18',
      'image': 'assets/yoga6.jpg',
      'isPopular': false,
    },
    {
      'title': 'Ashtanga Primary Series',
      'description': 'A traditional sequence of poses linked by breath and movement. Builds strength, flexibility, and concentration.',
      'type': 'Physical',
      'format': 'In-Person',
      'level': 'Advanced',
      'duration': '90 min',
      'instructor': 'Lisa Wong',
      'nextSession': 'Saturday, 8:00 AM',
      'location': 'Studio A',
      'studentsEnrolled': 8,
      'price': '\$30',
      'image': 'assets/yoga7.jpg',
      'isPopular': false,
    },
  ];
  
  // Physical class requests
  final List<Map<String, dynamic>> classRequests = [
    {
      'id': 'REQ-001',
      'clientName': 'John Davis',
      'type': 'Private',
      'level': 'Beginner',
      'preferredDates': 'Weekday evenings or weekend mornings',
      'style': 'Hatha or Gentle Flow',
      'notes': 'Recovering from knee injury, need modifications',
      'status': 'Pending',
      'requestDate': 'March 29, 2025',
    },
    {
      'id': 'REQ-002',
      'clientName': 'Emma Wilson',
      'type': 'Group (5 people)',
      'level': 'Mixed levels',
      'preferredDates': 'Saturday afternoons',
      'style': 'Vinyasa Flow',
      'notes': 'Birthday celebration, looking for fun but challenging session',
      'status': 'Confirmed',
      'requestDate': 'March 27, 2025',
      'scheduledFor': 'April 5, 2025 - 2:00 PM',
    },
    {
      'id': 'REQ-003',
      'clientName': 'Corporate Wellness Ltd.',
      'type': 'Corporate (15-20 people)',
      'level': 'Beginner',
      'preferredDates': 'Weekdays during lunch (12-1 PM)',
      'style': 'Stress relief and desk yoga',
      'notes': 'Looking for ongoing weekly sessions at our office location',
      'status': 'Pending',
      'requestDate': 'March 25, 2025',
    },
  ];
  
  // Filter options
  final List<String> filters = ['All', 'Live', 'Recorded', 'Physical', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Yoga Classes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF634FBD),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifications would open here'))
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Profile would open here'))
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header with tabs
          Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            decoration: BoxDecoration(
              color: Color(0xFF634FBD),
            ),
            child: Column(
              children: [
                // Tabs
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildTab(0, "My Classes"),
                      _buildTab(1, "Class Requests"),
                      _buildTab(2, "Analytics"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Filters
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            color: Color(0xFF634FBD).withOpacity(0.1),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: filters.map((filter) => _buildFilterChip(filter)).toList(),
              ),
            ),
          ),
          
          // Content based on selected tab
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildClassesTab()
                : _selectedTabIndex == 1
                    ? _buildRequestsTab()
                    : _buildAnalyticsTab(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showActionMenu(context);
        },
        backgroundColor: Color(0xFF634FBD),
        icon: Icon(Icons.add),
        label: Text("Create"),
      ),
    );
  }
  
  // Tab widget
  Widget _buildTab(int index, String title) {
    bool isSelected = _selectedTabIndex == index;
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Color(0xFF634FBD) : Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
  
  // Filter chip
  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedFilter == label;
    
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedFilter = selected ? label : 'All';
          });
        },
        backgroundColor: Colors.white,
        selectedColor: Color(0xFF634FBD).withOpacity(0.2),
        checkmarkColor: Color(0xFF634FBD),
        labelStyle: TextStyle(
          color: isSelected ? Color(0xFF634FBD) : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
  
  // Classes tab content
  Widget _buildClassesTab() {
    // Filter classes
    List<Map<String, dynamic>> filteredClasses = yogaClasses;
    
    if (_selectedFilter == 'Live') {
      filteredClasses = yogaClasses.where((cls) => cls['format'] == 'Live').toList();
    } else if (_selectedFilter == 'Recorded') {
      filteredClasses = yogaClasses.where((cls) => cls['format'] == 'Recorded').toList();
    } else if (_selectedFilter == 'Physical') {
      filteredClasses = yogaClasses.where((cls) => cls['format'] == 'In-Person').toList();
    } else if (_selectedFilter == 'Requests') {
      return _buildRequestsTab();
    }
    
    if (filteredClasses.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.self_improvement,
              size: 64,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 16),
            Text(
              "No ${_selectedFilter.toLowerCase()} classes found",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _showActionMenu(context);
              },
              icon: Icon(Icons.add),
              label: Text("Create New Class"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
      );
    }
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats summary
          Row(
            children: [
              _buildStatCard(
                yogaClasses.where((cls) => cls['format'] == 'Live').length.toString(),
                "Live\nClasses"
              ),
              SizedBox(width: 12),
              _buildStatCard(
                yogaClasses.where((cls) => cls['format'] == 'Recorded').length.toString(),
                "Recorded\nClasses"
              ),
              SizedBox(width: 12),
              _buildStatCard(
                yogaClasses.where((cls) => cls['format'] == 'In-Person').length.toString(),
                "Physical\nClasses"
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Popular classes section
          Text(
            "Upcoming Live Classes",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Live classes horizontal list
          Container(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: yogaClasses.where((cls) => cls['format'] == 'Live').length,
              itemBuilder: (context, index) {
                final liveClasses = yogaClasses.where((cls) => cls['format'] == 'Live').toList();
                return _buildClassCard(liveClasses[index], true);
              },
            ),
          ),
          
          SizedBox(height: 24),
          
          // All classes section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Classes",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF634FBD),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  _showActionMenu(context);
                },
                icon: Icon(Icons.add, size: 16),
                label: Text("Create"),
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF634FBD),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          
          // All classes list
          ...filteredClasses.map((yogaClass) => _buildClassCard(yogaClass, false)).toList(),
        ],
      ),
    );
  }
  
  // Stat card
  Widget _buildStatCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
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
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF634FBD),
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
  
  // Class card
  Widget _buildClassCard(Map<String, dynamic> yogaClass, bool isHorizontal) {
    bool isVirtualLive = yogaClass['type'] == 'Virtual (Live)';
    bool isVirtualVideo = yogaClass['type'] == 'Virtual (Video)';
    bool isPhysical = yogaClass['type'] == 'Physical';
    
    if (isHorizontal) {
      return Container(
        width: 200,
        margin: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(
                      Icons.self_improvement,
                      size: 40,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  // Type badge
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: isVirtualLive 
                            ? Colors.red 
                            : isVirtualVideo 
                                ? Colors.blue 
                                : Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isVirtualLive 
                            ? "LIVE" 
                            : isVirtualVideo 
                                ? "VIDEO" 
                                : "STUDIO",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    yogaClass['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    yogaClass['nextSession'] ?? yogaClass['recordedDate'] ?? "No date",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4),
                      Text(
                        yogaClass['duration'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "${yogaClass['studentsEnrolled'] ?? yogaClass['downloads'] ?? 0}",
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
          ],
        ),
      );
    }
    
    // Vertical (full-width) card
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and type
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isVirtualLive 
                  ? Colors.red.withOpacity(0.1) 
                  : isVirtualVideo 
                      ? Colors.blue.withOpacity(0.1) 
                      : Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Icon(
                  isVirtualLive 
                      ? Icons.live_tv 
                      : isVirtualVideo 
                          ? Icons.videocam 
                          : Icons.location_on,
                  color: isVirtualLive 
                      ? Colors.red 
                      : isVirtualVideo 
                          ? Colors.blue 
                          : Colors.green,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        yogaClass['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        yogaClass['type'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      yogaClass['price'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF634FBD),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      yogaClass['level'],
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
          
          // Description
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              yogaClass['description'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          
          // Session info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isVirtualLive || isPhysical ? "Next Session" : "Recording Info",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 8),
                
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isVirtualLive 
                        ? Colors.red.withOpacity(0.05) 
                        : isVirtualVideo 
                            ? Colors.blue.withOpacity(0.05) 
                            : Colors.green.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isVirtualLive 
                          ? Colors.red.withOpacity(0.2) 
                          : isVirtualVideo 
                              ? Colors.blue.withOpacity(0.2) 
                              : Colors.green.withOpacity(0.2),
                    ),
                  ),
                  child: isVirtualVideo 
                      ? _buildRecordingInfo(yogaClass) 
                      : _buildSessionInfo(yogaClass),
                ),
              ],
            ),
          ),
          
          // Actions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {
                    _showEditClassDialog(yogaClass);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF634FBD),
                    side: BorderSide(color: Color(0xFF634FBD)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text("Edit"),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    isVirtualLive || isPhysical
                        ? _showManageSessionDialog(yogaClass)
                        : _showManageRecordingDialog(yogaClass);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF634FBD),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(isVirtualLive 
                      ? "Manage Live" 
                      : isVirtualVideo 
                          ? "Manage Video" 
                          : "Manage Class"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Session info widget
  Widget _buildSessionInfo(Map<String, dynamic> yogaClass) {
    bool isPhysical = yogaClass['type'] == 'Physical';
    
    return Row(
      children: [
        Icon(
          isPhysical ? Icons.location_on : Icons.live_tv,
          color: isPhysical ? Colors.green : Colors.red,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                yogaClass['nextSession'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                isPhysical 
                    ? "Location: ${yogaClass['location']}" 
                    : "Platform: Zoom (link will be sent to students)",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${yogaClass['studentsEnrolled']}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF634FBD),
              ),
            ),
            Text(
              "enrolled",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  // Recording info widget
  Widget _buildRecordingInfo(Map<String, dynamic> yogaClass) {
    return Row(
      children: [
        Icon(
          Icons.videocam,
          color: Colors.blue,
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recorded on ${yogaClass['recordedDate']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Available for download or streaming",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${yogaClass['downloads']}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF634FBD),
              ),
            ),
            Text(
              "downloads",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  // Requests tab content
  Widget _buildRequestsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stats summary
          Row(
            children: [
              _buildStatCard(
                classRequests.length.toString(),
                "Total\nRequests"
              ),
              SizedBox(width: 12),
              _buildStatCard(
                classRequests.where((req) => req['status'] == 'Pending').length.toString(),
                "Pending\nRequests"
              ),
              SizedBox(width: 12),
              _buildStatCard(
                classRequests.where((req) => req['status'] == 'Confirmed').length.toString(),
                "Confirmed\nRequests"
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Pending requests section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pending Requests",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF634FBD),
                ),
              ),
              IconButton(
                icon: Icon(Icons.filter_list, color: Color(0xFF634FBD)),
                onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Filter options would open here'))
                  );
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          
          // Pending requests list
          ...classRequests
              .where((req) => req['status'] == 'Pending')
              .map((request) => _buildRequestCard(request))
              .toList(),
          
          SizedBox(height: 24),
          
          // Confirmed requests section
          Text(
            "Confirmed Requests",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Confirmed requests list
          ...classRequests
              .where((req) => req['status'] == 'Confirmed')
              .map((request) => _buildRequestCard(request))
              .toList(),
          
          // Show message if no confirmed requests
          if (classRequests.where((req) => req['status'] == 'Confirmed').isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "No confirmed requests yet",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
  
  // Request card
  Widget _buildRequestCard(Map<String, dynamic> request) {
    bool isConfirmed = request['status'] == 'Confirmed';
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and status
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isConfirmed 
                  ? Colors.green.withOpacity(0.1) 
                  : Colors.amber.withOpacity(0.1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isConfirmed ? Colors.green : Colors.amber,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isConfirmed ? Icons.check : Icons.access_time,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Request from ${request['clientName']}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Request ID: ${request['id']}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isConfirmed ? Colors.green : Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    request['status'],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Request details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRequestDetail("Type", request['type']),
                SizedBox(height: 8),
                _buildRequestDetail("Level", request['level']),
                SizedBox(height: 8),
                _buildRequestDetail("Style", request['style']),
                SizedBox(height: 8),
                _buildRequestDetail("Preferred Dates", request['preferredDates']),
                SizedBox(height: 8),
                if (isConfirmed)
                  _buildRequestDetail("Scheduled For", request['scheduledFor'], isHighlighted: true),
                SizedBox(height: 8),
                _buildRequestDetail("Notes", request['notes']),
                SizedBox(height: 8),
                _buildRequestDetail("Request Date", request['requestDate']),
              ],
            ),
          ),
          
          // Actions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (!isConfirmed) ...[
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Message client would open here'))
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF634FBD),
                      side: BorderSide(color: Color(0xFF634FBD)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Message"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      _showScheduleSessionDialog(request);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF634FBD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Schedule"),
                  ),
                ] else ...[
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('View details would open here'))
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF634FBD),
                      side: BorderSide(color: Color(0xFF634FBD)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("View Details"),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Reschedule would open here'))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF634FBD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text("Reschedule"),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Request detail item
  Widget _buildRequestDetail(String label, String value, {bool isHighlighted = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label + ":",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: isHighlighted ? Color(0xFF634FBD) : Colors.black87,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
  
  // Analytics tab content
  Widget _buildAnalyticsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Earnings card
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Earnings Overview",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildEarningsItem("This Week", "\$320"),
                      _buildEarningsItem("This Month", "\$1,250"),
                      _buildEarningsItem("Last Month", "\$1,080"),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 160,
                    child: Center(
                      child: Text(
                        "Earnings chart would go here",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 24),
          
          // Class attendance
          Text(
            "Class Attendance",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAttendanceItem("Virtual Classes", "83%", Colors.blue),
                      _buildAttendanceItem("Physical Classes", "92%", Colors.green),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    "Most Popular Classes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildPopularClassStats("Morning Vinyasa Flow", 18, 85, true),
                  _buildPopularClassStats("Power Yoga", 15, 75, false),
                  _buildPopularClassStats("Yoga for Flexibility", 20, 65, false),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 24),
          
          // Student feedback
          Text(
            "Student Feedback",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color(0xFF634FBD),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          "4.8",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Average Rating",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  index < 4 ? Icons.star : Icons.star_half,
                                  color: Colors.amber,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "45 reviews",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  SizedBox(height: 16),
                  Text(
                    "Recent Feedback",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),
                  _buildFeedbackItem(
                    "Emma Wilson",
                    "The morning flow class was amazing! Just what I needed to start my day right. Alex's instructions are always clear and easy to follow.",
                    5,
                    "2 days ago",
                  ),
                  _buildFeedbackItem(
                    "Michael Roberts",
                    "Great virtual class. The only issue was some audio problems in the beginning, but it was quickly resolved.",
                    4,
                    "1 week ago",
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 16),
        ],
      ),
    );
  }
  
  // Earnings item
  Widget _buildEarningsItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF634FBD),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
  
  // Attendance item
  Widget _buildAttendanceItem(String label, String percentage, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
              width: 6,
            ),
          ),
          child: Center(
            child: Text(
              percentage,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Attendance Rate",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
  
  // Popular class stats
  Widget _buildPopularClassStats(String className, int students, int percentFull, bool isTop) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: isTop ? EdgeInsets.all(8) : null,
      decoration: isTop ? BoxDecoration(
        color: Color(0xFF634FBD).withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ) : null,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              className,
              style: TextStyle(
                fontWeight: isTop ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "$students students",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "$percentFull% capacity",
                  style: TextStyle(
                    fontSize: 14,
                    color: isTop ? Color(0xFF634FBD) : Colors.grey.shade700,
                    fontWeight: isTop ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: (120 * percentFull / 100),
                        decoration: BoxDecoration(
                          color: Color(0xFF634FBD),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Feedback item
  Widget _buildFeedbackItem(String name, String comment, int rating, String time) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    name.substring(0, 1),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            comment,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          if (name == "Michael Roberts") ...[
            SizedBox(height: 8),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Reply to feedback would open here'))
                    );
                  },
                  child: Text("Reply"),
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF634FBD),
                    padding: EdgeInsets.zero,
                    minimumSize: Size(50, 30),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textStyle: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (name != "Michael Roberts")
            Divider(height: 24),
        ],
      ),
    );
  }
  
  // Show create options menu
  void _showActionMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create New",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.live_tv,
                    color: Colors.red,
                  ),
                ),
                title: Text("Live Virtual Class"),
                subtitle: Text("Stream a live yoga session"),
                onTap: () {
                  Navigator.pop(context);
                  _showAddClassDialog('Virtual (Live)');
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.videocam,
                    color: Colors.blue,
                  ),
                ),
                title: Text("Upload Video Class"),
                subtitle: Text("Upload a pre-recorded yoga class"),
                onTap: () {
                  Navigator.pop(context);
                  _showAddClassDialog('Virtual (Video)');
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                ),
                title: Text("Physical Class"),
                subtitle: Text("Schedule an in-person yoga class"),
                onTap: () {
                  Navigator.pop(context);
                  _showAddClassDialog('Physical');
                },
              ),
            ],
          ),
        );
      },
    );
  }
  
  // Add class dialog
  void _showAddClassDialog(String classType) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New ${classType.split(" ")[0]} Class"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Class Title',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Level',
                    border: OutlineInputBorder(),
                  ),
                  items: ['All Levels', 'Beginner', 'Intermediate', 'Advanced']
                      .map((level) => DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          ))
                      .toList(),
                  onChanged: (value) {},
                  value: 'All Levels',
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Duration (e.g., 60 min)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                
                if (classType == 'Physical') ...[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Location',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
                
                if (classType == 'Virtual (Live)' || classType == 'Physical') ...[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Time',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.access_time),
                    ),
                  ),
                ],
                
                if (classType == 'Virtual (Video)') ...[
                  OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Video upload would open here'))
                      );
                    },
                    icon: Icon(Icons.upload_file),
                    label: Text("Upload Video File"),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF634FBD),
                      side: BorderSide(color: Color(0xFF634FBD)),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ],
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('New class added'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Add Class"),
            ),
          ],
        );
      },
    );
  }
  
  // Edit class dialog
  void _showEditClassDialog(Map<String, dynamic> yogaClass) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Class"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Class Title',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: yogaClass['title']),
                ),
                SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: yogaClass['description']),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Level',
                    border: OutlineInputBorder(),
                  ),
                  items: ['All Levels', 'Beginner', 'Intermediate', 'Advanced']
                      .map((level) => DropdownMenuItem(
                            value: level,
                            child: Text(level),
                          ))
                      .toList(),
                  onChanged: (value) {},
                  value: yogaClass['level'],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: yogaClass['duration']),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: yogaClass['price']),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Class updated'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Save Changes"),
            ),
          ],
        );
      },
    );
  }
  
  // Manage live/physical session dialog
  void _showManageSessionDialog(Map<String, dynamic> yogaClass) {
    bool isPhysical = yogaClass['type'] == 'Physical';
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isPhysical ? "Manage Physical Class" : "Manage Live Class"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  yogaClass['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                
                Text(
                  "Current Schedule",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                 padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isPhysical 
                        ? Colors.green.withOpacity(0.1) 
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isPhysical 
                          ? Colors.green.withOpacity(0.3) 
                          : Colors.red.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isPhysical ? Icons.location_on : Icons.live_tv,
                        color: isPhysical ? Colors.green : Colors.red,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              yogaClass['nextSession'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              isPhysical 
                                  ? "Location: ${yogaClass['location']}" 
                                  : "Platform: Zoom",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 24),
                
                Text(
                  "Actions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.event,
                    color: Color(0xFF634FBD),
                  ),
                  title: Text("Reschedule"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Reschedule would open here'))
                    );
                    Navigator.pop(context);
                  },
                ),
                
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.people,
                    color: Color(0xFF634FBD),
                  ),
                  title: Text("Manage Students"),
                  subtitle: Text("${yogaClass['studentsEnrolled']} enrolled"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Student management would open here'))
                    );
                    Navigator.pop(context);
                  },
                ),
                
                if (!isPhysical)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.settings,
                      color: Color(0xFF634FBD),
                    ),
                    title: Text("Stream Settings"),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Stream settings would open here'))
                      );
                      Navigator.pop(context);
                    },
                  ),
                
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  title: Text("Cancel Class"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Cancel confirmation would open here'))
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
            if (!isPhysical)
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Starting live session...'))
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text("Start Live Now"),
              ),
          ],
        );
      },
    );
  }
  
  // Manage recording dialog
  void _showManageRecordingDialog(Map<String, dynamic> yogaClass) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Manage Video Class"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  yogaClass['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                
                Text(
                  "Video Information",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.blue.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.videocam,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recorded on ${yogaClass['recordedDate']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "${yogaClass['downloads']} downloads",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                SizedBox(height: 24),
                
                Text(
                  "Actions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.play_circle_outline,
                    color: Color(0xFF634FBD),
                  ),
                  title: Text("Preview Video"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Video preview would open here'))
                    );
                    Navigator.pop(context);
                  },
                ),
                
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.upload,
                    color: Color(0xFF634FBD),
                  ),
                  title: Text("Replace Video"),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Upload new video would open here'))
                    );
                    Navigator.pop(context);
                  },
                ),
                
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.settings,
                    color: Color(0xFF634FBD),
                  ),
                  title: Text("Video Settings"),
                  subtitle: Text("Privacy, thumbnails, etc."),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Video settings would open here'))
                    );
                    Navigator.pop(context);
                  },
                ),
                
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(
                    Icons.analytics,
                    color: Color(0xFF634FBD),
                  ),
                  title: Text("Analytics"),
                  subtitle: Text("Views, engagement, etc."),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Video analytics would open here'))
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Close"),
            ),
          ],
        );
      },
    );
  }
  
  // Schedule session for request dialog
  void _showScheduleSessionDialog(Map<String, dynamic> request) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Schedule Session"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Request from ${request['clientName']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Preferred: ${request['preferredDates']}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 16),
                
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Time',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.access_time),
                  ),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Location',
                    border: OutlineInputBorder(),
                  ),
                  items: ['Studio A', 'Studio B', 'Client Location', 'Other']
                      .map((loc) => DropdownMenuItem(
                            value: loc,
                            child: Text(loc),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Notes to Client',
                    border: OutlineInputBorder(),
                    hintText: 'Include any special instructions...',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Class scheduled successfully!'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Schedule & Notify"),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

class Meditationad extends StatefulWidget {
  const Meditationad({super.key});

  @override
  State<Meditationad> createState() => _MeditationadState();
}

class _MeditationadState extends State<Meditationad> {
  // Selected tab index
  int _selectedTabIndex = 0;
  
  // Selected class type filter
  String _selectedClassType = 'All';
  
  // Mock data for meditation classes
  final List<Map<String, dynamic>> meditationClasses = [
    {
      'title': 'Mindfulness Meditation',
      'description': 'Learn to be present in the moment and develop awareness of your thoughts and feelings without judgment.',
      'duration': '45 min',
      'level': 'Beginner',
      'isPhysical': true,
      'isVirtual': true,
      'instructor': 'Alex Johnson',
      'price': '\$25',
      'rating': 4.8,
      'upcoming': [
        {'date': 'Mon, Apr 7', 'time': '9:00 AM', 'type': 'Physical', 'location': 'Studio A'},
        {'date': 'Wed, Apr 9', 'time': '6:00 PM', 'type': 'Virtual', 'location': 'Zoom'},
      ],
      'image': 'assets/meditation1.jpg',
    },
    {
      'title': 'Breath Awareness',
      'description': 'Focus on your breath to calm the mind, reduce stress, and increase concentration. Perfect for beginners.',
      'duration': '30 min',
      'level': 'Beginner',
      'isPhysical': true,
      'isVirtual': true,
      'instructor': 'Alex Johnson',
      'price': '\$20',
      'rating': 4.7,
      'upcoming': [
        {'date': 'Tue, Apr 8', 'time': '7:30 AM', 'type': 'Physical', 'location': 'Studio B'},
        {'date': 'Thu, Apr 10', 'time': '5:30 PM', 'type': 'Virtual', 'location': 'Zoom'},
      ],
      'image': 'assets/meditation2.jpg',
    },
    {
      'title': 'Loving-Kindness Meditation',
      'description': 'Cultivate feelings of love, kindness, and compassion for yourself and others. Strengthen positive emotions.',
      'duration': '40 min',
      'level': 'Intermediate',
      'isPhysical': true,
      'isVirtual': false,
      'instructor': 'Alex Johnson',
      'price': '\$30',
      'rating': 4.9,
      'upcoming': [
        {'date': 'Fri, Apr 11', 'time': '6:00 PM', 'type': 'Physical', 'location': 'Studio A'},
      ],
      'image': 'assets/meditation3.jpg',
    },
    {
      'title': 'Body Scan Meditation',
      'description': 'Systematically focus attention on different parts of your body, from feet to head, to develop awareness and relaxation.',
      'duration': '35 min',
      'level': 'Beginner',
      'isPhysical': false,
      'isVirtual': true,
      'instructor': 'Alex Johnson',
      'price': '\$22',
      'rating': 4.6,
      'upcoming': [
        {'date': 'Sat, Apr 12', 'time': '10:00 AM', 'type': 'Virtual', 'location': 'Zoom'},
      ],
      'image': 'assets/meditation4.jpg',
    },
    {
      'title': 'Mantra Meditation',
      'description': 'Use repetitive sounds, words or phrases to clear the mind and deepen concentration and awareness.',
      'duration': '50 min',
      'level': 'Intermediate',
      'isPhysical': true,
      'isVirtual': true,
      'instructor': 'Alex Johnson',
      'price': '\$28',
      'rating': 4.8,
      'upcoming': [
        {'date': 'Sun, Apr 13', 'time': '9:00 AM', 'type': 'Physical', 'location': 'Studio C'},
        {'date': 'Mon, Apr 14', 'time': '7:00 PM', 'type': 'Virtual', 'location': 'Zoom'},
      ],
      'image': 'assets/meditation5.jpg',
    },
    {
      'title': 'Chakra Meditation',
      'description': 'Focus on the seven chakras (energy centers) in the body to promote physical, mental, and spiritual balance.',
      'duration': '60 min',
      'level': 'Advanced',
      'isPhysical': true,
      'isVirtual': false,
      'instructor': 'Alex Johnson',
      'price': '\$35',
      'rating': 4.9,
      'upcoming': [
        {'date': 'Tue, Apr 15', 'time': '6:30 PM', 'type': 'Physical', 'location': 'Studio A'},
      ],
      'image': 'assets/meditation6.jpg',
    },
    {
      'title': 'Transcendental Meditation',
      'description': 'Silently repeat a personally assigned mantra to achieve a state of relaxed awareness and deep rest.',
      'duration': '45 min',
      'level': 'Advanced',
      'isPhysical': false,
      'isVirtual': true,
      'instructor': 'Alex Johnson',
      'price': '\$30',
      'rating': 4.7,
      'upcoming': [
        {'date': 'Wed, Apr 16', 'time': '8:00 PM', 'type': 'Virtual', 'location': 'Zoom'},
      ],
      'image': 'assets/meditation7.jpg',
    },
  ];
  
  // Filter options
  final List<String> classTypes = [
    'All',
    'Physical',
    'Virtual',
    'Beginner',
    'Intermediate',
    'Advanced'
  ];
  
  // Virtual session tools
  final List<Map<String, dynamic>> virtualTools = [
    {
      'title': 'Zoom',
      'description': 'Video conferencing for virtual meditation sessions',
      'icon': Icons.video_call,
    },
    {
      'title': 'Meditation Timer',
      'description': 'Customizable timer with gentle sounds',
      'icon': Icons.timer,
    },
    {
      'title': 'Ambient Sounds',
      'description': 'Nature sounds and ambient music for sessions',
      'icon': Icons.music_note,
    },
    {
      'title': 'Session Recording',
      'description': 'Record sessions for students to reuse later',
      'icon': Icons.record_voice_over,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meditation Classes',
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
            icon: Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Settings would open here'))
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Header section with tabs
          Container(
            padding: EdgeInsets.only(top: 16, bottom: 16),
            decoration: BoxDecoration(
              color: Color(0xFF634FBD),
            ),
            child: Column(
              children: [
                // Tabs for meditation views
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildTab(0, "My Classes"),
                      _buildTab(1, "Virtual Tools"),
                      _buildTab(2, "Resources"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Filter chips for class types
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            color: Color(0xFF634FBD).withOpacity(0.1),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: classTypes.map((type) => _buildFilterChip(type)).toList(),
              ),
            ),
          ),
          
          // Main content based on selected tab
          Expanded(
            child: _selectedTabIndex == 0
                ? _buildClassesContent()
                : _selectedTabIndex == 1
                    ? _buildVirtualToolsContent()
                    : _buildResourcesContent(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddClassDialog();
        },
        backgroundColor: Color(0xFF634FBD),
        child: Icon(Icons.add),
        tooltip: 'Add New Class',
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
  
  // Filter chip widget
  Widget _buildFilterChip(String label) {
    bool isSelected = _selectedClassType == label;
    
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedClassType = selected ? label : 'All';
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
  
  // Classes content
  Widget _buildClassesContent() {
    // Filter classes based on selected type
    List<Map<String, dynamic>> filteredClasses = meditationClasses;
    
    if (_selectedClassType == 'Physical') {
      filteredClasses = meditationClasses.where((cls) => cls['isPhysical']).toList();
    } else if (_selectedClassType == 'Virtual') {
      filteredClasses = meditationClasses.where((cls) => cls['isVirtual']).toList();
    } else if (_selectedClassType == 'Beginner' || 
               _selectedClassType == 'Intermediate' || 
               _selectedClassType == 'Advanced') {
      filteredClasses = meditationClasses.where((cls) => cls['level'] == _selectedClassType).toList();
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
              "No ${_selectedClassType.toLowerCase()} meditation classes found",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                _showAddClassDialog();
              },
              icon: Icon(Icons.add),
              label: Text("Add New Class"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredClasses.length,
      itemBuilder: (context, index) {
        return _buildClassCard(filteredClasses[index]);
      },
    );
  }
  
  // Meditation class card
  Widget _buildClassCard(Map<String, dynamic> meditationClass) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Class image placeholder with title overlay
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.self_improvement,
                    size: 60,
                    color: Colors.grey.shade500,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meditationClass['title'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.access_time, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              meditationClass['duration'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.bar_chart, color: Colors.white, size: 14),
                            SizedBox(width: 4),
                            Text(
                              meditationClass['level'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 12),
                            Icon(Icons.star, color: Colors.amber, size: 14),
                            SizedBox(width: 4),
                            Text(
                              "${meditationClass['rating']}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Class type badges
                Positioned(
                  top: 12,
                  right: 12,
                  child: Row(
                    children: [
                      if (meditationClass['isPhysical'])
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Physical",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      if (meditationClass['isVirtual'])
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Virtual",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Class description
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              meditationClass['description'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          
          // Upcoming sessions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upcoming Sessions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                ...meditationClass['upcoming'].map<Widget>((session) => 
                  _buildSessionItem(session)
                ).toList(),
              ],
            ),
          ),
          
          // Actions
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  meditationClass['price'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF634FBD),
                  ),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        _showEditClassDialog(meditationClass);
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Color(0xFF634FBD)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: Color(0xFF634FBD),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Add session would open here'))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF634FBD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text("Add Session"),
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
  
  // Session item
  Widget _buildSessionItem(Map<String, dynamic> session) {
    bool isVirtual = session['type'] == 'Virtual';
    
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: isVirtual ? Colors.blue.withOpacity(0.1) : Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isVirtual ? Colors.blue.withOpacity(0.3) : Colors.green.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            isVirtual ? Icons.videocam : Icons.location_on,
            size: 16,
            color: isVirtual ? Colors.blue : Colors.green,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${session['date']} at ${session['time']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  "${session['type']} • ${session['location']}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.grey.shade700),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'edit',
                child: Text('Edit Session'),
              ),
              PopupMenuItem(
                value: 'cancel',
                child: Text('Cancel Session'),
              ),
              if (isVirtual)
                PopupMenuItem(
                  value: 'link',
                  child: Text('Copy Meeting Link'),
                ),
            ],
            onSelected: (value) {
              if (value == 'edit') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Edit session would open here'))
                );
              } else if (value == 'cancel') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cancel session confirmation would open here'))
                );
              } else if (value == 'link') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Meeting link copied to clipboard'))
                );
              }
            },
          ),
        ],
      ),
    );
  }
  
  // Virtual tools content
  Widget _buildVirtualToolsContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tools section
          Text(
            "Virtual Session Tools",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Tools to enhance your virtual meditation classes",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 16),
          
          // Tools grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
            ),
            itemCount: virtualTools.length,
            itemBuilder: (context, index) {
              return _buildToolCard(virtualTools[index]);
            },
          ),
          
          SizedBox(height: 32),
          
          // Online platform section
          Text(
            "Online Platforms",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Platforms to host your virtual meditation sessions",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 16),
          
          // Platform options
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
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.videocam,
                          color: Colors.blue,
                          size: 24,
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Zoom Integration",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Connected",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Switch(
                        value: true,
                        onChanged: (value) {},
                        activeColor: Color(0xFF634FBD),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Your Zoom Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "alex.johnson@example.com",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 16),
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Zoom settings would open here'))
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF634FBD)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Manage Settings",
                      style: TextStyle(
                        color: Color(0xFF634FBD),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 16),
          
          // Add more platforms card
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
                    "Connect More Platforms",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Add more video conferencing platforms for your virtual sessions",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Add platform options would open here'))
                      );
                    },
                    icon: Icon(Icons.add),
                    label: Text("Add Platform"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF634FBD),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 32),
          
          // Virtual class tips
          Text(
            "Virtual Class Tips",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Tips
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
                  _buildTipItem(
                    "Test your equipment before class",
                    "Ensure your camera, microphone, and internet connection are working properly",
                    Icons.settings,
                  ),
                  Divider(),
                  _buildTipItem(
                    "Create a peaceful environment",
                    "Find a quiet, well-lit space without distractions",
                    Icons.home,
                  ),
                  Divider(),
                  _buildTipItem(
                    "Engage with participants",
                    "Check in with students and provide individual guidance",
                    Icons.people,
                  ),
                  Divider(),
                  _buildTipItem(
                    "Record sessions with permission",
                    "Allow students to revisit the practice later",
                    Icons.record_voice_over,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Tool card widget
  Widget _buildToolCard(Map<String, dynamic> tool) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${tool['title']} would open here'))
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                tool['icon'],
                size: 40,
                color: Color(0xFF634FBD),
              ),
              SizedBox(height: 12),
              Text(
                tool['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4),
              Text(
                tool['description'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Tip item widget
  Widget _buildTipItem(String title, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF634FBD).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Resources content
  Widget _buildResourcesContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Guided meditations section
          Text(
            "Guided Meditation Scripts",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Use these scripts for your meditation classes",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 16),
          
          // Scripts list
          _buildResourceCard(
            "Mindfulness Meditation",
            "10-minute mindfulness script focusing on breath awareness",
            Icons.description,
          ),
          _buildResourceCard(
            "Body Scan Meditation",
            "15-minute progressive relaxation from head to toe",
            Icons.description,
          ),
          _buildResourceCard(
            "Loving-Kindness Meditation",
            "20-minute script for developing compassion",
            Icons.description,
          ),
          
          SizedBox(height: 24),
          
          // Music section
          Text(
            "Meditation Music",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Royalty-free music tracks for your sessions",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 16),
          
          // Music tracks
          _buildMusicTrack("Peaceful Ambience", "5:30"),
          _buildMusicTrack("Ocean Waves", "10:15"),
          _buildMusicTrack("Forest Sounds", "8:45"),
          _buildMusicTrack("Gentle Piano", "7:20"),
          
          SizedBox(height: 24),
          
          // Marketing materials section
          Text(
            "Marketing Materials",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Templates to promote your meditation classes",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 16),
          
          // Marketing templates
          _buildResourceCard(
            "Social Media Templates",
            "Instagram and Facebook post templates for your classes",
            Icons.image,
          ),
          _buildResourceCard(
            "Email Announcements",
            "Email templates to notify students about upcoming classes",
            Icons.email,
          ),
          _buildResourceCard(
            "Class Flyer Templates",
            "Printable and digital flyers to promote your classes",
            Icons.article,
          ),
        ],
      ),
    );
  }
  
  // Resource card widget
  Widget _buildResourceCard(String title, String description, IconData icon) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF634FBD).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Color(0xFF634FBD),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade700,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.download, color: Color(0xFF634FBD)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Downloading $title'))
            );
          },
        ),
      ),
    );
  }
  
  // Music track widget
  Widget _buildMusicTrack(String title, String duration) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Color(0xFF634FBD),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          duration,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.add, color: Colors.grey.shade600),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add to playlist'))
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.download, color: Colors.grey.shade600),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Downloading $title'))
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  
  // Add class dialog
  void _showAddClassDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add New Meditation Class"),
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
                Text("Class Type", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text("Physical"),
                        value: true,
                        onChanged: (value) {},
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: Text("Virtual"),
                        value: true,
                        onChanged: (value) {},
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Duration (e.g., 45 min)',
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
  void _showEditClassDialog(Map<String, dynamic> meditationClass) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit ${meditationClass['title']}"),
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
                  controller: TextEditingController(text: meditationClass['title']),
                ),
                SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: meditationClass['description']),
                ),
                SizedBox(height: 16),
                Text("Class Type", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        title: Text("Physical"),
                        value: meditationClass['isPhysical'],
                        onChanged: (value) {},
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        title: Text("Virtual"),
                        value: meditationClass['isVirtual'],
                        onChanged: (value) {},
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: meditationClass['duration']),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  controller: TextEditingController(text: meditationClass['price']),
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
}
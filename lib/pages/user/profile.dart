import 'package:flutter/material.dart';
import 'dart:math'; // For random data generation

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Mock data - in a real app this would come from a data source
  final String userName = "Sarah Kinyua";
  final String userEmail = "sarahKinyua@g.com";
  final int minutesMeditated = 432;
  final int sessionsCompleted = 28;
  final int streakDays = 7;

  // Selected icon index
  int _selectedIconIndex = -1;

  // Selected analytics tab index
  int _selectedAnalyticsTab = 0;

  // Mock data for analytics
  final List<int> weeklyMinutes = [15, 22, 18, 30, 25, 40, 35];
  final List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  final List<Map<String, dynamic>> completedSessions = [
    {
      'name': 'Morning Flow',
      'date': 'Today, 7:30 AM',
      'duration': '20 min',
      'type': 'Yoga'
    },
    {
      'name': 'Deep Breathing',
      'date': 'Yesterday, 9:15 PM',
      'duration': '10 min',
      'type': 'Breathing'
    },
    {
      'name': 'Stress Relief',
      'date': 'Yesterday, 2:30 PM',
      'duration': '15 min',
      'type': 'Meditation'
    },
    {
      'name': 'Sleep Better',
      'date': '2 days ago, 10:00 PM',
      'duration': '30 min',
      'type': 'Meditation'
    },
    {
      'name': 'Power Yoga',
      'date': '3 days ago, 6:15 AM',
      'duration': '45 min',
      'type': 'Yoga'
    },
  ];

  final List<Map<String, dynamic>> milestones = [
    {
      'title': 'First Week Streak',
      'description': 'Practice for 7 consecutive days',
      'progress': 1.0,
      'reward': '100 points',
      'isCompleted': true
    },
    {
      'title': 'Flexibility Master',
      'description': 'Complete 5 flexibility sessions',
      'progress': 0.8,
      'reward': '200 points',
      'isCompleted': false
    },
    {
      'title': 'Morning Person',
      'description': 'Complete 10 sessions before 8 AM',
      'progress': 0.6,
      'reward': '150 points',
      'isCompleted': false
    },
    {
      'title': 'Meditation Explorer',
      'description': 'Try all meditation categories',
      'progress': 0.4,
      'reward': '250 points',
      'isCompleted': false
    },
  ];

  final List<Map<String, dynamic>> reminders = [
    {
      'time': '7:00 AM',
      'days': 'Mon, Wed, Fri',
      'title': 'Morning Yoga',
      'isActive': true
    },
    {
      'time': '6:30 PM',
      'days': 'Everyday',
      'title': 'Evening Meditation',
      'isActive': true
    },
    {
      'time': '9:00 PM',
      'days': 'Weekends',
      'title': 'Deep Relaxation',
      'isActive': false
    },
  ];

  // Add mock data for coaches
  final List<Map<String, dynamic>> myCoaches = [
    {
      'name': 'Alex Johnson',
      'specialization': 'Vinyasa Flow',
      'experience': '8 years',
      'rating': 4.9,
      'imageUrl': null, // Placeholder since we're not using real images
      'isFollowing': true,
    },
    {
      'name': 'Maria Chen',
      'specialization': 'Meditation & Mindfulness',
      'experience': '12 years',
      'rating': 4.8,
      'imageUrl': null,
      'isFollowing': true,
    },
    {
      'name': 'David Kim',
      'specialization': 'Power Yoga',
      'experience': '6 years',
      'rating': 4.7,
      'imageUrl': null,
      'isFollowing': true,
    },
    {
      'name': 'Priya Patel',
      'specialization': 'Hatha Yoga',
      'experience': '10 years',
      'rating': 4.9,
      'imageUrl': null,
      'isFollowing': true,
    },
    {
      'name': 'James Wilson',
      'specialization': 'Breathwork',
      'experience': '5 years',
      'rating': 4.6,
      'imageUrl': null,
      'isFollowing': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF634FBD),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications button press
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifications button pressed')),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings button press
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Settings button pressed')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile header section with image placeholder
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF634FBD), Color(0xFF8C7AE6)],
                ),
              ),
              child: Column(
                children: [
                  // Profile image placeholder
                  GestureDetector(
                    onTap: () {
                      // Placeholder for image selection functionality
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Image selection would go here')));
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              )
                            ],
                          ),
                          child: ClipOval(
                            child: Icon(
                              Icons.person,
                              size: 80,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Color(0xFF634FBD),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  // User name
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  // User email
                  Text(
                    userEmail,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Stats cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCard("Minutes", minutesMeditated.toString()),
                        _buildStatCard(
                            "Sessions", sessionsCompleted.toString()),
                        _buildStatCard("Streak", "$streakDays days"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // New content replacing settings sections
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Edit Profile and Activate YogAI buttons
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Edit profile functionality
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Edit Profile would open here')));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF634FBD),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Activate YogAI functionality
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('YogAI would activate here')));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Activate YogAI",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // Row of icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.camera_alt,
                            size: 30,
                            color: _selectedIconIndex == 0
                                ? Color(0xFF634FBD)
                                : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _selectedIconIndex = 0;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.bar_chart,
                            size: 30,
                            color: _selectedIconIndex == 1
                                ? Color(0xFF634FBD)
                                : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _selectedIconIndex = 1;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.music_note,
                            size: 30,
                            color: _selectedIconIndex == 2
                                ? Color(0xFF634FBD)
                                : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _selectedIconIndex = 2;
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.person,
                            size: 30,
                            color: _selectedIconIndex == 3
                                ? Color(0xFF634FBD)
                                : Colors.grey),
                        onPressed: () {
                          setState(() {
                            _selectedIconIndex = 3;
                          });
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Content based on selected icon
                  _buildSelectedContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build stat cards
  Widget _buildStatCard(String title, String value) {
    return Container(
      width: 90,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // Build content based on selected icon
  Widget _buildSelectedContent() {
    if (_selectedIconIndex == 0) {
      return _buildCameraContent();
    } else if (_selectedIconIndex == 1) {
      return _buildGraphContent();
    } else if (_selectedIconIndex == 2) {
      return _buildMusicContent(); // Use our new music content
    } else if (_selectedIconIndex == 3) {
      return _buildCoachesContent(); // Updated to show coaches instead of placeholder text
    } else {
      return Container(); // Nothing selected
    }
  }

  // Coaches content - new method for person icon
  Widget _buildCoachesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header with title and search button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Coaches",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF634FBD),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF634FBD),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Find Coaches",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        // Filter chips for categories
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterChip("All", isSelected: true),
              _buildFilterChip("Yoga"),
              _buildFilterChip("Meditation"),
              _buildFilterChip("Breathwork"),
              _buildFilterChip("Fitness"),
            ],
          ),
        ),

        SizedBox(height: 24),

        // Following section
        Text(
          "Coaches You Follow",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 16),

        // List of following coaches
        ...myCoaches
            .where((coach) => coach['isFollowing'] == true)
            .map((coach) => _buildCoachItem(coach))
            .toList(),

        SizedBox(height: 24),

        // Recommended section
        Text(
          "Recommended For You",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 16),

        // Recommendations - coaches you're not following yet
        ...myCoaches
            .where((coach) => coach['isFollowing'] == false)
            .map((coach) => _buildCoachItem(coach, isRecommended: true))
            .toList(),

        // If no non-following coaches, show a message
        if (myCoaches.where((coach) => coach['isFollowing'] == false).isEmpty)
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "No more recommendations at this time.\nCheck back later!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ),

        SizedBox(height: 30),

        // Find More Coaches button
        Container(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Find more coaches functionality
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Find more coaches would open here')));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF634FBD),
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Find More Coaches",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Helper method to build filter chips
  Widget _buildFilterChip(String label, {bool isSelected = false}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {
          // Would update filter selection in a real app
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Filter by $label would be applied')));
        },
        selectedColor: Color(0xFF634FBD).withOpacity(0.2),
        checkmarkColor: Color(0xFF634FBD),
        labelStyle: TextStyle(
          color: isSelected ? Color(0xFF634FBD) : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  // Helper method to build coach items
  Widget _buildCoachItem(Map<String, dynamic> coach,
      {bool isRecommended = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
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
      child: Row(
        children: [
          // Coach profile image
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              size: 40,
              color: Colors.grey.shade500,
            ),
          ),

          SizedBox(width: 16),

          // Coach info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      coach['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    if (isRecommended)
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "Recommended",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.green.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  coach['specialization'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${coach['rating']} · ${coach['experience']}",
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

          // Follow/Unfollow button
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: coach['isFollowing']
                  ? Color(0xFF634FBD).withOpacity(0.1)
                  : Color(0xFF634FBD),
            ),
            child: IconButton(
              icon: Icon(
                coach['isFollowing'] ? Icons.check : Icons.add,
                size: 20,
                color: coach['isFollowing'] ? Color(0xFF634FBD) : Colors.white,
              ),
              onPressed: () {
                // Toggle follow status would go here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(coach['isFollowing']
                        ? 'Unfollowed ${coach['name']}'
                        : 'Now following ${coach['name']}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Graph/Analytics content
  Widget _buildGraphContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Text(
          "Your Progress",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF634FBD),
          ),
        ),
        SizedBox(height: 20),

        // Analytics tabs
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              _buildAnalyticsTab(0, "Stats"),
              _buildAnalyticsTab(1, "Milestones"),
              _buildAnalyticsTab(2, "Reminders"),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Tab content
        _selectedAnalyticsTab == 0
            ? _buildStatsTabContent()
            : _selectedAnalyticsTab == 1
                ? _buildMilestonesTabContent()
                : _buildRemindersTabContent(),
      ],
    );
  }

  // Stats tab content - Daily streak section removed
  Widget _buildStatsTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Weekly progress
        _buildSectionTitle("Weekly Progress"),
        SizedBox(height: 16),

        // Bar chart
        Container(
          height: 200,
          padding: EdgeInsets.all(16),
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
          child: _buildBarChart(),
        ),

        SizedBox(height: 24),

        // Completed sessions
        _buildSectionTitle("Completed Sessions"),
        SizedBox(height: 16),

        // Session list
        Column(
          children: completedSessions
              .map((session) => _buildSessionItem(session))
              .toList(),
        ),
      ],
    );
  }

  // Milestones tab content
  Widget _buildMilestonesTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Achievements & Milestones"),
        SizedBox(height: 8),
        Text(
          "Complete milestones to earn rewards and track your yoga journey!",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 16),

        // Milestones list
        ...milestones
            .map((milestone) => _buildMilestoneItem(milestone))
            .toList(),

        SizedBox(height: 24),

        // Upcoming milestones
        _buildSectionTitle("Coming Soon"),
        SizedBox(height: 16),

        Container(
          padding: EdgeInsets.all(16),
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
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.emoji_events_outlined,
                  color: Colors.grey.shade400,
                  size: 30,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "30-Day Challenge",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Starting next month: Complete 30 days of continuous practice",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Reminders tab content
  Widget _buildRemindersTabContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("My Reminders"),
        SizedBox(height: 8),
        Text(
          "Set reminders to maintain your practice routine.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 16),

        // Reminders list
        ...reminders.map((reminder) => _buildReminderItem(reminder)).toList(),

        SizedBox(height: 20),

        // Add reminder button
        Container(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              // Add reminder functionality
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Add new reminder would open here')));
            },
            icon: Icon(Icons.add, color: Color(0xFF634FBD)),
            label: Text(
              "Add New Reminder",
              style: TextStyle(
                color: Color(0xFF634FBD),
                fontWeight: FontWeight.bold,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              side: BorderSide(color: Color(0xFF634FBD)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),

        SizedBox(height: 30),

        // Habit tracking
        _buildSectionTitle("Habit Tracking"),
        SizedBox(height: 16),

        Container(
          padding: EdgeInsets.all(16),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "April 2025",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF634FBD),
                ),
              ),
              SizedBox(height: 16),

              // Calendar grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 30, // Days in month
                itemBuilder: (context, index) {
                  // Random practice days for demo
                  bool practiced =
                      index < 19 && (index % 3 != 0 || index % 7 == 0);
                  return Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          practiced ? Color(0xFF634FBD) : Colors.grey.shade200,
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          color: practiced ? Colors.white : Colors.black87,
                          fontWeight:
                              practiced ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(height: 16),

              // Legend
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("Practice completed", style: TextStyle(fontSize: 12)),
                  SizedBox(width: 16),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text("No practice", style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Analytics tab selector
  Widget _buildAnalyticsTab(int index, String title) {
    bool isSelected = _selectedAnalyticsTab == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedAnalyticsTab = index;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: isSelected
              ? BoxDecoration(
                  color: Color(0xFF634FBD),
                  borderRadius: BorderRadius.circular(30),
                )
              : null,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // Bar chart for weekly progress
  Widget _buildBarChart() {
    double maxValue = weeklyMinutes.reduce(max).toDouble();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        weeklyMinutes.length,
        (index) {
          final value = weeklyMinutes[index];
          final percentage = value / maxValue;

          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "$value",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF634FBD),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  height: 150 * percentage,
                  width: 20,
                  decoration: BoxDecoration(
                    color: index == 6
                        ? Color(0xFF634FBD)
                        : Color(0xFF634FBD).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  weekDays[index],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Session item
  Widget _buildSessionItem(Map<String, dynamic> session) {
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

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
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
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              typeIcon,
              color: typeColor,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  session['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  session['date'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              session['duration'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Milestone item
  Widget _buildMilestoneItem(Map<String, dynamic> milestone) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: milestone['isCompleted']
                      ? Color(0xFF634FBD)
                      : Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  milestone['isCompleted']
                      ? Icons.emoji_events
                      : Icons.emoji_events_outlined,
                  color: milestone['isCompleted']
                      ? Colors.white
                      : Colors.grey.shade500,
                  size: 24,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      milestone['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      milestone['description'],
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                milestone['reward'],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Progress bar
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width *
                      0.7 *
                      milestone['progress'],
                  decoration: BoxDecoration(
                    color: Color(0xFF634FBD),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            milestone['isCompleted']
                ? "Completed!"
                : "${(milestone['progress'] * 100).toInt()}% completed",
            style: TextStyle(
              fontSize: 12,
              color: milestone['isCompleted']
                  ? Color(0xFF634FBD)
                  : Colors.grey.shade600,
              fontWeight: milestone['isCompleted']
                  ? FontWeight.bold
                  : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  // Reminder item
  Widget _buildReminderItem(Map<String, dynamic> reminder) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
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
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: reminder['isActive']
                  ? Color(0xFF634FBD).withOpacity(0.1)
                  : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.alarm,
              color: reminder['isActive'] ? Color(0xFF634FBD) : Colors.grey,
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  reminder['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "${reminder['time']} • ${reminder['days']}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: reminder['isActive'],
            onChanged: (value) {
              // In a real app, this would update the reminder's active state
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Reminder status would be updated here')));
            },
            activeColor: Color(0xFF634FBD),
          ),
        ],
      ),
    );
  }

  // Section title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  // Music content section
  Widget _buildMusicContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Music content header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Meditation Music",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF634FBD),
              ),
            ),
            // Search button
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF634FBD),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Find Music",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 24),

        // Categories section
        Text(
          "Categories",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),

        // Music categories
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildMusicCategory("Relaxation", Icons.spa, Colors.teal),
              _buildMusicCategory(
                  "Focus", Icons.center_focus_strong, Colors.blue),
              _buildMusicCategory(
                  "Sleep", Icons.nightlight_round, Colors.indigo),
              _buildMusicCategory("Nature", Icons.terrain, Colors.green),
              _buildMusicCategory("Ambient", Icons.waves, Colors.purple),
            ],
          ),
        ),

        SizedBox(height: 24),

        // Recently played section
        Text(
          "Recently Played",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),

        // Recently played tracks
        _buildMusicTrack("Deep Meditation", "10:30", "Relaxation", Icons.spa),
        _buildMusicTrack("Forest Ambience", "15:45", "Nature", Icons.terrain),
        _buildMusicTrack(
            "Ocean Waves", "20:00", "Sleep", Icons.nightlight_round),

        SizedBox(height: 24),

        // Recommended section
        Text(
          "Recommended For You",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),

        // Recommended playlists
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildMusicPlaylist("Morning Meditation", "5 tracks"),
              _buildMusicPlaylist("Focus & Concentration", "7 tracks"),
              _buildMusicPlaylist("Evening Wind Down", "4 tracks"),
              _buildMusicPlaylist("Yoga Flow", "8 tracks"),
            ],
          ),
        ),
      ],
    );
  }

  // Music category item
  Widget _buildMusicCategory(String title, IconData icon, Color color) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
            child: Icon(
              icon,
              size: 30,
              color: color,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Music track item
  Widget _buildMusicTrack(
      String title, String duration, String category, IconData categoryIcon) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Play button
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xFF634FBD),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 16),
          // Track info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      categoryIcon,
                      size: 14,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 4),
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Duration
          Text(
            duration,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  // Music playlist item
  Widget _buildMusicPlaylist(String title, String trackCount) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Playlist cover
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.music_note,
                  size: 50,
                  color: Colors.grey.shade500,
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF634FBD),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 2),
          Text(
            trackCount,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // Media grid for camera content
  Widget _buildCameraContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Camera content header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Yoga Journey",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF634FBD),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF634FBD),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Add New",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 16),

        // Stories row (like Instagram)
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildStoryItem("Day 1", true),
              _buildStoryItem("Week 1"),
              _buildStoryItem("Progress"),
              _buildStoryItem("Headstand"),
              _buildStoryItem("Sunset"),
              _buildStoryItem("Group"),
            ],
          ),
        ),

        SizedBox(height: 20),

        // Tabs for Posts and Reels (like IG/TikTok)
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF634FBD),
                      width: 2,
                    ),
                  ),
                ),
                child: Icon(
                  Icons.grid_on,
                  color: Color(0xFF634FBD),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: Icon(
                  Icons.movie_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 16),

        // Media grid (3 columns)
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: 12, // Show 12 placeholder items
          itemBuilder: (context, index) {
            return _buildMediaItem(index);
          },
        ),
      ],
    );
  }

  // Story item (circle with image and text)
  Widget _buildStoryItem(String title, [bool isHighlighted = false]) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isHighlighted ? Color(0xFF634FBD) : Colors.grey.shade300,
                width: 2,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Icon(
                  Icons.image,
                  color: Colors.grey.shade500,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // Media grid item
  Widget _buildMediaItem(int index) {
    bool isVideo = index % 4 == 0; // Every 4th item is a video

    return Container(
      color: Colors.grey.shade300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Placeholder for image/video
          Center(
            child: Icon(
              Icons.image,
              color: Colors.grey.shade500,
              size: 30,
            ),
          ),

          // Video indicator
          if (isVideo)
            Positioned(
              top: 8,
              right: 8,
              child: Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 20,
              ),
            ),

          // Likes indicator (for some items)
          if (index % 3 == 0)
            Positioned(
              bottom: 8,
              left: 8,
              child: Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(width: 2),
                  Text(
                    "${(index + 3) * 7}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

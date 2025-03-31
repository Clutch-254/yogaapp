
import 'package:flutter/material.dart';
import 'dart:math';

class Homecli extends StatefulWidget {
  const Homecli({super.key});

  @override
  State<Homecli> createState() => _HomecliState();
}

class _HomecliState extends State<Homecli> {
  // Selected tab index
  int _selectedIndex = 0;
  
  // Toggle for YogAI insights
  bool _showAIInsights = false;
  
  // Mock data for recent sessions
  final List<Map<String, dynamic>> recentSessions = [
    {
      'title': 'Morning Vinyasa Flow',
      'type': 'Recorded Video',
      'date': 'March 29, 2025',
      'duration': '45 min',
      'views': 128,
      'engagement': 0.86,
      'rating': 4.8,
    },
    {
      'title': 'Gentle Yoga for Beginners',
      'type': 'Live Session',
      'date': 'March 27, 2025',
      'duration': '60 min',
      'views': 75,
      'engagement': 0.92,
      'rating': 4.9,
    },
    {
      'title': 'Power Yoga Challenge',
      'type': 'Live Session',
      'date': 'March 25, 2025',
      'duration': '60 min',
      'views': 92,
      'engagement': 0.78,
      'rating': 4.7,
    },
    {
      'title': 'Breathwork for Stress',
      'type': 'Recorded Video',
      'date': 'March 23, 2025',
      'duration': '30 min',
      'views': 156,
      'engagement': 0.83,
      'rating': 4.6,
    },
  ];
  
  // Mock data for upcoming sessions
  final List<Map<String, dynamic>> upcomingSessions = [
    {
      'title': 'Deep Relaxation Evening Flow',
      'type': 'Live Session',
      'schedule': 'Tomorrow, 7:00 PM',
      'registrations': 32,
      'duration': '45 min',
    },
    {
      'title': 'Yoga for Back Pain',
      'type': 'Live Session',
      'schedule': 'April 3, 2025, 10:00 AM',
      'registrations': 18,
      'duration': '60 min',
    },
    {
      'title': 'Meditation & Mindfulness',
      'type': 'Live Session',
      'schedule': 'April 5, 2025, 8:00 AM',
      'registrations': 24,
      'duration': '30 min',
    },
  ];
  
  // Mock data for popular courses
  final List<Map<String, dynamic>> popularCourses = [
    {
      'title': '30-Day Yoga Challenge',
      'sessions': 30,
      'students': 245,
      'rating': 4.9,
      'completion': 0.68,
    },
    {
      'title': 'Foundations of Yoga',
      'sessions': 12,
      'students': 187,
      'rating': 4.8,
      'completion': 0.74,
    },
    {
      'title': 'Advanced Flexibility',
      'sessions': 8,
      'students': 103,
      'rating': 4.7,
      'completion': 0.52,
    },
  ];
  
  // Mock data for YogAI insights
  final List<Map<String, dynamic>> yogAIInsights = [
    {
      'title': 'User Retention Prediction',
      'description': 'Based on engagement patterns, 82% of active users are likely to continue subscriptions for the next 3 months.',
      'confidence': 0.87,
      'trend': 'positive',
      'action': 'Consider offering loyalty rewards to the 18% at risk of churning.',
    },
    {
      'title': 'Content Effectiveness',
      'description': 'Sessions focusing on stress relief and relaxation have 27% higher completion rates than other categories.',
      'confidence': 0.91,
      'trend': 'insight',
      'action': 'Consider adding more stress relief content to your catalog.',
    },
    {
      'title': 'Optimal Session Duration',
      'description': '45-minute sessions have the highest engagement. Sessions longer than 60 minutes show a 15% drop in completion.',
      'confidence': 0.85,
      'trend': 'insight',
      'action': 'Consider keeping new content between 30-45 minutes for maximum engagement.',
    },
    {
      'title': 'Seasonal Trend Detected',
      'description': 'Morning sessions gain 32% more attendees during spring/summer compared to evening sessions.',
      'confidence': 0.82,
      'trend': 'positive',
      'action': 'Consider adjusting your schedule to offer more morning classes in the coming months.',
    },
  ];
  
  // Mock weekly data for charts
  final List<int> weeklyViews = [240, 280, 320, 450, 380, 420, 520];
  final List<int> weeklySignups = [12, 18, 15, 24, 22, 30, 28];
  final List<double> weeklyEngagement = [0.72, 0.68, 0.75, 0.82, 0.80, 0.85, 0.83];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instructor Dashboard',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF634FBD),
        elevation: 0,
        actions: [
          // YogAI toggle
          Row(
            children: [
              Text(
                "YogAI Insights",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Switch(
                value: _showAIInsights,
                onChanged: (value) {
                  setState(() {
                    _showAIInsights = value;
                  });
                },
                activeColor: Colors.greenAccent,
                activeTrackColor: Colors.green.withOpacity(0.5),
              ),
            ],
          ),
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
      body: Row(
        children: [
          // Side navigation
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: Color(0xFF634FBD),
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Colors.white70),
            selectedLabelTextStyle: TextStyle(color: Colors.white),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: Text('Overview'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.video_library_outlined),
                selectedIcon: Icon(Icons.video_library),
                label: Text('Content'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.people_outline),
                selectedIcon: Icon(Icons.people),
                label: Text('Students'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bar_chart_outlined),
                selectedIcon: Icon(Icons.bar_chart),
                label: Text('Analytics'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          
          // Main content area
          Expanded(
            child: _buildSelectedView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showUploadOptions(context);
        },
        backgroundColor: Color(0xFF634FBD),
        icon: Icon(Icons.add),
        label: Text("Create"),
      ),
    );
  }
  
  // Build the selected view based on navigation index
  Widget _buildSelectedView() {
    switch (_selectedIndex) {
      case 0:
        return _buildOverviewTab();
      case 1:
        return _buildContentTab();
      case 2:
        return _buildStudentsTab();
      case 3:
        return _buildAnalyticsTab();
      case 4:
        return _buildSettingsTab();
      default:
        return _buildOverviewTab();
    }
  }
  
  // Overview tab content
  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome message & date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, Alex!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'March 31, 2025',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _showUploadOptions(context);
                },
                icon: Icon(Icons.add),
                label: Text("New Content"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF634FBD),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Stats cards
          Row(
            children: [
              _buildStatCard('Total Students', '528', Icons.people, Colors.blue),
              SizedBox(width: 16),
              _buildStatCard('This Week\'s Views', '1,248', Icons.visibility, Colors.purple),
              SizedBox(width: 16),
              _buildStatCard('Avg. Rating', '4.8', Icons.star, Colors.amber),
              SizedBox(width: 16),
              _buildStatCard('New Signups', '32', Icons.person_add, Colors.green),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Weekly performance chart
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
                    'Weekly Performance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 200,
                    child: _buildWeeklyChart(),
                  ),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 24),
          
          // Recent sessions
          Text(
            'Recent Sessions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Recent sessions list
          ...recentSessions.map((session) => _buildSessionCard(session)).toList(),
          
          SizedBox(height: 24),
          
          // Upcoming sessions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Upcoming Live Sessions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF634FBD),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  _scheduleNewSession();
                },
                icon: Icon(Icons.add, size: 16),
                label: Text("Schedule New"),
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF634FBD),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          
          // Upcoming sessions list
          ...upcomingSessions.map((session) => _buildUpcomingSessionCard(session)).toList(),
          
          // Display YogAI insights if enabled
          if (_showAIInsights) ...[
            SizedBox(height: 24),
            
            Row(
              children: [
                Icon(Icons.psychology, color: Colors.green, size: 24),
                SizedBox(width: 8),
                Text(
                  'YogAI Insights',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            
            // YogAI insights cards
            ...yogAIInsights.map((insight) => _buildInsightCard(insight)).toList(),
          ],
          
          SizedBox(height: 16),
        ],
      ),
    );
  }
  
  // Content tab with uploaded sessions, courses
  Widget _buildContentTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Content Library',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 24),
          
          // Content statistics
          Row(
            children: [
              _buildStatCard('Videos', '48', Icons.videocam, Colors.red),
              SizedBox(width: 16),
              _buildStatCard('Live Sessions', '24', Icons.live_tv, Colors.green),
              SizedBox(width: 16),
              _buildStatCard('Courses', '6', Icons.menu_book, Colors.amber),
              SizedBox(width: 16),
              _buildStatCard('Total Hours', '86', Icons.access_time, Colors.blue),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Content management options
          Row(
            children: [
              Expanded(
                child: _buildContentActionCard(
                  'Upload Video',
                  'Add a new pre-recorded session',
                  Icons.video_call,
                  Colors.orange,
                  () => _showUploadOptions(context),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildContentActionCard(
                  'Schedule Live',
                  'Create a new live session',
                  Icons.live_tv,
                  Colors.green,
                  () => _scheduleNewSession(),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildContentActionCard(
                  'Create Course',
                  'Bundle sessions into a course',
                  Icons.menu_book,
                  Colors.blue,
                  () => _createNewCourse(),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Recent content section
          Text(
            'Recent Content',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Recent sessions in grid view
          GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: recentSessions.map((session) => _buildContentGridItem(session)).toList(),
          ),
          
          SizedBox(height: 24),
          
          // Popular courses section
          Text(
            'Your Courses',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Courses list
          ...popularCourses.map((course) => _buildCourseCard(course)).toList(),
          
          SizedBox(height: 24),
        ],
      ),
    );
  }
  
  // Students tab
  Widget _buildStudentsTab() {
    // This would be filled with student management content
    return Center(
      child: Text(
        'Student Management Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
  
  // Analytics tab with detailed performance metrics
  Widget _buildAnalyticsTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Analytics',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Track engagement, popularity, and user feedback',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          
          SizedBox(height: 24),
          
          // Analytics dashboard cards
          Row(
            children: [
              Expanded(
                child: _buildAnalyticCard(
                  'User Engagement',
                  'Average session completion rate',
                  '78%',
                  Icons.timeline,
                  Colors.blue,
                  '+5% from last month',
                  true,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildAnalyticCard(
                  'Satisfaction Score',
                  'Based on user feedback',
                  '4.8',
                  Icons.thumb_up,
                  Colors.green,
                  'Steady',
                  true,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildAnalyticCard(
                  'User Retention',
                  'Students returning weekly',
                  '62%',
                  Icons.loop,
                  Colors.amber,
                  '+3% from last month',
                  true,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Analytics charts
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
                    'Session Popularity (Past 30 Days)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                  SizedBox(height: 24),
                  Container(
                    height: 250,
                    child: Center(
                      child: Text(
                        'Session popularity chart would render here',
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
          
          // Top performing content
          Text(
            'Top Performing Content',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          SizedBox(height: 16),
          
          // Top content table
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
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Title',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Views',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Engagement',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Rating',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 24),
                  ...recentSessions.map((session) => _buildContentTableRow(session)).toList(),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 24),
          
          // Feedback analysis
          Text(
            'Feedback Analysis',
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
                  Text(
                    'Common Themes in Student Feedback',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildFeedbackThemeItem('Clear instructions', 86, Colors.green),
                  SizedBox(height: 8),
                  _buildFeedbackThemeItem('Appropriate pace', 72, Colors.blue),
                  SizedBox(height: 8),
                  _buildFeedbackThemeItem('Helpful modifications', 65, Colors.purple),
                  SizedBox(height: 8),
                  _buildFeedbackThemeItem('Visual quality', 58, Colors.amber),
                  SizedBox(height: 8),
                  _buildFeedbackThemeItem('Audio quality', 52, Colors.orange),
                ],
              ),
            ),
          ),
          
          SizedBox(height: 24),
          
          // If YogAI is enabled, show predictive analytics
          if (_showAIInsights) ...[
            Row(
              children: [
                Icon(Icons.psychology, color: Colors.green, size: 24),
                SizedBox(width: 8),
                Text(
                  'YogAI Predictive Analytics',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
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
                    Text(
                      'Content Effectiveness Prediction',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24),
                    Container(
                      height: 250,
                      child: Center(
                        child: Text(
                          'AI prediction chart would render here',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Forecast: Based on current trends, meditation and stress relief content is predicted to see a 34% increase in engagement over the next 30 days. Consider creating more content in these categories.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          
          SizedBox(height: 16),
        ],
      ),
    );
  }
  
  // Settings tab
  Widget _buildSettingsTab() {
    // This would be filled with settings options
    return Center(
      child: Text(
        'Settings Tab',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
  
  // Stat card widget
  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Card(
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
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                  Icon(
                    icon,
                    color: color,
                    size: 20,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Weekly chart widget
  Widget _buildWeeklyChart() {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final maxViews = weeklyViews.reduce(max).toDouble();
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        7,
        (index) {
          final percentage = weeklyViews[index] / maxViews;
          
          return Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  weeklyViews[index].toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF634FBD),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 120 * percentage,
                  width: 16,
                  decoration: BoxDecoration(
                    color: Color(0xFF634FBD).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  days[index],
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
  
  // Session card
  Widget _buildSessionCard(Map<String, dynamic> session) {
    final bool isLive = session['type'] == 'Live Session';
    
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Thumbnail placeholder
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  isLive ? Icons.live_tv : Icons.videocam,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            SizedBox(width: 16),
            // Session info
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
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: isLive ? Colors.red : Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          session['type'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        session['date'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.access_time,
                        size: 12,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4),
                      Text(
                        session['duration'],
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
            // Stats
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.visibility,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${session['views']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${session['rating']}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  // Upcoming session card
  Widget _buildUpcomingSessionCard(Map<String, dynamic> session) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Status indicator
            Container(
              width: 6,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            SizedBox(width: 16),
            // Session info
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
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4),
                      Text(
                        session['schedule'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.grey.shade600,
                      ),
                      SizedBox(width: 4),
                      Text(
                        session['duration'],
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
            // Actions
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${session['registrations']} registered",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF634FBD),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, size: 18, color: Colors.grey.shade600),
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(4),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Edit session would open here'))
                        );
                      },
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.send, size: 18, color: Color(0xFF634FBD)),
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.all(4),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Send reminder would open here'))
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  // YogAI insight card
  Widget _buildInsightCard(Map<String, dynamic> insight) {
    IconData iconData;
    Color iconColor;
    
    if (insight['trend'] == 'positive') {
      iconData = Icons.trending_up;
      iconColor = Colors.green;
    } else if (insight['trend'] == 'negative') {
      iconData = Icons.trending_down;
      iconColor = Colors.red;
    } else {
      iconData = Icons.lightbulb_outline;
      iconColor = Colors.amber;
    }
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
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
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.psychology,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        insight['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            iconData,
                            size: 14,
                            color: iconColor,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "Confidence: ${(insight['confidence'] * 100).toInt()}%",
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
            SizedBox(height: 12),
            Text(
              insight['description'],
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.green.withOpacity(0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.lightbulb,
                    size: 16,
                    color: Colors.green,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Recommendation: ${insight['action']}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Content action card
  Widget _buildContentActionCard(String title, String description, IconData icon, Color color, Function onTap) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Grid item for content
  Widget _buildContentGridItem(Map<String, dynamic> content) {
    final bool isLive = content['type'] == 'Live Session';
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    isLive ? Icons.live_tv : Icons.videocam,
                    size: 40,
                    color: Colors.grey.shade500,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isLive ? Colors.red : Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      isLive ? "LIVE" : "VIDEO",
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
          // Content info
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content['title'],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      content['duration'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.visibility,
                          size: 12,
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "${content['views']}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
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
  
  // Course card
  Widget _buildCourseCard(Map<String, dynamic> course) {
    final int completionPercentage = (course['completion'] * 100).toInt();
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Course thumbnail
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Icon(
                  Icons.menu_book,
                  size: 40,
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(width: 16),
            // Course info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      _buildCourseInfoItem(Icons.video_library, "${course['sessions']} sessions"),
                      SizedBox(width: 16),
                      _buildCourseInfoItem(Icons.people, "${course['students']} students"),
                      SizedBox(width: 16),
                      _buildCourseInfoItem(Icons.star, "${course['rating']} rating"),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Completion Rate",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Stack(
                              children: [
                                Container(
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                Container(
                                  height: 6,
                                  width: 150.0 * course['completion'],
                                  decoration: BoxDecoration(
                                    color: Color(0xFF634FBD),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              "$completionPercentage%",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF634FBD),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('View course details would open here'))
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xFF634FBD),
                          side: BorderSide(color: Color(0xFF634FBD)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("View"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Course info item
  Widget _buildCourseInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: Colors.grey.shade600,
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
  
  // Analytics card
  Widget _buildAnalyticCard(String title, String subtitle, String value, IconData icon, Color color, String trend, bool isPositive) {
    return Card(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_flat,
                  size: 16,
                  color: isPositive ? Colors.green : Colors.grey.shade600,
                ),
                SizedBox(width: 4),
                Text(
                  trend,
                  style: TextStyle(
                    fontSize: 12,
                    color: isPositive ? Colors.green : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  // Content table row
  Widget _buildContentTableRow(Map<String, dynamic> session) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              session['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "${session['views']}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              "${(session['engagement'] * 100).toInt()}%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Text(
                  "${session['rating']}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.star,
                  size: 14,
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  // Feedback theme item
  Widget _buildFeedbackThemeItem(String theme, int percentage, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              theme,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              "$percentage%",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Stack(
          children: [
            Container(
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            Container(
              height: 6,
              width: (MediaQuery.of(context).size.width - 64) * percentage / 100,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  // Show upload options dialog
  void _showUploadOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create New Content",
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
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.videocam,
                    color: Colors.blue,
                  ),
                ),
                title: Text("Upload Video"),
                subtitle: Text("Upload pre-recorded content"),
                onTap: () {
                  Navigator.pop(context);
                  _uploadNewVideo();
                },
              ),
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
                title: Text("Schedule Live Session"),
                subtitle: Text("Set up a live streaming class"),
                onTap: () {
                  Navigator.pop(context);
                  _scheduleNewSession();
                },
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.menu_book,
                    color: Colors.amber,
                  ),
                ),
                title: Text("Create Course"),
                subtitle: Text("Organize content into a course"),
                onTap: () {
                  Navigator.pop(context);
                  _createNewCourse();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  
  // Upload new video function
  void _uploadNewVideo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Upload New Video"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Video Title',
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
                    labelText: 'Duration (e.g., 45 min)',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('File selection would open here'))
                    );
                  },
                  icon: Icon(Icons.file_upload),
                  label: Text("Select Video File"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF634FBD),
                    side: BorderSide(color: Color(0xFF634FBD)),
                    padding: EdgeInsets.symmetric(vertical: 12),
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
                  SnackBar(content: Text('Video uploading...'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Upload"),
            ),
          ],
        );
      },
    );
  }
  
  // Schedule new session function
  void _scheduleNewSession() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Schedule Live Session"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Session Title',
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
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Duration (e.g., 45 min)',
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
                  SnackBar(content: Text('Live session scheduled!'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Schedule"),
            ),
          ],
        );
      },
    );
  }
  
  // Create new course function
  void _createNewCourse() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Create New Course"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Course Title',
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
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  "Add Content to Course",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                ...recentSessions.map((session) => 
                  CheckboxListTile(
                    title: Text(session['title']),
                    subtitle: Text(session['type']),
                    value: false,
                    onChanged: (bool? value) {},
                  ),
                ).toList(),
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
                  SnackBar(content: Text('Course created successfully!'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Create Course"),
            ),
          ],
        );
      },
    );
  }
}
                    
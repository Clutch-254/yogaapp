import 'package:flutter/material.dart';

class Sleepuser extends StatefulWidget {
  const Sleepuser({super.key});

  @override
  State<Sleepuser> createState() => _SleepuserState();
}

class _SleepuserState extends State<Sleepuser>
    with SingleTickerProviderStateMixin {
  // Selected tab index
  int _selectedTabIndex = 0;
  late TabController _tabController;

  // Selected category filter
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Meditation', 'Stories', 'Sounds'];

  // Sleep stats for AI tracking
  final Map<String, dynamic> _sleepStats = {
    'averageDuration': 6.5,
    'deepSleepPercentage': 23,
    'sleepScore': 78,
    'lastWeekTrend': 'improving',
  };

  // Sleep meditations data
  final List<Map<String, dynamic>> _sleepMeditations = [
    {
      'title': 'Deep Sleep Meditation',
      'category': 'Meditation',
      'duration': '20 min',
      'instructor': 'Emma Williams',
      'description': 'Calm your mind and prepare for deep, restful sleep',
    },
    {
      'title': 'Anxiety Relief',
      'category': 'Meditation',
      'duration': '15 min',
      'instructor': 'David Patel',
      'description': 'Release tension and anxiety before bedtime',
    },
    {
      'title': 'Body Scan Relaxation',
      'category': 'Meditation',
      'duration': '25 min',
      'instructor': 'Sarah Chen',
      'description': 'Progressive relaxation technique for better sleep',
    },
    {
      'title': 'Gratitude Practice',
      'category': 'Meditation',
      'duration': '10 min',
      'instructor': 'Michael Chang',
      'description': 'End your day with positive thoughts and gratitude',
    },
  ];

  // Bedtime stories data
  final List<Map<String, dynamic>> _bedtimeStories = [
    {
      'title': 'The Enchanted Forest',
      'category': 'Stories',
      'duration': '22 min',
      'narrator': 'Lisa Rodriguez',
      'description': 'A magical journey through a peaceful forest',
    },
    {
      'title': 'Ocean Voyage',
      'category': 'Stories',
      'duration': '18 min',
      'narrator': 'Ryan Smith',
      'description': 'Sail across calm waters on a starlit night',
    },
    {
      'title': 'Mountain Cabin',
      'category': 'Stories',
      'duration': '25 min',
      'narrator': 'Alisha Patel',
      'description': 'A cozy evening in a peaceful mountain retreat',
    },
    {
      'title': 'Desert Oasis',
      'category': 'Stories',
      'duration': '20 min',
      'narrator': 'James Wilson',
      'description': 'Find tranquility in an ancient desert oasis',
    },
  ];

  // Sound therapy data
  final List<Map<String, dynamic>> _soundTherapies = [
    {
      'title': 'Gentle Rain',
      'category': 'Sounds',
      'duration': '60 min',
      'type': 'Nature',
      'description': 'Soothing rainfall on a quiet evening',
    },
    {
      'title': 'Ocean Waves',
      'category': 'Sounds',
      'duration': '45 min',
      'type': 'Nature',
      'description': 'Rhythmic waves breaking on a peaceful shore',
    },
    {
      'title': 'White Noise',
      'category': 'Sounds',
      'duration': '60 min',
      'type': 'Ambient',
      'description': 'Consistent sound masking for deep sleep',
    },
    {
      'title': 'Theta Waves',
      'category': 'Sounds',
      'duration': '30 min',
      'type': 'Binaural',
      'description': 'Binaural beats for enhanced relaxation and sleep',
    },
    {
      'title': 'Forest Sounds',
      'category': 'Sounds',
      'duration': '40 min',
      'type': 'Nature',
      'description': 'Gentle forest ambience with birds and breeze',
    },
    {
      'title': 'Delta Sleep',
      'category': 'Sounds',
      'duration': '45 min',
      'type': 'Binaural',
      'description': 'Binaural beats designed for deep sleep stages',
    },
  ];

  // Sleep programs categories
  final List<Map<String, dynamic>> _sleepPrograms = [
    {
      'title': 'Insomnia Relief',
      'icon': Icons.nightlight_round,
      'color': Color(0xFF5D4EBD),
      'days': 7,
    },
    {
      'title': 'Better Sleep',
      'icon': Icons.hotel,
      'color': Color(0xFF8973E3),
      'days': 14,
    },
    {
      'title': 'Sleep Anxiety',
      'icon': Icons.spa,
      'color': Color(0xFF5D4EBD),
      'days': 10,
    },
    {
      'title': 'Deep Relaxation',
      'icon': Icons.self_improvement,
      'color': Color(0xFF8973E3),
      'days': 21,
    },
    {
      'title': 'Mindful Evenings',
      'icon': Icons.nights_stay,
      'color': Color(0xFF5D4EBD),
      'days': 7,
    },
    {
      'title': 'Sleep Sounds',
      'icon': Icons.music_note,
      'color': Color(0xFF8973E3),
      'days': 30,
    },
  ];

  // Combine all items for the "Sleep Now" tab
  List<Map<String, dynamic>> get _allSleepItems {
    return [..._sleepMeditations, ..._bedtimeStories, ..._soundTherapies];
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Gradient app bar
          Container(
            padding:
                const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF5D4EBD), Color(0xFF8973E3)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sleep & Sound',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: IconButton(
                            icon: const Icon(Icons.analytics_outlined,
                                color: Colors.white),
                            onPressed: () {
                              _showAISleepInsights(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: IconButton(
                            icon: const Icon(Icons.search, color: Colors.white),
                            onPressed: () {
                              // Add search functionality
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Search for sleep content')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Tab bar
                TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelColor: Color(0xFF5D4EBD),
                  unselectedLabelColor: Colors.white.withOpacity(0.8),
                  tabs: const [
                    Tab(text: 'Sleep Now'),
                    Tab(text: 'Programs'),
                  ],
                ),
              ],
            ),
          ),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSleepNowTab(),
                _buildProgramsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sleep Now tab
  Widget _buildSleepNowTab() {
    // Filter items based on selected category
    List<Map<String, dynamic>> filteredItems = _selectedCategory == 'All'
        ? _allSleepItems
        : _allSleepItems
            .where((item) => item['category'] == _selectedCategory)
            .toList();

    return Column(
      children: [
        // AI Recommendation banner
        if (_selectedCategory == 'All')
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF5D4EBD).withOpacity(0.8),
                  Color(0xFF8973E3).withOpacity(0.8)
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.auto_awesome, color: Colors.white),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AI Recommendation',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Try "Deep Sleep Meditation" for better sleep tonight',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Playing Deep Sleep Meditation')),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    minimumSize: Size.zero,
                  ),
                  child: Text(
                    'Try Now',
                    style: TextStyle(
                      color: Color(0xFF5D4EBD),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

        // Category filters
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              bool isSelected = _categories[index] == _selectedCategory;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategory = _categories[index];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? Color(0xFF5D4EBD) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        // Sleep content list
        Expanded(
          child: filteredItems.isEmpty
              ? const Center(
                  child: Text(
                    'No content available for this category',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return _buildSleepItemCard(item);
                  },
                ),
        ),
      ],
    );
  }

  // Sleep item card
  Widget _buildSleepItemCard(Map<String, dynamic> item) {
    IconData itemIcon;
    Color categoryColor;

    switch (item['category']) {
      case 'Meditation':
        itemIcon = Icons.self_improvement;
        categoryColor = Colors.indigo;
        break;
      case 'Stories':
        itemIcon = Icons.auto_stories;
        categoryColor = Colors.purple;
        break;
      case 'Sounds':
        itemIcon = Icons.audio_file;
        categoryColor = Colors.blue;
        break;
      default:
        itemIcon = Icons.nightlight_round;
        categoryColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left circular container with icon
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: categoryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              itemIcon,
              size: 40,
              color: categoryColor,
            ),
          ),
          // Content details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category and duration
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: categoryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          item['category'],
                          style: TextStyle(
                            color: categoryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item['duration'],
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Title
                  Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Description or instructor/narrator
                  Text(
                    item['description'] ??
                        (item.containsKey('instructor')
                            ? 'Instructor: ${item['instructor']}'
                            : item.containsKey('narrator')
                                ? 'Narrator: ${item['narrator']}'
                                : 'Type: ${item['type']}'),
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // Play button
          Container(
            margin: const EdgeInsets.all(16),
            child: CircleAvatar(
              backgroundColor: Color(0xFF5D4EBD),
              radius: 24,
              child: IconButton(
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () {
                  // Play functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Playing ${item['title']}')),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Programs tab
  Widget _buildProgramsTab() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sleep Programs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5D4EBD),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Guided programs to help improve your sleep quality',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),

          // Programs grid
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: _sleepPrograms.length,
              itemBuilder: (context, index) {
                final program = _sleepPrograms[index];
                return _buildProgramCard(program);
              },
            ),
          ),
        ],
      ),
    );
  }

  // AI Sleep Insights Dialog
  void _showAISleepInsights(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(Icons.auto_awesome, color: Color(0xFF5D4EBD)),
              SizedBox(width: 8),
              Text('AI Sleep Insights',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF5D4EBD))),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sleep score card
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF5D4EBD), Color(0xFF8973E3)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text('${_sleepStats['sleepScore']}',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5D4EBD),
                            )),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Your Sleep Score',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text(
                                _sleepStats['lastWeekTrend'] == 'improving'
                                    ? '↗ Improving trend this week'
                                    : '↘ Declining trend this week',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.9))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(height: 16),

                // Sleep stats
                Row(
                  children: [
                    _buildStatItem(
                        Icons.timelapse,
                        '${_sleepStats['averageDuration']} hrs',
                        'Avg. Duration'),
                    SizedBox(width: 8),
                    _buildStatItem(Icons.nightlight,
                        '${_sleepStats['deepSleepPercentage']}%', 'Deep Sleep'),
                  ],
                ),

                SizedBox(height: 20),

                // AI Recommendations
                Text('YogAI Recommendations:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 8),
                _buildRecommendation(
                  'Based on your sleep patterns, try "Body Scan Relaxation" meditation tonight',
                  'Deep Sleep Meditation',
                ),
                SizedBox(height: 8),
                _buildRecommendation(
                  'Your sleep is disrupted at 2-3 AM. White noise may help with this.',
                  'White Noise',
                ),
                SizedBox(height: 8),
                _buildRecommendation(
                  'Consider the "Better Sleep" 14-day program to improve overall sleep quality',
                  'Better Sleep Program',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Close', style: TextStyle(color: Color(0xFF5D4EBD))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5D4EBD),
                foregroundColor: Colors.white,
              ),
              child: Text('Sleep Tracking'),
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Opening sleep tracking dashboard')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // Stat item widget
  Widget _buildStatItem(IconData icon, String value, String label) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF5D4EBD), size: 28),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(label,
                    style:
                        TextStyle(color: Colors.grey.shade600, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // AI recommendation widget
  Widget _buildRecommendation(String recommendation, String contentTitle) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(recommendation, style: TextStyle(fontSize: 13)),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Opening $contentTitle')),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child:
                    Text('Try Now', style: TextStyle(color: Color(0xFF5D4EBD))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Program card
  Widget _buildProgramCard(Map<String, dynamic> program) {
    return GestureDetector(
      onTap: () {
        // Show program details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Viewing ${program['title']} program')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Program icon
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: program['color'].withOpacity(0.2),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Icon(
                  program['icon'],
                  size: 50,
                  color: program['color'],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Program title
                  Text(
                    program['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Days count
                  Text(
                    '${program['days']}-day program',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Start button
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Start program functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Starting ${program['title']} program')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: program['color'],
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Start Program',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
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
}

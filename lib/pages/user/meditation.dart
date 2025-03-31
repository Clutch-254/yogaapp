
import 'package:flutter/material.dart';

class Meditation extends StatefulWidget {
  const Meditation({super.key});

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Stress Relief', 'Focus', 'Sleep', 'Relaxation'];
  String? _selectedMood;

  // Sample data
  final List<Map<String, dynamic>> _meditations = [
    {
      'title': 'Mindful Breathing',
      'category': 'Stress Relief',
      'duration': '10 min',
      'instructor': 'Sarah Chen',
      'description': 'Focus on your breath to calm your mind',
      'color': Colors.indigo,
      'icon': Icons.air,
    },
    {
      'title': 'Body Scan',
      'category': 'Relaxation',
      'duration': '15 min',
      'instructor': 'David Patel',
      'description': 'Release tension through body awareness',
      'color': Colors.teal,
      'icon': Icons.accessibility_new,
    },
    {
      'title': 'Deep Sleep',
      'category': 'Sleep',
      'duration': '20 min',
      'instructor': 'Emma Williams',
      'description': 'Gentle guidance into restful sleep',
      'color': Colors.deepPurple,
      'icon': Icons.nightlight_round,
    },
    {
      'title': 'Focused Mind',
      'category': 'Focus',
      'duration': '12 min',
      'instructor': 'Michael Chang',
      'description': 'Sharpen your concentration',
      'color': Colors.blue,
      'icon': Icons.center_focus_strong,
    },
  ];

  final List<Map<String, dynamic>> _quickExercises = [
    {
      'title': '1-Minute Breath',
      'duration': '1 min',
      'description': 'Quick breathing technique',
      'color': Colors.blueGrey,
      'icon': Icons.looks_one, // Using standard icon
    },
    {
      'title': '3-Minute Reset',
      'duration': '3 min',
      'description': 'Fast tension release',
      'color': Colors.purple,
      'icon': Icons.looks_3, // Using standard icon
    },
    {
      'title': '5-Minute Focus',
      'duration': '5 min',
      'description': 'Mental reset for stress',
      'color': Colors.lightBlue,
      'icon': Icons.looks_5, // Using standard icon
    },
  ];

  final List<Map<String, dynamic>> _moods = [
    {'name': 'Anxious', 'icon': Icons.sentiment_very_dissatisfied, 'color': Colors.redAccent},
    {'name': 'Stressed', 'icon': Icons.sentiment_dissatisfied, 'color': Colors.orangeAccent},
    {'name': 'Tired', 'icon': Icons.nights_stay, 'color': Colors.indigo},
    {'name': 'Calm', 'icon': Icons.sentiment_satisfied, 'color': Colors.green},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
          // Header
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7E57C2), Color(0xFF9575CD)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Meditation',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.local_fire_department, color: Colors.orange, size: 18),
                              SizedBox(width: 4),
                              Text('7 days', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white.withOpacity(0.3),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.search, size: 18, color: Colors.white),
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Search for meditations')),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                
                // Mood selector
                Text(
                  'How are you feeling today?',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 16),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _moods.length,
                    itemBuilder: (context, index) {
                      final mood = _moods[index];
                      final isSelected = _selectedMood == mood['name'];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMood = isSelected ? null : mood['name'] as String;
                          });
                        },
                        child: Container(
                          width: 70,
                          margin: const EdgeInsets.only(right: 12),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 28,
                                backgroundColor: isSelected 
                                    ? Colors.white 
                                    : Colors.white.withOpacity(0.2),
                                child: Icon(
                                  mood['icon'] as IconData,
                                  color: isSelected ? mood['color'] as Color : Colors.white,
                                  size: 26,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                mood['name'] as String,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                
                // Tab bar
                TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  labelColor: const Color(0xFF7E57C2),
                  unselectedLabelColor: Colors.white.withOpacity(0.8),
                  tabs: const [
                    Tab(text: 'Meditate'),
                    Tab(text: 'Quick Relief'),
                  ],
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildMeditateTab(),
                _buildQuickReliefTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Meditate tab
  Widget _buildMeditateTab() {
    // Filter based on category
    List<Map<String, dynamic>> filteredSessions = _selectedCategory == 'All'
        ? _meditations
        : _meditations.where((session) => session['category'] == _selectedCategory).toList();

    return Column(
      children: [
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
                    color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _categories[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        
        // Meditation list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filteredSessions.length,
            itemBuilder: (context, index) {
              final session = filteredSessions[index];
              return _buildMeditationCard(session);
            },
          ),
        ),
      ],
    );
  }

  // Quick Relief tab
  Widget _buildQuickReliefTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: _quickExercises.length,
      itemBuilder: (context, index) {
        final exercise = _quickExercises[index];
        return _buildQuickExerciseCard(exercise);
      },
    );
  }

  // Meditation card
  Widget _buildMeditationCard(Map<String, dynamic> meditation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Starting ${meditation['title']} meditation')),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Icon
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: (meditation['color'] as Color).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    meditation['icon'] as IconData,
                    color: meditation['color'] as Color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                // Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meditation['title'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        meditation['description'] as String,
                        style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            meditation['duration'] as String,
                            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '· ${meditation['instructor']}',
                            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Play button
                CircleAvatar(
                  radius: 18,
                  backgroundColor: (meditation['color'] as Color).withOpacity(0.1),
                  child: Icon(
                    Icons.play_arrow,
                    color: meditation['color'] as Color,
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Quick exercise card
  Widget _buildQuickExerciseCard(Map<String, dynamic> exercise) {
    return Container(
      decoration: BoxDecoration(
        color: (exercise['color'] as Color).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Starting ${exercise['title']} exercise')),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      exercise['icon'] as IconData,
                      color: exercise['color'] as Color,
                      size: 24,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        exercise['duration'] as String,
                        style: TextStyle(
                          color: exercise['color'] as Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  exercise['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  exercise['description'] as String,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
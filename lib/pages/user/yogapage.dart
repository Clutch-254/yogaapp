
import 'package:flutter/material.dart';

class Yogapage extends StatefulWidget {
  const Yogapage({super.key});

  @override
  State<Yogapage> createState() => _YogapageState();
}

class _YogapageState extends State<Yogapage> with SingleTickerProviderStateMixin {
  // Selected tab index
  int _selectedTabIndex = 0;
  late TabController _tabController;

  // Selected difficulty filter
  String _selectedDifficulty = 'All';
  final List<String> _difficulties = ['All', 'Beginner', 'Intermediate', 'Advanced'];

  // Yoga programs categories
  final List<Map<String, dynamic>> _yogaCategories = [
    {
      'title': 'Weight Loss',
      'icon': Icons.fitness_center,
      'color': Color(0xFF8C7AE6),
      'sessions': 8,
    },
    {
      'title': 'Flexibility',
      'icon': Icons.accessibility_new,
      'color': Color(0xFF634FBD),
      'sessions': 12,
    },
    {
      'title': 'Prenatal',
      'icon': Icons.pregnant_woman,
      'color': Color(0xFF8C7AE6),
      'sessions': 10,
    },
    {
      'title': 'Pain Relief',
      'icon': Icons.healing,
      'color': Color(0xFF634FBD),
      'sessions': 6,
    },
    {
      'title': 'Meditation',
      'icon': Icons.self_improvement,
      'color': Color(0xFF8C7AE6),
      'sessions': 15,
    },
    {
      'title': 'Morning Yoga',
      'icon': Icons.wb_sunny,
      'color': Color(0xFF634FBD),
      'sessions': 7,
    },
  ];

  // Mock yoga sessions data
  final List<Map<String, dynamic>> _yogaSessions = [
    {
      'title': 'Morning Flow',
      'difficulty': 'Beginner',
      'duration': '20 min',
      'instructor': 'Maya Johnson',
      'category': 'Morning Yoga',
    },
    {
      'title': 'Power Vinyasa',
      'difficulty': 'Advanced',
      'duration': '45 min',
      'instructor': 'Ryan Smith',
      'category': 'Weight Loss',
    },
    {
      'title': 'Gentle Stretch',
      'difficulty': 'Beginner',
      'duration': '30 min',
      'instructor': 'Sarah Chen',
      'category': 'Flexibility',
    },
    {
      'title': 'Core Strength',
      'difficulty': 'Intermediate',
      'duration': '25 min',
      'instructor': 'David Patel',
      'category': 'Weight Loss',
    },
    {
      'title': 'Restorative Yoga',
      'difficulty': 'Beginner',
      'duration': '40 min',
      'instructor': 'Emma Williams',
      'category': 'Pain Relief',
    },
    {
      'title': 'Prenatal Basics',
      'difficulty': 'Beginner',
      'duration': '35 min',
      'instructor': 'Lisa Rodriguez',
      'category': 'Prenatal',
    },
    {
      'title': 'Advanced Balances',
      'difficulty': 'Advanced',
      'duration': '50 min',
      'instructor': 'Michael Chang',
      'category': 'Flexibility',
    },
    {
      'title': 'Mindful Flow',
      'difficulty': 'Intermediate',
      'duration': '30 min',
      'instructor': 'Alisha Patel',
      'category': 'Meditation',
    },
  ];

  // Mock yoga poses data
  final List<Map<String, dynamic>> _yogaPoses = [
    {
      'name': 'Downward Dog',
      'sanskrit': 'Adho Mukha Svanasana',
      'difficulty': 'Beginner',
      'benefits': 'Stretches hamstrings, shoulders and calves',
    },
    {
      'name': 'Warrior I',
      'sanskrit': 'Virabhadrasana I',
      'difficulty': 'Beginner',
      'benefits': 'Strengthens legs and core',
    },
    {
      'name': 'Tree Pose',
      'sanskrit': 'Vrikshasana',
      'difficulty': 'Beginner',
      'benefits': 'Improves balance and focus',
    },
    {
      'name': 'Crow Pose',
      'sanskrit': 'Bakasana',
      'difficulty': 'Intermediate',
      'benefits': 'Strengthens arms and core',
    },
    {
      'name': 'Headstand',
      'sanskrit': 'Sirsasana',
      'difficulty': 'Advanced',
      'benefits': 'Improves circulation and core strength',
    },
    {
      'name': 'Bridge Pose',
      'sanskrit': 'Setu Bandhasana',
      'difficulty': 'Beginner',
      'benefits': 'Opens chest and stretches spine',
    },
    {
      'name': 'Half Moon',
      'sanskrit': 'Ardha Chandrasana',
      'difficulty': 'Intermediate',
      'benefits': 'Improves balance and coordination',
    },
    {
      'name': 'Wheel Pose',
      'sanskrit': 'Urdhva Dhanurasana',
      'difficulty': 'Advanced',
      'benefits': 'Increases spine flexibility',
    },
    {
      'name': 'Child\'s Pose',
      'sanskrit': 'Balasana',
      'difficulty': 'Beginner',
      'benefits': 'Relaxes back and shoulders',
    },
    {
      'name': 'Eagle Pose',
      'sanskrit': 'Garudasana',
      'difficulty': 'Intermediate',
      'benefits': 'Improves focus and stretches upper back',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
            padding: const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF634FBD), Color(0xFF8C7AE6)],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Yoga Library',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.3),
                      child: IconButton(
                        icon: const Icon(Icons.search, color: Colors.white),
                        onPressed: () {
                          // Add search functionality
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Search for yoga sessions or poses')),
                          );
                        },
                      ),
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
                  labelColor: Color(0xFF634FBD),
                  unselectedLabelColor: Colors.white.withOpacity(0.8),
                  tabs: const [
                    Tab(text: 'Sessions'),
                    Tab(text: 'Poses'),
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
                _buildSessionsTab(),
                _buildPosesTab(),
                _buildProgramsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sessions tab
  Widget _buildSessionsTab() {
    // Filter sessions based on selected difficulty
    List<Map<String, dynamic>> filteredSessions = _selectedDifficulty == 'All'
        ? _yogaSessions
        : _yogaSessions.where((session) => session['difficulty'] == _selectedDifficulty).toList();

    return Column(
      children: [
        // Difficulty filters
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _difficulties.length,
            itemBuilder: (context, index) {
              bool isSelected = _difficulties[index] == _selectedDifficulty;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDifficulty = _difficulties[index];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF634FBD) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _difficulties[index],
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
        
        // Sessions list
        Expanded(
          child: filteredSessions.isEmpty
              ? const Center(
                  child: Text(
                    'No sessions available for this difficulty level',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredSessions.length,
                  itemBuilder: (context, index) {
                    final session = filteredSessions[index];
                    return _buildSessionCard(session);
                  },
                ),
        ),
      ],
    );
  }

  // Session card
  Widget _buildSessionCard(Map<String, dynamic> session) {
    Color difficultyColor;
    
    switch (session['difficulty']) {
      case 'Beginner':
        difficultyColor = Colors.green;
        break;
      case 'Intermediate':
        difficultyColor = Colors.orange;
        break;
      case 'Advanced':
        difficultyColor = Colors.red;
        break;
      default:
        difficultyColor = Colors.grey;
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Session image placeholder
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(
                Icons.self_improvement,
                size: 60,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Difficulty and duration row
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: difficultyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        session['difficulty'],
                        style: TextStyle(
                          color: difficultyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF634FBD).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        session['duration'],
                        style: const TextStyle(
                          color: Color(0xFF634FBD),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Session title
                Text(
                  session['title'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Instructor
                Text(
                  'Instructor: ${session['instructor']}',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                // Start button
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Start session functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Starting ${session['title']} session')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF634FBD),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Start Session',
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
          ),
        ],
      ),
    );
  }

  // Poses tab
  Widget _buildPosesTab() {
    // Filter poses based on selected difficulty
    List<Map<String, dynamic>> filteredPoses = _selectedDifficulty == 'All'
        ? _yogaPoses
        : _yogaPoses.where((pose) => pose['difficulty'] == _selectedDifficulty).toList();

    return Column(
      children: [
        // Difficulty filters
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _difficulties.length,
            itemBuilder: (context, index) {
              bool isSelected = _difficulties[index] == _selectedDifficulty;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDifficulty = _difficulties[index];
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFF634FBD) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    _difficulties[index],
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
        
        // Poses grid
        Expanded(
          child: filteredPoses.isEmpty
              ? const Center(
                  child: Text(
                    'No poses available for this difficulty level',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: filteredPoses.length,
                  itemBuilder: (context, index) {
                    final pose = filteredPoses[index];
                    return _buildPoseCard(pose);
                  },
                ),
        ),
      ],
    );
  }

  // Pose card
  Widget _buildPoseCard(Map<String, dynamic> pose) {
    Color difficultyColor;
    
    switch (pose['difficulty']) {
      case 'Beginner':
        difficultyColor = Colors.green;
        break;
      case 'Intermediate':
        difficultyColor = Colors.orange;
        break;
      case 'Advanced':
        difficultyColor = Colors.red;
        break;
      default:
        difficultyColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () {
        // Show pose details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Viewing details for ${pose['name']}')),
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
            // Pose image placeholder
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(
                    Icons.accessibility_new,
                    size: 50,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Difficulty badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: difficultyColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      pose['difficulty'],
                      style: TextStyle(
                        color: difficultyColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Pose name
                  Text(
                    pose['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  // Sanskrit name
                  Text(
                    pose['sanskrit'],
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
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
            'Yoga Programs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF634FBD),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Specialized yoga sequences designed for specific goals',
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
              itemCount: _yogaCategories.length,
              itemBuilder: (context, index) {
                final category = _yogaCategories[index];
                return _buildProgramCard(category);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Program card
  Widget _buildProgramCard(Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () {
        // Show program details
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Viewing ${category['title']} program')),
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
                color: category['color'].withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Center(
                child: Icon(
                  category['icon'],
                  size: 50,
                  color: category['color'],
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
                    category['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Sessions count
                  Text(
                    '${category['sessions']} sessions',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Get started button
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Start program functionality
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Starting ${category['title']} program')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: category['color'],
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
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
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Selected category for filtering
  String _selectedCategory = 'All';
  final List<String> _categories = ['All', 'Featured', 'Popular', 'New'];

  // Featured coaches data
  final List<Map<String, dynamic>> _featuredCoaches = [
    {
      'name': 'Sarah Chen',
      'specialty': 'Yoga & Meditation',
      'rating': 4.9,
      'reviews': 127,
      'image': 'assets/coaches/sarah.jpg',
      'color': Colors.purple,
    },
    {
      'name': 'David Patel',
      'specialty': 'Breathwork Expert',
      'rating': 4.8,
      'reviews': 93,
      'image': 'assets/coaches/david.jpg',
      'color': Colors.blue,
    },
    {
      'name': 'Emma Williams',
      'specialty': 'Sleep Specialist',
      'rating': 4.7,
      'reviews': 84,
      'image': 'assets/coaches/emma.jpg',
      'color': Colors.indigo,
    },
  ];

  // Services data
  final List<Map<String, dynamic>> _services = [
    {
      'title': 'Yoga Sessions',
      'description': 'Improve flexibility, strength, and mindfulness',
      'icon': Icons.self_improvement,
      'color': const Color(0xFF8C7AE6),
      'route': '/yoga',
      'sessions': 25,
      'category': 'Featured',
    },
    {
      'title': 'Breathing Techniques',
      'description': 'Master your breath for stress relief and energy',
      'icon': Icons.air,
      'color': const Color(0xFF42A5F5),
      'route': '/breathing',
      'sessions': 18,
      'category': 'Popular',
    },
    {
      'title': 'Meditation Programs',
      'description': 'Guided practices for mental clarity and calm',
      'icon': Icons.spa,
      'color': const Color(0xFF7E57C2),
      'route': '/meditation',
      'sessions': 30,
      'category': 'Featured',
    },
    {
      'title': 'Sleep & Sound Therapy',
      'description': 'Improve sleep quality with soothing sounds and guidance',
      'icon': Icons.nightlight_round,
      'color': const Color(0xFF5D4EBD),
      'route': '/sleep',
      'sessions': 22,
      'category': 'New',
    },
  ];

  // Popular packages data - SIMPLIFIED
  final List<Map<String, dynamic>> _packages = [
    {
      'title': 'Wellness Complete',
      'description': 'Full access to all services',
      'price': 49.99,
      'duration': 'monthly',
      'features': [
        'Unlimited Sessions',
        'Personal Coach',
      ],
      'color': const Color(0xFF8C7AE6),
      'bestValue': true,
    },
    {
      'title': 'Meditation & Sleep',
      'description': 'Focus on mental clarity and better sleep',
      'price': 29.99,
      'duration': 'monthly',
      'features': [
        'All Meditation Content',
        'All Sleep Programs',
      ],
      'color': const Color(0xFF5D4EBD),
      'bestValue': false,
    },
    {
      'title': 'Yoga Essentials',
      'description': 'Complete yoga program for all levels',
      'price': 24.99,
      'duration': 'monthly',
      'features': ['All Yoga Sessions', 'Pose Library'],
      'color': const Color(0xFF42A5F5),
      'bestValue': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App bar with logo, search and profile
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Wellness Hub',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        // Search icon button
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Search')),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Notifications')),
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Profile')),
                            );
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person_outline,
                              color: Colors.black87,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Welcome message
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Find Your Path to Wellness',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Featured coaches section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Featured Coaches',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('View all coaches')),
                        );
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),

              // Coach cards horizontal scroll
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _featuredCoaches.length,
                  itemBuilder: (context, index) {
                    final coach = _featuredCoaches[index];
                    return _buildCoachCard(coach);
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Services section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Our Services',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Category filters
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _categories.length,
                        itemBuilder: (context, index) {
                          final category = _categories[index];
                          final isSelected = category == _selectedCategory;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategory = category;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF7E57C2)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                category,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                  fontSize: 12,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
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

              const SizedBox(height: 16),

              // Service cards
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _services.length,
                itemBuilder: (context, index) {
                  final service = _services[index];
                  // Filter by category if not showing all
                  if (_selectedCategory != 'All' &&
                      service['category'] != _selectedCategory) {
                    return const SizedBox.shrink();
                  }
                  return _buildServiceCard(service);
                },
              ),

              const SizedBox(height: 24),

              // Popular packages
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular Packages',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('View all packages')),
                        );
                      },
                      child: const Text('View All'),
                    ),
                  ],
                ),
              ),

              // Package cards horizontal scroll - FURTHER IMPROVED HEIGHT
              SizedBox(
                height: 280, // Further increased height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: _packages.length,
                  itemBuilder: (context, index) {
                    final package = _packages[index];
                    return _buildPackageCard(package);
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Coach card widget
  Widget _buildCoachCard(Map<String, dynamic> coach) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Coach profile: ${coach['name']}')),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Coach image placeholder
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: (coach['color'] as Color).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              // Coach details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      coach['name'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      coach['specialty'] as String,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${coach['rating']} (${coach['reviews']} reviews)',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Service card widget
  Widget _buildServiceCard(Map<String, dynamic> service) {
    return GestureDetector(
      onTap: () {
        // Navigate to service page
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Navigating to ${service['title']}')),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Service icon
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: (service['color'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  service['icon'] as IconData,
                  color: service['color'] as Color,
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              // Service details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      service['description'] as String,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${service['sessions']} sessions',
                      style: TextStyle(
                        color: service['color'] as Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow icon
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade400,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Package card widget - COMPLETELY REDESIGNED
  Widget _buildPackageCard(Map<String, dynamic> package) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Package details: ${package['title']}')),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize:
                    MainAxisSize.min, // Use min size instead of expanding
                children: [
                  // Package title
                  Text(
                    package['title'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Package description
                  Text(
                    package['description'] as String,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Price
                  Row(
                    children: [
                      Text(
                        '\$${package['price']}',
                        style: TextStyle(
                          color: package['color'] as Color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        '/${package['duration']}',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Features - Limited to first 2 features
                  ...List.generate(
                    (package['features'] as List).length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: package['color'] as Color,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              package['features'][index] as String,
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24), // Fixed spacing
                  // Subscribe button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: package['color'] as Color,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Subscribe to ${package['title']}')),
                        );
                      },
                      child: const Text(
                        'Subscribe',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Best value badge
            if (package['bestValue'] as bool)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: package['color'] as Color,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Best Value',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class Profilead extends StatefulWidget {
  const Profilead({super.key});

  @override
  State<Profilead> createState() => _ProfileadState();
}

class _ProfileadState extends State<Profilead> {
  // Selected tab index
  int _selectedTabIndex = 0;

  // Mock data for the coach
  final String coachName = "Alex Johnson";
  final String coachTitle = "Yoga & Meditation Coach";
  final String coachBio =
      "Certified yoga instructor with 8 years of experience. Specializing in Vinyasa flow, meditation, and breathwork techniques for stress relief and mindfulness.";
  final int studentsCount = 187;
  final int coursesCount = 14;
  final double rating = 4.9;

  // Mock data for classes
  final List<Map<String, dynamic>> upcomingClasses = [
    {
      'title': 'Morning Flow',
      'time': 'Today, 7:30 AM',
      'duration': '45 min',
      'enrolledStudents': 12,
      'type': 'Yoga'
    },
    {
      'title': 'Breathwork for Anxiety',
      'time': 'Tomorrow, 6:00 PM',
      'duration': '30 min',
      'enrolledStudents': 8,
      'type': 'Breathing'
    },
    {
      'title': 'Deep Meditation',
      'time': 'Friday, 8:00 PM',
      'duration': '60 min',
      'enrolledStudents': 15,
      'type': 'Meditation'
    },
  ];

  // Mock certifications
  final List<Map<String, dynamic>> certifications = [
    {
      'title': 'Yoga Alliance RYT-500',
      'year': '2018',
      'institution': 'Yoga Alliance'
    },
    {
      'title': 'Mindfulness Meditation Teacher',
      'year': '2020',
      'institution': 'Mindful Living Center'
    },
    {
      'title': 'Advanced Breathwork Practitioner',
      'year': '2021',
      'institution': 'Breathe Institute'
    },
  ];

  // Mock reviews
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'Sarah K.',
      'rating': 5.0,
      'comment':
          'Alex\'s classes have transformed my practice. The breathwork techniques were particularly helpful for my anxiety.',
      'date': '2 weeks ago'
    },
    {
      'name': 'Michael T.',
      'rating': 4.5,
      'comment':
          'Great instructor! Clear instructions and modifications for all levels.',
      'date': '1 month ago'
    },
    {
      'name': 'Lisa M.',
      'rating': 5.0,
      'comment':
          'The meditation sessions are incredible. I\'ve seen such improvement in my focus and sleep quality.',
      'date': '2 months ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile header section with image placeholder
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 20),
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
                  Stack(
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
                      // Camera icon
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
                  SizedBox(height: 16),
                  // Coach name
                  Text(
                    coachName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Coach title
                  Text(
                    coachTitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "$rating",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16),
                      Container(
                        height: 16,
                        width: 1,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.person_outline, color: Colors.white, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "$studentsCount students",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Stats cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCard("Classes", coursesCount.toString()),
                        _buildStatCard("Experience", "8 years"),
                        _buildStatCard(
                            "Certifications", certifications.length.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Buttons section
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

                  SizedBox(height: 20),

                  // Coach bio section
                  Text(
                    "About Me",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    coachBio,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 24),

                  // Tabs
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        _buildTab(0, "Classes"),
                        _buildTab(1, "Credentials"),
                        _buildTab(2, "Reviews"),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  // Tab content
                  _selectedTabIndex == 0
                      ? _buildClassesContent()
                      : _selectedTabIndex == 1
                          ? _buildCredentialsContent()
                          : _buildReviewsContent(),
                ],
              ),
            ),
          ],
        ),
      ),
      // Bottom navigation bar removed as requested
    );
  }

  // Helper method to build stat cards
  Widget _buildStatCard(String title, String value) {
    return Container(
      width: 95,
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

  // Tab selector
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

  // Classes content
  Widget _buildClassesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upcoming classes
        Text(
          "Upcoming Classes",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),

        // Class list
        ...upcomingClasses.map((cls) => _buildClassItem(cls)).toList(),

        SizedBox(height: 24),

        // Create new class button
        Container(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Create new class would open here')),
              );
            },
            icon: Icon(Icons.add),
            label: Text(
              "Create New Class",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF634FBD),
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Class item
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
                      cls['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      cls['time'],
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
                  cls['duration'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 4),
                  Text(
                    "${cls['enrolledStudents']} students enrolled",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Edit class details would open here')),
                  );
                },
                child: Text(
                  "Edit Details",
                  style: TextStyle(
                    color: Color(0xFF634FBD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Credentials content
  Widget _buildCredentialsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Certifications
        Text(
          "Certifications & Training",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),

        // Certification list
        ...certifications.map((cert) => _buildCertificationItem(cert)).toList(),

        SizedBox(height: 24),

        // Add new certification button
        Container(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Add certification would open here')),
              );
            },
            icon: Icon(Icons.add, color: Color(0xFF634FBD)),
            label: Text(
              "Add Certification",
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

        SizedBox(height: 24),

        // Specialties section
        Text(
          "Specialties",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),

        // Specialties chips
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildSpecialtyChip("Vinyasa Flow"),
            _buildSpecialtyChip("Meditation"),
            _buildSpecialtyChip("Breathwork"),
            _buildSpecialtyChip("Stress Relief"),
            _buildSpecialtyChip("Mindfulness"),
            _buildSpecialtyChip("Yin Yoga"),
            _buildSpecialtyChip("Yoga for Beginners"),
          ],
        ),
      ],
    );
  }

  // Certification item
  Widget _buildCertificationItem(Map<String, dynamic> cert) {
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
              color: Color(0xFF634FBD).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.verified,
              color: Color(0xFF634FBD),
              size: 30,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cert['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "${cert['institution']} • ${cert['year']}",
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
    );
  }

  // Specialty chip
  Widget _buildSpecialtyChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Color(0xFF634FBD).withOpacity(0.1),
      labelStyle: TextStyle(
        color: Color(0xFF634FBD),
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Reviews content
  Widget _buildReviewsContent() {
    double averageRating =
        reviews.fold(0.0, (sum, review) => sum + review['rating']) /
            reviews.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Rating summary
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
              // Average rating display
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF634FBD),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${averageRating.toStringAsFixed(1)}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < averageRating.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Rating distribution
              Expanded(
                child: Column(
                  children: List.generate(
                    5,
                    (index) {
                      final ratingValue = 5 - index;
                      final count = reviews
                          .where((r) =>
                              r['rating'] >= ratingValue &&
                              r['rating'] < ratingValue + 1)
                          .length;
                      final percentage = count / reviews.length;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          children: [
                            Text(
                              "$ratingValue",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.star, color: Colors.amber, size: 12),
                            SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                height: 6,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 150 * percentage,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF634FBD),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "$count",
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
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 24),

        // Reviews header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Student Reviews",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('See all reviews would open here')),
                );
              },
              child: Text(
                "See All",
                style: TextStyle(
                  color: Color(0xFF634FBD),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),

        // Reviews list
        ...reviews.map((review) => _buildReviewItem(review)).toList(),
      ],
    );
  }

  // Review item
  Widget _buildReviewItem(Map<String, dynamic> review) {
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
              // User avatar (placeholder)
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(width: 12),
              // User info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      review['date'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              // Rating stars
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < review['rating'] ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          // Review comment
          Text(
            review['comment'],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              height: 1.5,
            ),
          ),
          SizedBox(height: 12),
          // Response option (for coach)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Reply to review would open here')),
                  );
                },
                icon: Icon(Icons.reply, size: 16),
                label: Text("Reply"),
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF634FBD),
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
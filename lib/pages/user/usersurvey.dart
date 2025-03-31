
import 'package:flutter/material.dart';

class Usersurvey extends StatefulWidget {
  const Usersurvey({super.key});

  @override
  State<Usersurvey> createState() => _UsersurveyState();
}

class _UsersurveyState extends State<Usersurvey> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  
  // Simplified user responses map
  final Map<String, dynamic> _userResponses = {
    'goals': <String>[],
    'experience': '',
    'sleepIssues': <String>[],
    'preferredTime': '',
    'stressLevel': 5, // Default value
    'sessionLength': '',
    'focusAreas': <String>[]
  };
  
  // Survey options - optimized to remove redundant data
  final List<Map<String, dynamic>> _goalOptions = [
    {'label': 'Reduce Stress', 'icon': Icons.spa, 'color': Colors.teal},
    {'label': 'Better Sleep', 'icon': Icons.nightlight_round, 'color': Colors.indigo},
    {'label': 'Improve Focus', 'icon': Icons.center_focus_strong, 'color': Colors.blue},
    {'label': 'Physical Fitness', 'icon': Icons.fitness_center, 'color': Colors.purple},
    {'label': 'Manage Anxiety', 'icon': Icons.psychology, 'color': Colors.orange},
    {'label': 'Daily Mindfulness', 'icon': Icons.self_improvement, 'color': Colors.green},
  ];
  
  final List<Map<String, dynamic>> _experienceOptions = [
    {'label': 'Beginner', 'description': 'New to meditation and yoga'},
    {'label': 'Intermediate', 'description': 'Some experience with practices'},
    {'label': 'Advanced', 'description': 'Regular practitioner for years'},
  ];
  
  final List<Map<String, dynamic>> _sleepIssueOptions = [
    {'label': 'Falling Asleep', 'icon': Icons.bedtime},
    {'label': 'Staying Asleep', 'icon': Icons.nights_stay},
    {'label': 'Early Waking', 'icon': Icons.wb_twilight},
    {'label': 'Unrefreshing Sleep', 'icon': Icons.battery_alert},
    {'label': 'No Issues', 'icon': Icons.check_circle},
  ];
  
  final List<Map<String, dynamic>> _timeOptions = [
    {'label': 'Morning', 'icon': Icons.wb_sunny},
    {'label': 'Afternoon', 'icon': Icons.wb_cloudy},
    {'label': 'Evening', 'icon': Icons.nights_stay},
    {'label': 'Variable', 'icon': Icons.schedule},
  ];
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _navigatePage(bool forward) {
    if (forward && _currentPage < 5) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (!forward && _currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else if (forward && _currentPage == 5) {
      _submitSurvey();
    }
  }
  
  void _submitSurvey() {
    // Show completion message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Your personalized recommendations are ready!')),
    );
    
    // Show recommendations dialog
    _showRecommendationsDialog();
  }
  
  void _updateSelection(String key, String value, {bool isMultiple = true}) {
    setState(() {
      if (isMultiple) {
        if (_userResponses[key].contains(value)) {
          _userResponses[key].remove(value);
        } else {
          // Handle special case for "No Issues" in sleep issues
          if (key == 'sleepIssues' && value == 'No Issues') {
            _userResponses[key] = ['No Issues'];
          } else if (key == 'sleepIssues' && _userResponses[key].contains('No Issues')) {
            _userResponses[key].remove('No Issues');
            _userResponses[key].add(value);
          } else {
            _userResponses[key].add(value);
          }
        }
      } else {
        _userResponses[key] = value;
      }
    });
  }
  
  void _showRecommendationsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Personalized Recommendations'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Based on your preferences, we recommend:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                
                // Generate recommendations based on responses
                if (_userResponses['goals'].contains('Reduce Stress'))
                  _buildRecommendationItem(
                    'Mindful Breathing Meditation',
                    'Daily 10-minute sessions to reduce stress levels',
                    Icons.spa,
                  ),
                
                if (_userResponses['goals'].contains('Better Sleep'))
                  _buildRecommendationItem(
                    'Evening Wind-Down Routine',
                    'Gentle yoga and meditation for better sleep',
                    Icons.nightlight_round,
                  ),
                
                if (_userResponses['goals'].contains('Improve Focus'))
                  _buildRecommendationItem(
                    'Focus Enhancement Program',
                    'Concentration practices and mindfulness techniques',
                    Icons.center_focus_strong,
                  ),
                
                if (_userResponses['experience'] == 'Beginner')
                  _buildRecommendationItem(
                    'Beginner\'s Meditation Journey',
                    'Step-by-step introduction to core practices',
                    Icons.auto_awesome,
                  ),
                
                if (_userResponses['stressLevel'] >= 7)
                  _buildRecommendationItem(
                    'Stress Relief Package',
                    'Intensive practices for high stress levels',
                    Icons.healing,
                  ),
                
                // Default recommendation if few selections were made
                if (_userResponses['goals'].isEmpty)
                  _buildRecommendationItem(
                    'Wellness Explorer Package',
                    'Try different practices to find what works for you',
                    Icons.explore,
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
              ),
              child: const Text('Go to Dashboard'),
            ),
          ],
        );
      },
    );
  }
  
  Widget _buildRecommendationItem(String title, String description, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF7E57C2).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF7E57C2),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress bar and navigation
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  _currentPage > 0
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () => _navigatePage(false),
                      )
                    : const SizedBox(width: 48),
                  
                  Expanded(
                    child: LinearProgressIndicator(
                      value: (_currentPage + 1) / 6, // Updated for fewer pages
                      backgroundColor: Colors.grey.shade200,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF7E57C2)),
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  Text(
                    '${_currentPage + 1}/6', // Updated for fewer pages
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(width: 16),
                  
                  _currentPage < 5 // Updated for fewer pages
                    ? TextButton(
                        onPressed: () => _navigatePage(true),
                        child: const Text('Skip'),
                        style: TextButton.styleFrom(foregroundColor: Colors.grey.shade600),
                      )
                    : const SizedBox(width: 48),
                ],
              ),
            ),
            
            // Survey pages
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  _buildWelcomePage(),
                  _buildGoalsPage(),
                  _buildExperiencePage(),
                  _buildSleepIssuesPage(),
                  _buildPreferredTimePage(),
                  _buildStressLevelPage(),
                  // Removed unnecessary pages
                ],
              ),
            ),
            
            // Next button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _navigatePage(true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7E57C2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    _currentPage == 5 ? 'Get Recommendations' : 'Continue',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  // Welcome page - simplified
  Widget _buildWelcomePage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.self_improvement,
            size: 80,
            color: Color(0xFF7E57C2),
          ),
          const SizedBox(height: 24),
          const Text(
            'Let\'s Personalize Your Experience',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Answer a few questions to help us create personalized meditation and yoga recommendations just for you.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.timer, color: Color(0xFF7E57C2)),
              SizedBox(width: 8),
              Text(
                'Takes about 2 minutes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // Goals page - simplified
  Widget _buildGoalsPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What are your main goals?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Select all that apply',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          
          // Goals grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: _goalOptions.length,
            itemBuilder: (context, index) {
              final goal = _goalOptions[index];
              final isSelected = _userResponses['goals'].contains(goal['label']);
              
              return InkWell(
                onTap: () => _updateSelection('goals', goal['label']),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isSelected ? goal['color'] as Color : Colors.grey.shade300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected ? (goal['color'] as Color).withOpacity(0.1) : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        goal['icon'] as IconData,
                        color: goal['color'] as Color,
                        size: 32,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        goal['label'] as String,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  
  // Experience page - simplified
  Widget _buildExperiencePage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'What\'s your experience level?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'With meditation and yoga practices',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 32),
          
          // Experience options
          ...List.generate(
            _experienceOptions.length,
            (index) {
              final option = _experienceOptions[index];
              final isSelected = _userResponses['experience'] == option['label'];
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: () => _updateSelection('experience', option['label'], isMultiple: false),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected ? const Color(0xFF7E57C2).withOpacity(0.1) : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade400,
                              width: 2,
                            ),
                            color: isSelected ? const Color(0xFF7E57C2) : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                option['label'] as String,
                                style: TextStyle(
                                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                option['description'] as String,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  
  // Sleep issues page - simplified
  Widget _buildSleepIssuesPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Do you have any sleep issues?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Select all that apply',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          
          // Sleep issues
          ...List.generate(
            _sleepIssueOptions.length,
            (index) {
              final option = _sleepIssueOptions[index];
              final isSelected = _userResponses['sleepIssues'].contains(option['label']);
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: InkWell(
                  onTap: () => _updateSelection('sleepIssues', option['label']),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? const Color(0xFF7E57C2).withOpacity(0.1) : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          option['icon'] as IconData,
                          color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade600,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          option['label'] as String,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade400,
                              width: 2,
                            ),
                            color: isSelected ? const Color(0xFF7E57C2) : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  
  // Preferred time page - simplified
  Widget _buildPreferredTimePage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'When do you prefer to practice?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose your preferred time of day',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 32),
          
          // Time options
          ...List.generate(
            _timeOptions.length,
            (index) {
              final option = _timeOptions[index];
              final isSelected = _userResponses['preferredTime'] == option['label'];
              
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: () => _updateSelection('preferredTime', option['label'], isMultiple: false),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade300,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected ? const Color(0xFF7E57C2).withOpacity(0.1) : Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          option['icon'] as IconData,
                          color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade600,
                          size: 28,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          option['label'] as String,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected ? const Color(0xFF7E57C2) : Colors.grey.shade400,
                              width: 2,
                            ),
                            color: isSelected ? const Color(0xFF7E57C2) : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  
  // Stress level page - simplified
  Widget _buildStressLevelPage() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How would you rate your stress level?',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'On a scale from 1 to 10',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 40),
          
          // Stress level slider
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Low',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'High',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: const Color(0xFF7E57C2),
                  inactiveTrackColor: Colors.grey.shade300,
                  thumbColor: const Color(0xFF7E57C2),
                  overlayColor: const Color(0xFF7E57C2).withOpacity(0.2),
                  trackHeight: 8,
                  thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
                ),
                child: Slider(
                  min: 1,
                  max: 10,
                  divisions: 9,
                  value: (_userResponses['stressLevel'] ?? 5).toDouble(),
                  onChanged: (value) {
                    setState(() {
                      _userResponses['stressLevel'] = value.toInt();
                    });
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  10,
                  (index) => Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: _userResponses['stressLevel'] == index + 1
                          ? const Color(0xFF7E57C2)
                          : Colors.grey.shade600,
                      fontWeight: _userResponses['stressLevel'] == index + 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 40),
          
          // Current level display
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF7E57C2).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF7E57C2)),
            ),
            child: Column(
              children: [
                Text(
                  'Your current stress level: ${_userResponses['stressLevel']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _getStressLevelDescription(_userResponses['stressLevel']),
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _getStressLevelDescription(int level) {
    if (level <= 3) {
      return 'You\'re managing stress well. We\'ll focus on maintaining this balance.';
    } else if (level <= 6) {
      return 'You\'re experiencing moderate stress. We\'ll help you develop effective coping techniques.';
    } else {
      return 'You\'re dealing with significant stress. We\'ll prioritize stress reduction in your recommendations.';
    }
  }
}
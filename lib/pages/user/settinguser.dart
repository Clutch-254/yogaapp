
import 'package:flutter/material.dart';

class Settinguser extends StatefulWidget {
  const Settinguser({super.key});

  @override
  State<Settinguser> createState() => _SettinguserState();
}

class _SettinguserState extends State<Settinguser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Color(0xFF634FBD),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Account Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              _buildSettingsCard(
                Icons.account_circle_outlined,
                "Personal Information",
                "Update your personal details"
              ),
              _buildSettingsCard(
                Icons.lock_outline,
                "Privacy & Security",
                "Control your privacy settings"
              ),
              _buildSettingsCard(
                Icons.language_outlined,
                "Language",
                "Change your preferred language"
              ),
              _buildSettingsCard(
                Icons.query_stats,
                "Onboarding Survey",
                "Personalize your meditation & yoga recommendations"
              ),
              
              SizedBox(height: 24),
              Text(
                "App Settings",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              _buildSettingsCard(
                Icons.help_outline,
                "Help & Support",
                "Get assistance and answers to your questions"
              ),
              _buildSettingsCard(
                Icons.star_outline,
                "Rate Our App",
                "If you enjoy our app, please give us a rating"
              ),
              _buildSettingsCard(
                Icons.info_outline,
                "About",
                "Learn more about our app"
              ),
              
              SizedBox(height: 20),
              // Logout button
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Logout functionality would be implemented here
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logout functionality would go here'))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade400,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
  
  // Helper method to build settings cards
  Widget _buildSettingsCard(IconData icon, String title, String subtitle) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
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
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {
          // Navigation would happen here
          if (title == "Personal Information") {
            _showPersonalInfoDialog(context);
          } else if (title == "Onboarding Survey") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OnboardingSurveyScreen()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title settings would open here'))
            );
          }
        },
      ),
    );
  }
  
  // Example of a dialog for personal information
  void _showPersonalInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Personal Information"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Phone Number",
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
                  SnackBar(content: Text('Information updated'))
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}

// Onboarding Survey Screen
class OnboardingSurveyScreen extends StatefulWidget {
  @override
  _OnboardingSurveyScreenState createState() => _OnboardingSurveyScreenState();
}

class _OnboardingSurveyScreenState extends State<OnboardingSurveyScreen> {
  // Survey state variables
  int _currentStep = 0;
  final int _totalSteps = 5;
  
  // Experience level
  String? _experienceLevel;
  
  // Goals - multiple selection allowed
  final List<bool> _selectedGoals = [false, false, false, false, false, false];
  final List<String> _goals = [
    "Reduce stress & anxiety",
    "Improve sleep quality",
    "Increase flexibility",
    "Build strength",
    "Mindfulness practice",
    "Weight management"
  ];
  
  // Practice frequency
  String? _practiceFrequency;
  
  // Practice duration
  int _practiceDuration = 10; // Default 10 minutes
  
  // Health concerns
  final List<bool> _healthConcerns = [false, false, false, false, false];
  final List<String> _concerns = [
    "Back pain", 
    "Joint issues",
    "Pregnancy",
    "Heart conditions",
    "Breathing difficulties"
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personalization Survey"),
        backgroundColor: Color(0xFF634FBD),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Progress indicator
          LinearProgressIndicator(
            value: (_currentStep + 1) / _totalSteps,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF634FBD)),
            minHeight: 6,
          ),
          
          // Step count indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Step ${_currentStep + 1} of $_totalSteps",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${((_currentStep + 1) / _totalSteps * 100).toInt()}% Complete",
                  style: TextStyle(
                    color: Color(0xFF634FBD),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          // Survey content - using Expanded to take remaining space
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: _buildCurrentStep(),
            ),
          ),
          
          // Navigation buttons
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button - hidden on first step
                _currentStep > 0
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _currentStep--;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade200,
                          foregroundColor: Colors.black87,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        child: Text("Back"),
                      )
                    : SizedBox(width: 80), // Empty space to maintain layout
                
                // Next/Submit button
                ElevatedButton(
                  onPressed: () {
                    if (_currentStep < _totalSteps - 1) {
                      setState(() {
                        _currentStep++;
                      });
                    } else {
                      _submitSurvey();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF634FBD),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: Text(
                    _currentStep < _totalSteps - 1 ? "Next" : "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
  
  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 0:
        return _buildExperienceLevelStep();
      case 1:
        return _buildGoalsStep();
      case 2:
        return _buildFrequencyStep();
      case 3:
        return _buildDurationStep();
      case 4:
        return _buildHealthConcernsStep();
      default:
        return Container();
    }
  }
  
  Widget _buildExperienceLevelStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What's your experience level?",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "This helps us recommend appropriate practices for you.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(height: 24),
        
        // Experience level options
        _buildSelectionCard(
          "Beginner",
          "New to meditation and yoga",
          _experienceLevel == "Beginner",
          () {
            setState(() {
              _experienceLevel = "Beginner";
            });
          },
        ),
        _buildSelectionCard(
          "Intermediate",
          "Some experience with meditation and yoga",
          _experienceLevel == "Intermediate",
          () {
            setState(() {
              _experienceLevel = "Intermediate";
            });
          },
        ),
        _buildSelectionCard(
          "Advanced",
          "Regular practitioner with good experience",
          _experienceLevel == "Advanced",
          () {
            setState(() {
              _experienceLevel = "Advanced";
            });
          },
        ),
      ],
    );
  }
  
  Widget _buildGoalsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What are your wellness goals?",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Select all that apply. We'll customize your experience based on these goals.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(height: 24),
        
        // Goals selection - checkboxes
        for (int i = 0; i < _goals.length; i++)
          CheckboxListTile(
            value: _selectedGoals[i],
            onChanged: (bool? value) {
              setState(() {
                _selectedGoals[i] = value ?? false;
              });
            },
            title: Text(
              _goals[i],
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            activeColor: Color(0xFF634FBD),
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
            controlAffinity: ListTileControlAffinity.leading,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
      ],
    );
  }
  
  Widget _buildFrequencyStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How often do you plan to practice?",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "This helps us create a sustainable routine for you.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(height: 24),
        
        // Frequency options
        _buildSelectionCard(
          "Daily",
          "Practice every day",
          _practiceFrequency == "Daily",
          () {
            setState(() {
              _practiceFrequency = "Daily";
            });
          },
        ),
        _buildSelectionCard(
          "Few times a week",
          "Practice 3-5 times weekly",
          _practiceFrequency == "Few times a week",
          () {
            setState(() {
              _practiceFrequency = "Few times a week";
            });
          },
        ),
        _buildSelectionCard(
          "Weekly",
          "Practice 1-2 times weekly",
          _practiceFrequency == "Weekly",
          () {
            setState(() {
              _practiceFrequency = "Weekly";
            });
          },
        ),
        _buildSelectionCard(
          "Occasionally",
          "Practice when needed",
          _practiceFrequency == "Occasionally",
          () {
            setState(() {
              _practiceFrequency = "Occasionally";
            });
          },
        ),
      ],
    );
  }
  
  Widget _buildDurationStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How long would you like to practice?",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Select your preferred session duration.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(height: 24),
        
        // Duration slider
        Text(
          "$_practiceDuration minutes",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF634FBD),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Color(0xFF634FBD),
            inactiveTrackColor: Colors.grey.shade300,
            thumbColor: Color(0xFF634FBD),
            overlayColor: Color(0xFF634FBD).withOpacity(0.2),
            valueIndicatorColor: Color(0xFF634FBD),
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Slider(
            value: _practiceDuration.toDouble(),
            min: 5,
            max: 60,
            divisions: 11, // Steps of 5 minutes
            label: "$_practiceDuration minutes",
            onChanged: (value) {
              setState(() {
                _practiceDuration = value.round();
              });
            },
          ),
        ),
        
        // Duration explanations
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("5 min", style: TextStyle(color: Colors.grey.shade600)),
              Text("30 min", style: TextStyle(color: Colors.grey.shade600)),
              Text("60 min", style: TextStyle(color: Colors.grey.shade600)),
            ],
          ),
        ),
        
        // Duration cards for quick selection
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDurationQuickSelectCard(5),
              _buildDurationQuickSelectCard(10),
              _buildDurationQuickSelectCard(15),
              _buildDurationQuickSelectCard(20),
              _buildDurationQuickSelectCard(30),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildHealthConcernsStep() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Do you have any health concerns?",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "This helps us recommend safe practices for your specific needs.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade700,
          ),
        ),
        SizedBox(height: 24),
        
        // Health concerns - checkboxes
        for (int i = 0; i < _concerns.length; i++)
          CheckboxListTile(
            value: _healthConcerns[i],
            onChanged: (bool? value) {
              setState(() {
                _healthConcerns[i] = value ?? false;
              });
            },
            title: Text(
              _concerns[i],
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            activeColor: Color(0xFF634FBD),
            contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
            controlAffinity: ListTileControlAffinity.leading,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          
        SizedBox(height: 16),
        
        // Other health concerns text field
        TextField(
          decoration: InputDecoration(
            labelText: "Any other health concerns?",
            hintText: "Please specify if any",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          maxLines: 3,
        ),
      ],
    );
  }
  
  Widget _buildSelectionCard(String title, String subtitle, bool isSelected, VoidCallback onTap) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? Color(0xFF634FBD) : Colors.grey.shade300,
          width: isSelected ? 2 : 1,
        ),
      ),
      elevation: isSelected ? 2 : 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Color(0xFF634FBD) : Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Color(0xFF634FBD) : Colors.grey.shade400,
                    width: 2,
                  ),
                  color: isSelected ? Color(0xFF634FBD) : Colors.transparent,
                ),
                child: isSelected
                    ? Icon(
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
  }
  
  Widget _buildDurationQuickSelectCard(int minutes) {
    final bool isSelected = _practiceDuration == minutes;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _practiceDuration = minutes;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF634FBD) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "$minutes",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
  
  void _submitSurvey() {
    // Here you would typically save the survey results to a user profile
    // For now, we'll just show a success dialog
    
    // Get selected goals
    List<String> selectedGoals = [];
    for (int i = 0; i < _goals.length; i++) {
      if (_selectedGoals[i]) {
        selectedGoals.add(_goals[i]);
      }
    }
    
    // Get selected health concerns
    List<String> selectedConcerns = [];
    for (int i = 0; i < _concerns.length; i++) {
      if (_healthConcerns[i]) {
        selectedConcerns.add(_concerns[i]);
      }
    }
    
    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Survey Completed"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Thank you for taking the survey!",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text("Your preferences have been saved. We've personalized your meditation and yoga recommendations based on your responses."),
              SizedBox(height: 16),
              Text(
                "Your choices:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("• Experience level: $_experienceLevel"),
              Text("• Practice frequency: $_practiceFrequency"),
              Text("• Session duration: $_practiceDuration minutes"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to settings screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF634FBD),
              ),
              child: Text("Done"),
            ),
          ],
        );
      },
    );
  }
}
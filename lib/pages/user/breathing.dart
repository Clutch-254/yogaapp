
import 'package:flutter/material.dart';
import 'dart:async';

class Breathing extends StatefulWidget {
  const Breathing({super.key});

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing> with SingleTickerProviderStateMixin {
  // Breathing exercise types
  final List<Map<String, dynamic>> _breathingExercises = [
    {
      'title': 'Deep Breathing',
      'description': 'Slow, deep breaths to calm the mind and reduce stress',
      'icon': Icons.air,
      'color': Colors.blue,
      'pattern': [4, 2, 4, 0], // Inhale, hold, exhale, hold
    },
    {
      'title': 'Box Breathing',
      'description': 'Equal duration for inhale, hold, exhale, and hold',
      'icon': Icons.crop_square_rounded,
      'color': Colors.purple,
      'pattern': [4, 4, 4, 4], // Inhale, hold, exhale, hold
    },
    {
      'title': 'Pranayama',
      'description': 'Alternate nostril breathing for balance and focus',
      'icon': Icons.self_improvement,
      'color': Colors.teal,
      'pattern': [5, 0, 5, 0], // Inhale, hold, exhale, hold
    },
  ];

  // Selected exercise
  Map<String, dynamic>? _selectedExercise;
  
  // Timer variables
  Timer? _timer;
  int _phaseIndex = 0; // 0: inhale, 1: hold, 2: exhale, 3: hold
  int _secondsRemaining = 0;
  bool _isTimerRunning = false;
  int _totalCycles = 0;
  int _currentCycle = 0;

  // Animation controller for breathing animation
  late AnimationController _animationController;
  
  // Audio selection
  final List<String> _soundscapes = ['None', 'Ocean Waves', 'Forest', 'Meditation Bells'];
  String _selectedSoundscape = 'None';

  // Stress detection variables
  double _stressLevel = 0.0;
  String _stressMessage = 'Analyzing your breathing pattern...';
  
  @override
  void initState() {
    super.initState();
    _selectedExercise = _breathingExercises[0];
    
    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // Set initial seconds remaining
    _resetTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  void _resetTimer() {
    _timer?.cancel();
    _isTimerRunning = false;
    _phaseIndex = 0;
    
    if (_selectedExercise != null) {
      _secondsRemaining = _selectedExercise!['pattern'][_phaseIndex];
    } else {
      _secondsRemaining = 4;
    }
    
    _currentCycle = 0;
    _animationController.reset();
  }

  void _startTimer() {
    _isTimerRunning = true;
    _animationController.forward();
    
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 1) {
          _secondsRemaining--;
        } else {
          // Move to next phase
          _phaseIndex = (_phaseIndex + 1) % 4;
          
          // If we completed all 4 phases, increment cycle count
          if (_phaseIndex == 0) {
            _currentCycle++;
            if (_currentCycle >= _totalCycles && _totalCycles > 0) {
              _stopTimer();
              _analyzeBreathingPattern();
              return;
            }
          }
          
          _secondsRemaining = _selectedExercise!['pattern'][_phaseIndex];
          
          // Control animation based on the phase
          if (_phaseIndex == 0) { // Inhale
            _animationController.forward(from: 0.0);
          } else if (_phaseIndex == 2) { // Exhale
            _animationController.reverse(from: 1.0);
          }
        }
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _timer?.cancel();
      _isTimerRunning = false;
      _animationController.stop();
    });
  }

  void _analyzeBreathingPattern() {
    // Simulate AI-based analysis
    setState(() {
      _stressLevel = (_currentCycle / 3) * 10; // Just a sample calculation
      
      if (_stressLevel < 3) {
        _stressMessage = 'Your breathing is very regular and calm. Keep it up!';
      } else if (_stressLevel < 7) {
        _stressMessage = 'Your breathing shows moderate stress levels. Try to practice more regularly.';
      } else {
        _stressMessage = 'Your breathing pattern indicates higher stress. We recommend daily practice.';
      }
    });
    
    // Show analysis dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Breathing Analysis'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_stressMessage),
              const SizedBox(height: 16),
              Text('Stress Level: ${_stressLevel.toStringAsFixed(1)}/10'),
              const SizedBox(height: 16),
              LinearProgressIndicator(
                value: _stressLevel / 10,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _stressLevel < 3
                      ? Colors.green
                      : _stressLevel < 7
                          ? Colors.orange
                          : Colors.red,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breathing Exercises'),
        backgroundColor: Colors.blueGrey.shade800,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Exercise',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              // Breathing exercise cards
              ...List.generate(
                _breathingExercises.length,
                (index) {
                  final exercise = _breathingExercises[index];
                  final isSelected = _selectedExercise == exercise;
                  
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedExercise = exercise;
                          _resetTimer();
                        });
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? exercise['color'] as Color
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          color: isSelected
                              ? (exercise['color'] as Color).withOpacity(0.1)
                              : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              exercise['icon'] as IconData,
                              color: exercise['color'] as Color,
                              size: 32,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    exercise['title'] as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    exercise['description'] as String,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Radio<Map<String, dynamic>>(
                              value: exercise,
                              groupValue: _selectedExercise,
                              onChanged: (value) {
                                setState(() {
                                  _selectedExercise = value;
                                  _resetTimer();
                                });
                              },
                              activeColor: exercise['color'] as Color,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Interactive breathing timer
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Breathing Timer',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Visual guide
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (_selectedExercise?['color'] as Color?)?.withOpacity(0.2) ?? 
                                Colors.blue.withOpacity(0.2),
                            border: Border.all(
                              color: (_selectedExercise?['color'] as Color?) ?? Colors.blue,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 130 * (_phaseIndex == 0 || _phaseIndex == 1
                                  ? 0.5 + 0.5 * _animationController.value
                                  : 1.0 - 0.5 * _animationController.value),
                              height: 130 * (_phaseIndex == 0 || _phaseIndex == 1
                                  ? 0.5 + 0.5 * _animationController.value
                                  : 1.0 - 0.5 * _animationController.value),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (_selectedExercise?['color'] as Color?) ?? Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  _getPhaseText(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Timer display
                    Text(
                      '$_secondsRemaining',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    // Cycle counter
                    Text(
                      _totalCycles > 0
                          ? 'Cycle: $_currentCycle / $_totalCycles'
                          : 'Continuous Mode',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Timer controls
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _isTimerRunning ? _stopTimer : _startTimer,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isTimerRunning
                                ? Colors.red
                                : _selectedExercise?['color'] as Color? ?? Colors.blue,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: Text(
                            _isTimerRunning ? 'Stop' : 'Start',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton(
                          onPressed: _resetTimer,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: const Text('Reset'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Soundscape selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Background Sound',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _soundscapes.map((sound) {
                      final isSelected = _selectedSoundscape == sound;
                      return ChoiceChip(
                        label: Text(sound),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedSoundscape = sound;
                          });
                        },
                        backgroundColor: Colors.grey.shade100,
                        selectedColor: (_selectedExercise?['color'] as Color?)?.withOpacity(0.2) ?? 
                            Colors.blue.withOpacity(0.2),
                      );
                    }).toList(),
                  ),
                ],
              ),
              
              const SizedBox(height: 24),
              
              // Exercise duration
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Number of Cycles',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Slider(
                    value: _totalCycles.toDouble(),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    label: _totalCycles == 0 ? 'Continuous' : _totalCycles.toString(),
                    onChanged: (double value) {
                      setState(() {
                        _totalCycles = value.toInt();
                      });
                    },
                    activeColor: _selectedExercise?['color'] as Color? ?? Colors.blue,
                  ),
                  Center(
                    child: Text(
                      _totalCycles == 0 ? 'Continuous Mode' : '$_totalCycles Cycles',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // AI Analysis button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.analytics_outlined),
                  label: const Text('YogAI Breathing Analysis'),
                  onPressed: _analyzeBreathingPattern,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String _getPhaseText() {
    switch (_phaseIndex) {
      case 0:
        return 'Inhale';
      case 1:
        return 'Hold';
      case 2:
        return 'Exhale';
      case 3:
        return 'Hold';
      default:
        return '';
    }
  }
}
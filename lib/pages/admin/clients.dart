
import 'package:flutter/material.dart';

class Clients extends StatefulWidget {
  const Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  // Mock data for clients with Kenyan names
  final List<Map<String, dynamic>> clientsList = [
    {
      'name': 'Wanjiku Kamau',
      'email': 'wanjiku.kamau@gmail.com',
      'phone': '+254 712 345 678',
      'program': 'Yoga Beginner',
      'sessions': 12,
      'nextSession': 'Tomorrow, 9:00 AM',
      'imageUrl': null, // Placeholder since we're not using real images
      'progress': 0.7,
      'notes': 'Working on flexibility. Has back issues to be mindful of.',
    },
    {
      'name': 'Otieno Ochieng',
      'email': 'otieno.och@yahoo.com',
      'phone': '+254 723 456 789',
      'program': 'Advanced Meditation',
      'sessions': 24,
      'nextSession': 'Today, 5:30 PM',
      'imageUrl': null,
      'progress': 0.9,
      'notes': 'Excellent progress with mindfulness techniques.',
    },
    {
      'name': 'Akinyi Mwangi',
      'email': 'akinyi.m@gmail.com',
      'phone': '+254 734 567 890',
      'program': 'Breathwork Therapy',
      'sessions': 8,
      'nextSession': 'Wednesday, 4:00 PM',
      'imageUrl': null,
      'progress': 0.5,
      'notes': 'Dealing with anxiety. Responds well to guided breathing.',
    },
    {
      'name': 'Njoroge Kariuki',
      'email': 'njoroge.k@outlook.com',
      'phone': '+254 745 678 901',
      'program': 'Yoga for Strength',
      'sessions': 15,
      'nextSession': 'Friday, 7:00 AM',
      'imageUrl': null,
      'progress': 0.6,
      'notes': 'Former athlete. Working on rebuilding core strength.',
    },
    {
      'name': 'Wambui Ndungu',
      'email': 'wambui.ndungu@gmail.com',
      'phone': '+254 756 789 012',
      'program': 'Mindfulness Meditation',
      'sessions': 10,
      'nextSession': 'Thursday, 6:30 PM',
      'imageUrl': null,
      'progress': 0.4,
      'notes': 'New to meditation. Shows great potential.',
    },
    {
      'name': 'Kimani Githuka',
      'email': 'kimani.g@gmail.com',
      'phone': '+254 767 890 123',
      'program': 'Vinyasa Flow',
      'sessions': 30,
      'nextSession': 'Today, 8:00 AM',
      'imageUrl': null,
      'progress': 0.85,
      'notes': 'Advanced practitioner. Working on inversions.',
    },
    {
      'name': 'Nyambura Gichuru',
      'email': 'nyambura.g@yahoo.com',
      'phone': '+254 778 901 234',
      'program': 'Stress Relief',
      'sessions': 6,
      'nextSession': 'Saturday, 10:00 AM',
      'imageUrl': null,
      'progress': 0.3,
      'notes': 'Corporate executive. Needs focus on relaxation techniques.',
    },
    {
      'name': 'Odhiambo Okello',
      'email': 'odhiambo.o@gmail.com',
      'phone': '+254 789 012 345',
      'program': 'Morning Yoga',
      'sessions': 18,
      'nextSession': 'Tomorrow, 6:00 AM',
      'imageUrl': null,
      'progress': 0.75,
      'notes': 'Consistent practitioner. Improved flexibility significantly.',
    },
    {
      'name': 'Auma Otieno',
      'email': 'auma.otieno@outlook.com',
      'phone': '+254 790 123 456',
      'program': 'Breathwork Basics',
      'sessions': 4,
      'nextSession': 'Monday, 7:30 PM',
      'imageUrl': null,
      'progress': 0.2,
      'notes': 'New client. Working on establishing routine.',
    },
    {
      'name': 'Muthoni Waiguru',
      'email': 'muthoni.w@gmail.com',
      'phone': '+254 701 234 567',
      'program': 'Full Yoga Program',
      'sessions': 22,
      'nextSession': 'Wednesday, 5:00 PM',
      'imageUrl': null,
      'progress': 0.8,
      'notes': 'Dedicated student. Interested in teacher training eventually.',
    },
  ];

  // Selected client index for detailed view
  int? _selectedClientIndex;
  
  // Search query
  String _searchQuery = '';
  
  // Filtered clients list
  List<Map<String, dynamic>> get _filteredClients {
    if (_searchQuery.isEmpty) {
      return clientsList;
    }
    return clientsList.where((client) => 
      client['name'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
      client['program'].toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Clients',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF634FBD),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {
              // Filter functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Filter options would open here'))
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {
              // Add client functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Add new client would open here'))
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFF634FBD),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search clients...',
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
              style: TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          
          // Client stats
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Color(0xFF634FBD).withOpacity(0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem('Total Clients', clientsList.length.toString()),
                _buildStatItem('Active Today', '3'),
                _buildStatItem('New This Week', '2'),
              ],
            ),
          ),
          
          // Clients list or detailed view
          Expanded(
            child: _selectedClientIndex != null 
              ? _buildClientDetailView(_filteredClients[_selectedClientIndex!])
              : _buildClientsListView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add client functionality
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Add new client would open here'))
          );
        },
        backgroundColor: Color(0xFF634FBD),
        child: Icon(Icons.person_add),
      ),
    );
  }
  
  // Stats item widget
  Widget _buildStatItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
  
  // Clients list view
  Widget _buildClientsListView() {
    return _filteredClients.isEmpty 
      ? _buildEmptyState()
      : ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: _filteredClients.length,
          itemBuilder: (context, index) {
            final client = _filteredClients[index];
            return _buildClientCard(client, index);
          },
        );
  }
  
  // Empty state when no clients match search
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_search,
            size: 80,
            color: Colors.grey.shade400,
          ),
          SizedBox(height: 16),
          Text(
            'No clients found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Try adjusting your search or add a new client',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
  
  // Client card widget
  Widget _buildClientCard(Map<String, dynamic> client, int index) {
    // Determine the color based on next session (today is highlighted)
    bool isToday = client['nextSession'].toString().toLowerCase().contains('today');
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isToday 
          ? BorderSide(color: Color(0xFF634FBD), width: 2) 
          : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedClientIndex = index;
          });
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              // Client avatar
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    client['name'].split(' ').map((name) => name[0]).join(''),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Client info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client['name'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      client['program'],
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: isToday ? Color(0xFF634FBD) : Colors.grey.shade600,
                        ),
                        SizedBox(width: 4),
                        Text(
                          client['nextSession'],
                          style: TextStyle(
                            fontSize: 12,
                            color: isToday ? Color(0xFF634FBD) : Colors.grey.shade600,
                            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Progress indicator
              Column(
                children: [
                  Text(
                    '${(client['progress'] * 100).toInt()}%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      value: client['progress'],
                      strokeWidth: 6,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF634FBD)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  // Client detail view
  Widget _buildClientDetailView(Map<String, dynamic> client) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _selectedClientIndex = null;
                  });
                },
              ),
              Text(
                'Client Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16),
          
          // Client header
          Row(
            children: [
              // Client avatar
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    client['name'].split(' ').map((name) => name[0]).join(''),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              // Client name and program
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      client['name'],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      client['program'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Contact information section
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
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF634FBD),
                  ),
                ),
                SizedBox(height: 16),
                _buildContactItem(Icons.email, 'Email', client['email']),
                SizedBox(height: 12),
                _buildContactItem(Icons.phone, 'Phone', client['phone']),
              ],
            ),
          ),
          
          SizedBox(height: 16),
          
          // Program details section
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
                  'Program Details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF634FBD),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildProgramDetail('Program', client['program']),
                    ),
                    Expanded(
                      child: _buildProgramDetail('Sessions Completed', '${client['sessions']}'),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Progress',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: client['progress'],
                  backgroundColor: Colors.grey.shade200,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF634FBD)),
                  minHeight: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${(client['progress'] * 100).toInt()}%',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF634FBD),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                _buildProgramDetail('Next Session', client['nextSession']),
              ],
            ),
          ),
          
          SizedBox(height: 16),
          
          // Notes section
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF634FBD),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Color(0xFF634FBD)),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Edit notes would open here'))
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  client['notes'],
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          
          SizedBox(height: 24),
          
          // Action buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Schedule session would open here'))
                    );
                  },
                  icon: Icon(Icons.calendar_today),
                  label: Text('Schedule Session'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF634FBD),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Message client would open here'))
                    );
                  },
                  icon: Icon(Icons.message),
                  label: Text('Message'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Color(0xFF634FBD),
                    side: BorderSide(color: Color(0xFF634FBD)),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  
  // Contact item widget
  Widget _buildContactItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  // Program detail item widget
  Widget _buildProgramDetail(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
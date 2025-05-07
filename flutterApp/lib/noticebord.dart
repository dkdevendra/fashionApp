import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notice Board App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const NoticeBoardLeaveRequestScreen(),
    );
  }
}

// ------------------------
// Leave Request Screen
// ------------------------
class NoticeBoardLeaveRequestScreen extends StatefulWidget {
  const NoticeBoardLeaveRequestScreen({Key? key}) : super(key: key);

  @override
  State<NoticeBoardLeaveRequestScreen> createState() =>
      _NoticeBoardLeaveRequestScreenState();
}

class _NoticeBoardLeaveRequestScreenState
    extends State<NoticeBoardLeaveRequestScreen> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? (startDate ?? DateTime.now())
          : (endDate ?? DateTime.now()),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  void _submitLeaveRequest() {
    if (startDate == null || endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select both dates.')),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            'Leave requested from ${startDate!.toLocal()} to ${endDate!.toLocal()}'),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Notice Board',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _selectDate(context, true),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Start Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  controller: TextEditingController(
                    text: _formatDate(startDate),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'End Date',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  controller: TextEditingController(
                    text: _formatDate(endDate),
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoticeBoardReasonScreen(),
                  ),
                );
              },
              child: const Text("Go to Reason Selection"),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitLeaveRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Request for Leave'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ------------------------
// Reason Selection Screen
// ------------------------
class NoticeBoardReasonScreen extends StatefulWidget {
  const NoticeBoardReasonScreen({Key? key}) : super(key: key);

  @override
  State<NoticeBoardReasonScreen> createState() =>
      _NoticeBoardReasonScreenState();
}

class _NoticeBoardReasonScreenState extends State<NoticeBoardReasonScreen> {
  String? selectedDropdownReason;
  final List<String> dropdownOptions = ['Reason for Optional Leave'];
  final List<String> reasons = [
    'Manpower Issue',
    'Product Issue',
    'Local Strike',
    'Manpower Issue',
    'Product Issue',
    'Local Strike',
    'Product Issue',
    'Local Strike',
  ];

  final Set<int> selectedIndices = {};

  void _toggleCheckbox(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }

  void _submitLeaveRequest() {
    if (selectedDropdownReason == null || selectedIndices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select a reason and at least one issue.')),
      );
      return;
    }

    final selectedReasons = selectedIndices.map((i) => reasons[i]).toList();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Leave requested for: ${selectedReasons.join(', ')}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5F6F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Notice Board',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFD6F3F3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: const Text('Reason for Optional Leave'),
                  value: selectedDropdownReason,
                  items: dropdownOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDropdownReason = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: reasons.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Colors.black12),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: CheckboxListTile(
                      title: Text(reasons[index]),
                      value: selectedIndices.contains(index),
                      onChanged: (_) => _toggleCheckbox(index),
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitLeaveRequest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A1A2E),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Request for Leave'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

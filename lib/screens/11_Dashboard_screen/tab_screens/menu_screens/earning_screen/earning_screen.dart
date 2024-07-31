import 'package:flutter/material.dart';
import 'package:ibiza/core/constants/constants.dart';
import 'package:ibiza/screens/11_Dashboard_screen/tab_screens/menu_screens/earning_screen/price_chart.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              20.ph,
              _buildSummary(),
              _buildChart(),
              _buildUpcomingReservations(),
              _buildPaid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Earnings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          'You\'ve made',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          '\$0.00 this month',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSummary() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Year to date summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Jan 1 - May 30, 2024',
              style: TextStyle(fontSize: 16),
            ),
            20.ph,
            _buildSummaryItem('Gross earnings', '\$0.00'),
            _buildSummaryItem('Adjustments', '\$0.00'),
            _buildSummaryItem('Service fee', '\$0.00'),
            _buildSummaryItem('Taxes withheld', '\$0.00'),
            _buildSummaryItem('Total (USD)', '\$0.00', isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, {bool isTotal = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(value, style: isTotal ? const TextStyle(fontWeight: FontWeight.bold) : null),
          ],
        ),
        8.ph,
      ],
    );
  }

  Widget _buildChart() {
    return const Card(child: LineChartSample1());
  }

  Widget _buildUpcomingReservations() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Upcoming',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'No upcoming reservations at the moment.',
            style: TextStyle(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildPaid() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paid',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            'Nothing to be paid yet.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

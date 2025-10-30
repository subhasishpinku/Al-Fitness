  import 'package:aifitness/utils/routes/routes_names.dart';
  import 'package:aifitness/viewModel/dashboardBody_viewModel.dart';
  import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
  import 'package:syncfusion_flutter_charts/charts.dart';

  class DashboardBody extends StatelessWidget {
    const DashboardBody({super.key});

    @override
    Widget build(BuildContext context) {
      final viewModel = context.watch<DashboardBodyViewModel>();

      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Week Title
                const Row(
                  children: [
                    Icon(Icons.calendar_today, size: 20),
                    SizedBox(width: 8),
                    Text(
                      "Week 1",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// Dynamic Weight Info from Provider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Current Weight:"),
                    _infoBox("${viewModel.currentWeight.toStringAsFixed(1)} kg"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Target Weight for This Week:"),
                    _infoBox("${viewModel.targetWeight.toStringAsFixed(1)} kg"),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Daily Calories for This Week:"),
                    _infoBox(
                      "${viewModel.dailyCalories.toStringAsFixed(1)} kcal/day",
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                /// Data Cards Grid
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    _DataCard(
                      title: "Enter Weight Today",
                      data: viewModel.weightData,
                    ),
                    const _DataCard(
                      title: "Enter Body Fat %",
                      data: [18, 17.8, 17.9, 17.6],
                    ),
                    const _DataCard(
                      title: "Enter Skeletal Muscle Mass",
                      data: [42, 42.2, 42.3, 42.5],
                    ),
                    const _DataCard(
                      title: "Enter Subcutaneous Fat",
                      data: [12, 11.8, 11.7, 11.9],
                    ),
                    const _DataCard(
                      title: "Enter Visceral Fat",
                      data: [8, 8, 7.9, 7.8],
                    ),
                    const _DataCard(
                      title: "Enter Body Water",
                      data: [62, 62.3, 62.5, 62.9],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Log button + Action buttons remain same
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.extraFoodIntakeScreen,
                    );
                  },
                  child: _logButton(),
                ),
                const SizedBox(height: 24),
                _infoText(),
                const SizedBox(height: 20),
                _bottomButtons(context),
              ],
            ),
          ),
        ),
      );
    }

    static Widget _infoBox(String text) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    }

    static Widget _logButton() => Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Log Today’s Extra Food Intake",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.black87),
          ),
        ],
      ),
    );

    static Widget _infoText() => const Text(
      "You can view your nutrition plan and workout schedule for today in the Nutrition and Exercise Plan.",
      style: TextStyle(fontSize: 14, color: Colors.black87),
    );

    static Widget _bottomButtons(BuildContext context) => Column(
      children: [
        const SizedBox(height: 10),
        Center(child: _button("See Exercise List")),
        const SizedBox(height: 10),
        Center(child: _button("See Your Nutrition")),
      ],
    );

    static Widget _button(String text) => SizedBox(
      width: 250,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: Colors.black),
          ),
          elevation: 0,
        ),
        onPressed: () {
         if (text == "See Exercise List") {
        // Navigator.pushNamed(context, RouteNames.exerciseListScreen);
      } else if (text == "See Your Nutrition") {
        // Navigator.pushNamed(context, RouteNames.nutritionPlanScreen);
      }
          
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }

  class _DataCard extends StatelessWidget {
    final String title;
    final List<double> data;
    const _DataCard({required this.title, required this.data});

    @override
    Widget build(BuildContext context) {
      final chartData = List.generate(
        data.length,
        (index) => _ChartData(index, data[index]),
      );

      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteNames.weightTodayScreen);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.black87,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    margin: EdgeInsets.zero,
                    primaryXAxis: NumericAxis(isVisible: false),
                    primaryYAxis: NumericAxis(isVisible: false),
                    series: <CartesianSeries<_ChartData, int>>[
                      SplineSeries<_ChartData, int>(
                        dataSource: chartData,
                        xValueMapper: (_ChartData d, _) => d.x,
                        yValueMapper: (_ChartData d, _) => d.y,
                        dashArray: const [6, 4],
                        color: Colors.black,
                        width: 2,
                        markerSettings: const MarkerSettings(
                          isVisible: true,
                          width: 10,
                          height: 10,
                          shape: DataMarkerType.circle,
                          color: Colors.black,
                        ),
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  class _ChartData {
    final int x;
    final double y;
    _ChartData(this.x, this.y);
  }

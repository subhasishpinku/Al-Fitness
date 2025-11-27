import 'package:aifitness/utils/app_colors.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!viewModel.isLoading && viewModel.currentWeight == 0) {
        context.read<DashboardBodyViewModel>().loadDashboard();
      }
    });

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<DashboardBodyViewModel>().loadDashboard();
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                // physics: const AlwaysScrollableScrollPhysics(), // <-- Required
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Week Title
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              "Week ${viewModel.weekNumber}",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // --- PROGRESS BAR ---
                        Container(
                          height: 4, // thin line
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color(
                              0x332596be,
                            ), // light background (20% opacity)
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: viewModel.weekProgress,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2),
                                color: const Color(0xFF2596BE), // Primary blue
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// Dynamic Weight Info from Provider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Current Weight:"),
                        _infoBox(
                          "${viewModel.currentWeight.toStringAsFixed(1)} kg",
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Target Weight for This Week:"),
                        _infoBox("${viewModel.targetWeight} kg"),
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
                    // GridView.count(
                    //   physics: const NeverScrollableScrollPhysics(),
                    //   shrinkWrap: true,
                    //   crossAxisCount: 2,
                    //   childAspectRatio: 1.2,
                    //   crossAxisSpacing: 10,
                    //   mainAxisSpacing: 10,
                    //   children: [
                    //     _DataCard(
                    //       title: "Enter Weight Today",
                    //       data: viewModel.weightData,
                    //     ),
                    //     const _DataCard(
                    //       title: "Enter Body Fat %",
                    //       data: [18, 17.8, 17.9, 17.6],
                    //     ),
                    //     const _DataCard(
                    //       title: "Enter Skeletal Muscle Mass",
                    //       data: [42, 42.2, 42.3, 42.5],
                    //     ),
                    //     const _DataCard(
                    //       title: "Enter Subcutaneous Fat",
                    //       data: [12, 11.8, 11.7, 11.9],
                    //     ),
                    //     const _DataCard(
                    //       title: "Enter Visceral Fat",
                    //       data: [8, 8, 7.9, 7.8],
                    //     ),
                    //     const _DataCard(
                    //       title: "Enter Body Water",
                    //       data: [62, 62.3, 62.5, 62.9],
                    //     ),
                    //   ],
                    // ),
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: [
                        // Pass API data from ViewModel
                        _DataCard(
                          title: "Enter Weight Today",
                          data: viewModel.weightData,
                          index: 0,
                        ),
                        _DataCard(
                          title: "Enter Body Fat %",
                          data: viewModel.bfpData,
                          index: 1,
                        ),
                        _DataCard(
                          title: "Enter Skeletal Muscle Mass",
                          data: viewModel.skeletalData,
                          index: 2,
                        ),
                        _DataCard(
                          title: "Enter Subcutaneous Fat",
                          data: viewModel.subcutaneousData,
                          index: 3,
                        ),
                        _DataCard(
                          title: "Enter Visceral Fat",
                          data: viewModel.visceralData,
                          index: 4,
                        ),
                        _DataCard(
                          title: "Enter Body Water",
                          data: viewModel.waterData,
                          index: 5,
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
                    // _infoText(),
                    // const SizedBox(height: 20),
                    _bottomButtons(context),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  static Widget _infoBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.dashboardColor, // <<--- BACKGROUND COLOR HERE
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.dashboardColor),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  static Widget _logButton() => Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 14),
    decoration: BoxDecoration(
      color: AppColors.dashboardColor,
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
      Center(child: _button(context, "See Exercise List")),
      const SizedBox(height: 10),
      Center(child: _button(context, "See Your Nutrition")),
      const SizedBox(height: 10),
      Center(child: _button(context, "View Fitness Network")),
    ],
  );

  static Widget _button(BuildContext context, String text) => SizedBox(
    width: 250,
    height: 45,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: AppColors.bolderColor),
        ),
        elevation: 0,
      ),
      onPressed: () {
        if (text == "See Exercise List") {
          Navigator.pushNamed(context, RouteNames.exerciseListScreen);
        } else if (text == "See Your Nutrition") {
          Navigator.pushNamed(context, RouteNames.viewPlanScreen);
        } else if (text == "View Fitness Network") {
          Navigator.pushNamed(context, RouteNames.fitNetwork);
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
  final int index; // <-- Add index
  const _DataCard({
    required this.title,
    required this.data,
    required this.index, // <-- receive index
  });

  @override
  Widget build(BuildContext context) {
    final chartData = List.generate(data.length, (i) => _ChartData(i, data[i]));

    return GestureDetector(
      onTap: () {
        // Navigate based on index
        if (index == 0) {
          Navigator.pushNamed(context, RouteNames.weightTodayScreen);
        } else if (index == 1) {
          Navigator.pushNamed(context, RouteNames.bodyFatScreen);
        } else if (index == 2) {
          Navigator.pushNamed(context, RouteNames.skeletalMuscleScreen);
        } else if (index == 3) {
          Navigator.pushNamed(context, RouteNames.subcutaneousFatScreen);
        } else if (index == 4) {
          Navigator.pushNamed(context, RouteNames.visceralFatScreen);
        } else if (index == 5) {
          Navigator.pushNamed(context, RouteNames.bodyWaterScreen);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.bolderColor),
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
            // Title
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.dashboardColor,
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
            // Chart
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(6),
            //     child: SfCartesianChart(
            //       plotAreaBorderWidth: 0,
            //       margin: EdgeInsets.zero,
            //       primaryXAxis: NumericAxis(isVisible: false),
            //       primaryYAxis: NumericAxis(isVisible: false),
            //       series: <CartesianSeries<_ChartData, int>>[
            //         SplineSeries<_ChartData, int>(
            //           dataSource: chartData,
            //           xValueMapper: (_ChartData d, _) => d.x,
            //           yValueMapper: (_ChartData d, _) => d.y,
            //           dashArray: const [6, 4],
            //           color: Colors.black,
            //           width: 2,
            //           markerSettings: const MarkerSettings(
            //             isVisible: true,
            //             width: 10,
            //             height: 10,
            //             shape: DataMarkerType.circle,
            //             color: Colors.black,
            //           ),
            //           dataLabelSettings: const DataLabelSettings(
            //             isVisible: true,
            //             textStyle: TextStyle(
            //               fontSize: 10,
            //               fontWeight: FontWeight.bold,
            //               color: Colors.black,
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            // Chart
            SizedBox(
              height: 40, // FIXED HEIGHT
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
                      color: AppColors.dashboardColor,
                      width: 2,
                      markerSettings: const MarkerSettings(
                        isVisible: true,
                        width: 8,
                        height: 8,
                        shape: DataMarkerType.circle,
                        color: Colors.black,
                      ),
                      dataLabelSettings: const DataLabelSettings(
                        isVisible: true,
                        textStyle: TextStyle(
                          fontSize: 9,
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

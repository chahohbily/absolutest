import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'report_screen.dart';
import 'cubit/cb_report_screen.dart';

class ReportScreenProvider extends StatelessWidget {
  const ReportScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CbReportScreen>(
      create: (context) => CbReportScreen(),
      child: const ReportScreen(),
    );
  }
}    
    
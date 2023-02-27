import 'dart:developer';

import 'package:absolutest/global_widgets/logo_animation.dart';
import 'package:absolutest/global_widgets/pj_app_bar.dart';
import 'package:absolutest/global_widgets/pj_button.dart';
import 'package:absolutest/global_widgets/pj_scaffold.dart';
import 'package:absolutest/global_widgets/pj_text_form_field.dart';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cubit/cb_report_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatefulWidget implements AutoRouteWrapper {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CbReportScreen>(
      create: (context) => CbReportScreen(),
      child: this,
    );
  }
}

class _ReportScreenState extends State<ReportScreen> {
  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'mp4'],
    );
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PjScaffold(
      appBar: const PjAppBar(title: 'Добавить отчет'),
      body: BlocBuilder<CbReportScreen, StReportScreen>(
        builder: (context, state) => state.when(
          loading: () => const LogoAnimation(),
          error: (code, message) => const Placeholder(),
          loaded: () => Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  PjTextFormField.big(controller: _controller),
                  const SizedBox(height: 15),
                  PjButton.project(
                    text: 'Загрузить фото',
                    onTap: _pickFiles,
                    withIcon: true,
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PjButton(
                    text: 'Отправить',
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

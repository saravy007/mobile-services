import 'package:caf/basic_app.dart';
import 'package:caf/provider/applicant_provider.dart';
import 'package:caf/settings/app_font.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ServiceListScreen extends StatefulWidget {
  const ServiceListScreen({super.key});
  @override
  State<ServiceListScreen> createState() => _ServiceListScreenState();
}
class _ServiceListScreenState extends State<ServiceListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final applicantProvider = context.read<ApplicantProvider>();
      applicantProvider.getApplicantsByUserId();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final applicantProvider = context.watch<ApplicantProvider>();

    return Scaffold(
      body: SafeArea(
         
          
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 400, // Adjust as needed
                        ),
                        child: applicantProvider.isLoading
                            ? const CircularProgressIndicator()
                            : applicantProvider.applicants.isEmpty
                                ? const Text('No applicants available.')
                                : _buildApplicantsList(applicantProvider),
                      ),
                    ),
                  ),
                ],
              ),
            ), 
      ),
    );
  }
  Widget _buildApplicantsList(ApplicantProvider applicantProvider) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: applicantProvider.applicants.length,
      itemBuilder: (context, index) {
        final applicant = applicantProvider.applicants[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(applicant.name ?? ''),
             
            tileColor: Colors.green.shade100,
          ),
        );
      },
    );
  }
}
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:getx_test/core/model/lead_model.dart';

class GetAccountVerifyLeadService {
  final String url = 'AppUrl.accountsVerifyLeadsURL';
  // final ApiService apiService = ApiService();

  Future<List<LeadModel>> fetchLeads() async {
    try {
      final response = await http.get(Uri.parse(url));
      log(url);
      log(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Access the 'data' directly as a List
        final List<dynamic> data = jsonResponse['data'];

        // Map each item in the list to LeadModel
        return data.map((item) => LeadModel.fromJson(item)).toList();
      } else {
        throw Exception(
            'Failed to load leads, status code: ${response.statusCode}');
      }
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to load leads: $e');
    }
  }
}

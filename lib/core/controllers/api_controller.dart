import 'package:get/get.dart';
import 'package:getx_test/core/model/lead_model.dart';
import 'package:getx_test/core/servcies/api_servcie.dart';

class AccountsVerifyLeadController extends GetxController {
  final GetAccountVerifyLeadService accountsVerifyLeadService;
  var leads = <LeadModel>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  AccountsVerifyLeadController(this.accountsVerifyLeadService);

  @override
  void onInit() {
    super.onInit();
    fetchLeads();
  }

  Future<void> fetchLeads() async {
    isLoading.value = true;
    try {
      leads.value = await accountsVerifyLeadService.fetchLeads();
    } catch (e) {
      errorMessage.value = 'Failed to load paid leads: $e';
    } finally {
      isLoading.value = false;
    }
  }
}

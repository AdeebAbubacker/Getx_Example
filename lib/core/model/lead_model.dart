class LeadModel {
  final String? aadharNo;
  final int? id;
  final String name;
  final String email;
  final String phone;
  final String age;
  final String? address;
  final String qualification;
  final String program;
  final String? gender;
  final String? studentType;
  final String? updatedBy;
  final String? remark;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? assignTo;
  final String? paymentStatus;
  final String? balanceAmount;
  final String? totalPaid;

  final String? fatherName;
  final String? fatherOccupation;
  final String? motherName;
  final String? motherOccupation;
  final String? interest;
  final String? religion;
  final String? status;
  final String? category;
  final String? dateOfBirth;
  final String? bloodGroup;
  final String? cast;
  final String? source;
  final String? productName;
  final String? leadStatus;
  final String? maritalStatus;
  final List<StatusModel>? statuses; // Add this field

  LeadModel({
    this.maritalStatus,
    this.interest,
    this.fatherOccupation,
    this.motherOccupation,
    this.productName,
    this.leadStatus,
    this.source,
    this.dateOfBirth,
    this.bloodGroup,
    this.cast,
    this.id,
    this.category,
    required this.aadharNo,
    required this.name,
    required this.email,
    required this.phone,
    required this.age,
    this.address,
    required this.qualification,
    required this.program,
    this.gender,
    this.studentType,
    this.updatedBy,
    this.remark,
    this.balanceAmount,
    this.paymentStatus,
    this.totalPaid,
    this.createdAt,
    this.updatedAt,
    this.assignTo,
    this.fatherName,
    this.motherName,
    this.religion,
    this.status,
    this.statuses, // Include statuses in constructor
  });

  factory LeadModel.fromJson(Map<String, dynamic> json) {
    return LeadModel(
      interest: json['training_program_interest'],
      motherOccupation: json['mother_occupation'],
      fatherOccupation: json['father_occupation'],
      aadharNo: json['aadhaar_no'] ?? 'Not given',
      productName: json['product_name'],
      leadStatus: json['lead_status'],
      cast: json['cast'],
      source: json['source'],
      bloodGroup: json['bloodGroup'],
      dateOfBirth: json['date_of_birth'],
      id: json['id'] as int?,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      age: json['age']?.toString() ?? '',
      address: json['address'] as String? ?? '',
      qualification: json['qualification'] as String? ?? '',
      program: json['program'] as String? ?? '',
      gender: json['gender'] as String?,
      studentType: json['student_type'] as String?,
      updatedBy: json['updated_by'] as String?,
      remark: json['remark'] as String? ?? 'no remarks',
      totalPaid: json['total_payed']?.toString(),
      category: json['category'] ?? '0',
      paymentStatus: json['payment_status'] as String?,
      balanceAmount: json['balance_amount']?.toString(),
      assignTo: json['assign_to'] != null
          ? int.tryParse(json['assign_to'].toString())
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,

      fatherName: json['father_name'] as String?,
      motherName: json['mother_name'] as String?,
      religion: json['religion'] as String?,
      status: json['status'] as String?,
      statuses: (json['statuses'] as List<dynamic>?)
              ?.map((e) => StatusModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // Convert list of statuses
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aadhaar_no': aadharNo ?? 'Not given',
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'age': age,
      'address': address,
      'qualification': qualification,
      'program': program,
      'product_name': productName,
      'gender': gender,
      'student_type': studentType,
      'updated_by': updatedBy,
      'remark': remark ?? 'No remarks given',
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'assign_to': assignTo?.toString(),
      'father_name': fatherName,
      'mother_name': motherName,
      'religion': religion,
      'status': status,
      'category': category ?? '0',
      'lead_status': leadStatus,
      'source': source,
      'cast': cast,
      'bloodGroup': bloodGroup,
      'date_of_birth': dateOfBirth,
      'balance_amount': balanceAmount,
      'payment_status': paymentStatus,
      'total_payed': totalPaid,
      'statuses': statuses?.map((e) => e.toJson()).toList(),
    };
  }
}

class StatusModel {
  final String status;
  final DateTime? updatedAt;
  final String remark;

  StatusModel({
    required this.status,
    this.updatedAt,
    required this.remark,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
      status: json['status'] as String? ?? '',
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'] as String)
          : null,
      remark: json['remark'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'updated_at': updatedAt?.toIso8601String(),
      'remark': remark,
    };
  }
}

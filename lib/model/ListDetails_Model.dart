class viewdetailslist {
  bool? success;
  Data? data;
  String? message;

  viewdetailslist({this.success, this.data, this.message});

  viewdetailslist.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? tourId;
  int? tourStatus;
  int? isActive;
  String? tourTitle;
  int? tourCatId;
  int? tourPartnerId;
  String? tourContact;
  String? tourEmail;
  String? tourImage;
  int? tourTotalTeam;
  Null? tourDate;
  String? tourTime;
  String? tourRegisterFees;
  String? tourGpsAddress;
  String? tourLat;
  String? tourLng;
  String? tourWinnerPrice;
  String? tourRunnerUpPrice;
  int? winnerTeamId;
  int? runnerUpTeamId;
  String? tourDescription;
  String? tourRulsRegulation;
  String? tourCreated;
  Null? tourCatName;
  Null? tourCatImage;

  Data(
      {this.tourId,
        this.tourStatus,
        this.isActive,
        this.tourTitle,
        this.tourCatId,
        this.tourPartnerId,
        this.tourContact,
        this.tourEmail,
        this.tourImage,
        this.tourTotalTeam,
        this.tourDate,
        this.tourTime,
        this.tourRegisterFees,
        this.tourGpsAddress,
        this.tourLat,
        this.tourLng,
        this.tourWinnerPrice,
        this.tourRunnerUpPrice,
        this.winnerTeamId,
        this.runnerUpTeamId,
        this.tourDescription,
        this.tourRulsRegulation,
        this.tourCreated,
        this.tourCatName,
        this.tourCatImage});

  Data.fromJson(Map<String, dynamic> json) {
    tourId = json['tour_id'];
    tourStatus = json['tour_status'];
    isActive = json['is_active'];
    tourTitle = json['tour_title'];
    tourCatId = json['tour_cat_id'];
    tourPartnerId = json['tour_partner_id'];
    tourContact = json['tour_contact'];
    tourEmail = json['tour_email'];
    tourImage = json['tour_image'];
    tourTotalTeam = json['tour_total_team'];
    tourDate = json['tour_date'];
    tourTime = json['tour_time'];
    tourRegisterFees = json['tour_register_fees'];
    tourGpsAddress = json['tour_gps_address'];
    tourLat = json['tour_lat'];
    tourLng = json['tour_lng'];
    tourWinnerPrice = json['tour_winner_price'];
    tourRunnerUpPrice = json['tour_runner_up_price'];
    winnerTeamId = json['winner_team_id'];
    runnerUpTeamId = json['runner_up_team_id'];
    tourDescription = json['tour_description'];
    tourRulsRegulation = json['tour_ruls_regulation'];
    tourCreated = json['tour_created'];
    tourCatName = json['tour_cat_name'];
    tourCatImage = json['tour_cat_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tour_id'] = this.tourId;
    data['tour_status'] = this.tourStatus;
    data['is_active'] = this.isActive;
    data['tour_title'] = this.tourTitle;
    data['tour_cat_id'] = this.tourCatId;
    data['tour_partner_id'] = this.tourPartnerId;
    data['tour_contact'] = this.tourContact;
    data['tour_email'] = this.tourEmail;
    data['tour_image'] = this.tourImage;
    data['tour_total_team'] = this.tourTotalTeam;
    data['tour_date'] = this.tourDate;
    data['tour_time'] = this.tourTime;
    data['tour_register_fees'] = this.tourRegisterFees;
    data['tour_gps_address'] = this.tourGpsAddress;
    data['tour_lat'] = this.tourLat;
    data['tour_lng'] = this.tourLng;
    data['tour_winner_price'] = this.tourWinnerPrice;
    data['tour_runner_up_price'] = this.tourRunnerUpPrice;
    data['winner_team_id'] = this.winnerTeamId;
    data['runner_up_team_id'] = this.runnerUpTeamId;
    data['tour_description'] = this.tourDescription;
    data['tour_ruls_regulation'] = this.tourRulsRegulation;
    data['tour_created'] = this.tourCreated;
    data['tour_cat_name'] = this.tourCatName;
    data['tour_cat_image'] = this.tourCatImage;
    return data;
  }
}

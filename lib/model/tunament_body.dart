// class Tunament_model {
//   String? tourTitle;
//   String? tourCatId;
//   String? tourContact;
//   String? tourEmail;
//   String? tourImage;
//   String? tourTotalTeam;
//   String? tourDate;
//   String? tourTime;
//   String? tourRegisterFees;
//   String? tourGpsAddress;
//   String? tourLat;
//   String? tourLng;
//   String? tourWinnerPrice;
//   String? tourRunnerUpPrice;
//   String? tourDescription;
//   String? tourRulsRegulation;
//
//   Tunament_model(
//       {this.tourTitle,
//         this.tourCatId,
//         this.tourContact,
//         this.tourEmail,
//         this.tourImage,
//         this.tourTotalTeam,
//         this.tourDate,
//         this.tourTime,
//         this.tourRegisterFees,
//         this.tourGpsAddress,
//         this.tourLat,
//         this.tourLng,
//         this.tourWinnerPrice,
//         this.tourRunnerUpPrice,
//         this.tourDescription,
//         this.tourRulsRegulation});
//
//   Tunament_model.fromJson(Map<String, dynamic> json) {
//     tourTitle = json['tour_title'];
//     tourCatId = json['tour_cat_id'];
//     tourContact = json['tour_contact'];
//     tourEmail = json['tour_email'];
//     tourImage = json['tour_image'];
//     tourTotalTeam = json['tour_total_team'];
//     tourDate = json['tour_date'];
//     tourTime = json['tour_time'];
//     tourRegisterFees = json['tour_register_fees'];
//     tourGpsAddress = json['tour_gps_address'];
//     tourLat = json['tour_lat'];
//     tourLng = json['tour_lng'];
//     tourWinnerPrice = json['tour_winner_price'];
//     tourRunnerUpPrice = json['tour_runner_up_price'];
//     tourDescription = json['tour_description'];
//     tourRulsRegulation = json['tour_ruls_regulation'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['tour_title'] = this.tourTitle;
//     data['tour_cat_id'] = this.tourCatId;
//     data['tour_contact'] = this.tourContact;
//     data['tour_email'] = this.tourEmail;
//     data['tour_image'] = this.tourImage;
//     data['tour_total_team'] = this.tourTotalTeam;
//     data['tour_date'] = this.tourDate;
//     data['tour_time'] = this.tourTime;
//     data['tour_register_fees'] = this.tourRegisterFees;
//     data['tour_gps_address'] = this.tourGpsAddress;
//     data['tour_lat'] = this.tourLat;
//     data['tour_lng'] = this.tourLng;
//     data['tour_winner_price'] = this.tourWinnerPrice;
//     data['tour_runner_up_price'] = this.tourRunnerUpPrice;
//     data['tour_description'] = this.tourDescription;
//     data['tour_ruls_regulation'] = this.tourRulsRegulation;
//     return data;
//   }
// }

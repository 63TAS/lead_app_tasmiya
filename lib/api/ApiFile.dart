import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<dynamic> leadsProfileData = [];
Future<List<dynamic>> getProfileData() async {
  try {
    var response = await http.get(
        Uri.parse(
          'https://b1.bhaaraterp.com/leads/api/lead-profile-update-data/?store_id=1&user_id=486',
        ),
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });

    var data = json.decode(response.body);
    print(response.body);
    leadsProfileData = data['user_profile_list_data'];
    print('leadsProfile: $leadsProfileData');
    return leadsProfileData;
  } catch (error) {
    print('Error: $error');
    rethrow;
  }
}

//patc request
Map<String, dynamic>? upadatreProfile;
Future<void> getUpdateProfile(first_name, last_name, gender, father_name,
    mother_name, dob, marital_status, current_address, xImage) async {
  try {
    var header = {'token': '6fba84eba684a66dfd52213a34327e14dfffb322'};
    var body = {
      'last_name': last_name,
      'first_name': first_name,
      'gender': gender,
      'mobile': '7007970735',
      'father_name': ' "Rajesh kumar",',
      'mother_name': ' "Shobha srivastav",',
      'current_address': ' "Lucknow"'
    };

    var request = http.MultipartRequest(
      'PATCH',
      Uri.parse(
          'https://b1.bhaaraterp.com/leads/api/lead-profile-section-update/'),
    );

    request.headers.addAll(header);
    request.fields
        .addAll(body.map((key, value) => MapEntry(key, value.toString())));
    request.files.add(await http.MultipartFile.fromPath(
        'user_profile_image', '$xImage!.path'));
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

//Create ContaCt
    Map<String, dynamic> Usercreatecontact;
    Future<Map<String, dynamic>> getcreateUsercontact() async {
      try {
        var response = await http.post(
          Uri.parse(
            'https://b1.bhaaraterp.com/leads/api/create-contact-leads/',
          ),
          headers: {
            'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
          },
          body: {
            'store_id': '1',
            'contact_owner_id': '486',
            'first_name': 'unknown',
            'email': 'tasmiya@GMAIL.COM',
            'phone': '7785840369',
            'mobile': '7785840369',
            'assistant': 'tasmiyas',
            'mailing_street': 'Gomtinagar',
            'mailing_city': 'Lucknow',
            'mailing_state': 'Uttar Pradesh',
            'description': 'hello Myself is user ',
          },
        );

        var data = json.decode(response.body);
        print(response.body);

        Usercreatecontact = data['message'];
        print('tashu# :${Usercreatecontact}');
        return Usercreatecontact;
      } catch (error) {
        print('Error: $error');
        rethrow;
      }
    }
  } catch (error) {
    print(error);
    rethrow;
  }
}

//Show cityList
List<dynamic> cityListData = [];
Future<List<dynamic>> getcityData() async {
  try {
    var response = await http.get(
      Uri.parse(
          'https://b1.bhaaraterp.com/leads/api/lead-city-list-api/?state_id=135'),
      headers: {
        'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
      },
    );

    var result = json.decode(response.body);
    cityListData = result['data'];
    print('cityList:${cityListData}');
    return cityListData;
  } catch (error) {
    print(error);
    rethrow;
  }
}

Map<String, dynamic>? showcontactlist;
Future<Map<String, dynamic>> getshowcontactListData(String id) async {
  try {
    var response = await http.get(
      Uri.parse(
          'https://b1.bhaaraterp.com/leads/api/contact/?store_id=1&user_id=486&search_value=$id'),
      headers: {
        'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
      },
    );

    var result = json.decode(response.body);
    showcontactlist = result;
    print('hello tasmiya Devlops:${showcontactlist}');
    return showcontactlist!;
  } catch (error) {
    print(error);
    rethrow;
  }
}

//get countrydata
List<dynamic> countryData = [];
Future<List<dynamic>> getcountryData() async {
  try {
    var response = await http.get(
        Uri.parse('https://b1.bhaaraterp.com/leads/api/lead-country-list-api/'),
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });

    var data = json.decode(response.body);
    print(response.body);
    countryData = data['serializer_data'];
    print('taasmiya hello ${countryData}');
    return countryData;
  } catch (error) {
    print(error);
    rethrow;
  }
}
//city api

List<dynamic> cityData = [];
Future<List<dynamic>> getcity() async {
  try {
    var response = await http.get(
        Uri.parse(
            'https://b1.bhaaraterp.com/leads/api/lead-city-list-api/?state_id=135'),
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });

    var data = json.decode(response.body);
    print(response.body);
    cityData = data['data'];
    print('taasmiya friends ${cityData}');
    return cityData;
  } catch (error) {
    print(error);
    rethrow;
  }
}

//state api
List<dynamic> stateData = [];
Future<List<dynamic>> getstate() async {
  try {
    var response = await http.get(
        Uri.parse(
            'https://b1.bhaaraterp.com/leads/api/lead-state-list-api/?country_id=10'),
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });
    var data = json.decode(response.body);
    print(response.body);
    stateData = data['data'];
    print('taasmiya developer: ${stateData}');
    return stateData;
  } catch (error) {
    print(error);
    rethrow;
  }
}

Map<String, dynamic>? searchData;
Future<Map<String, dynamic>> getsearchData(String query) async {
  try {
    var response = await http.get(
        Uri.parse(
            'https://b1.bhaaraterp.com/leads/api/contact/?store_id=1&user_id=486&search_value=$query'),
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });

    var data = json.decode(response.body);
    print(response.body);
    searchData = data;
    print('fLUTTER: ${searchData}');
    return searchData!;
  } catch (error) {
    print(error);
    rethrow;
  }
}

//new filters
List<dynamic> newFiltersData = [];
Future<List<dynamic>> getFilterData(
  check_first_name,
  check_last_name,
  check_assistant,
  check_secondary_email,
  check_twitter,
  check_phone_number,
  check_fax,
  check_skype_id,
) async {
  try {
    print(' check_first_name  ${check_first_name}');
    var response = await http.post(
        Uri.parse('https://b1.bhaaraterp.com/leads/api/contact_filter_data/'),
        body: {
          'store_id': '1',
          'user_id': '486',
          'check_first_name': check_first_name,
          'check_last_name': check_last_name,
          'check_assistant': check_assistant,
          'check_secondary_email': check_secondary_email,
          'check_twitter': check_twitter,
          'check_phone_number': check_phone_number,
          'check_fax': check_fax,
          'check_skype_id': check_skype_id,
        },
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });
    print(response.body);
    var result = json.decode(response.body);
    print(response.body);
    newFiltersData = result['data'];
    print('Tasmiya filters :${newFiltersData}');
    return newFiltersData;
  } catch (error) {
    print(error);
    rethrow;
  }
}

//favorites api
List<dynamic> favoritesData = [];
Future<List<dynamic>> getfavroites() async {
  try {
    var response = await http.get(
        Uri.parse(
            'https://b1.bhaaraterp.com/leads/api/fav-contact-list/?store_id=1&user_id=486'),
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });

    var data = json.decode(response.body);
    print(response.body);
    favoritesData = data['data'];
    print(' favoirtes: ${favoritesData}');
    return favoritesData;
  } catch (error) {
    print(error);
    rethrow;
  }
}

//delete list
List<dynamic> removeData = [];
Future<List<dynamic>> getRemove() async {
  try {
    var response = await http.get(
        Uri.parse(
            'https://b1.bhaaraterp.com/leads/api/fav-contact-list/?store_id=1&user_id=486'),
        headers: {
          'token': '6fba84eba684a66dfd52213a34327e14dfffb322',
        });

    var data = json.decode(response.body);
    print(response.body);
    removeData = data['data'];
    print(' remove: ${removeData}');
    return removeData;
  } catch (error) {
    print(error);
    rethrow;
  }
}

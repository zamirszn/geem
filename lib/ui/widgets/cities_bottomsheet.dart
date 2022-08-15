import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geem/network/internet_connectivity.dart';
import 'package:geem/services/forecast_requests.dart';
import 'package:geem/util/api_key.dart';
import 'package:geem/util/colors.dart';
import 'package:geem/util/constants.dart';
import 'package:geem/util/converters.dart';
import 'package:geem/util/list_of_countries.dart';
import 'package:intl/intl.dart';

Future<void> showCitiesBottomSheet(BuildContext context, Size deviceScreen) {
  return showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const BottomSheetContainer();
      });
}

class BottomSheetContainer extends StatefulWidget {
  const BottomSheetContainer({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

final citiesTextFieldController = TextEditingController();

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  @override
  @override
  Widget build(BuildContext context) {
    final Size deviceScreen = MediaQuery.of(context).size;
    return Container(
      height: deviceScreen.height * 0.8,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: geemBlackBlue,
        border: Border.all(
          width: 5,
          color: Colors.transparent,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Center(
                child: SizedBox(
                    width: 50,
                    height: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {});
              },
              controller: citiesTextFieldController,
              onEditingComplete: () =>
                  searchCityName(citiesTextFieldController.text),
              autofocus: false,
              cursorColor: Colors.white,
              maxLength: 50,
              decoration: InputDecoration(
                hintText: "  Search for any city or country",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: IconButton(
                  onPressed: () =>
                      searchCityName(citiesTextFieldController.text),
                  icon: const Icon(
                    Icons.search,
                  ),
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: appColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(
                      width: 1, style: BorderStyle.solid, color: Colors.white),
                ),
                counterStyle: const TextStyle(color: Colors.white),
                focusColor: Colors.white,
                contentPadding: const EdgeInsets.all(5.0),
                suffixIcon: IconButton(
                  onPressed: () => citiesTextFieldController.clear(),
                  icon: const Icon(Icons.close_rounded),
                  color: Colors.red,
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: deviceScreen.height * 0.6,
              child: Scrollbar(
                interactive: true,
                radius: const Radius.circular(20),
                child: citiesSuggestion(citiesTextFieldController.text),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<String> data = countries;

  ListView citiesSuggestion(query) {
    List<String> listToShow;
    if (query.isNotEmpty) {
      listToShow = data
          .where((e) =>
              e.toLowerCase().contains(query.toLowerCase()) &&
              e.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      setState(() {});
    } else {
      listToShow = data;
    }

    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          String city = listToShow[index];
          return ListTile(
            onTap: () {
              searchCityName(city);
            },
            title: Text(
              city,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: listToShow.length);
  }

  void searchCityName(String city) {
    // easteregg
    if (city == "zamirszn") {
      showNotificaton("You found my location :)");
      return;
    } else if (city == "") {
      forecastError("Please enter some text");
      return;
    }
    String currentUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";
    String hourlyUrl =
        "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric&cnt=$daysCount";

    try {
      showNotificaton("Getting forecast for $city");

      ForeCastRequest().getCurrentWeather(currentUrl).then((weather) {
        currentWeather = weather;
      });

      ForeCastRequest().getHourlyForeCast(hourlyUrl).then((forecasts) {
        hourlyForecasts = forecasts;
      });
      Navigator.pop(context);
      cityName.value = toBeginningOfSentenceCase(city)!;

    } catch (error) {
      forecastError("Error getting information");
      if (kDebugMode) {
        print(error);
      }
    }
  }
}

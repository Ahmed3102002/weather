import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather/components/methods.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubit.dart';
import 'package:weather/model/weather_model.dart';
import 'package:weather/widgets/appBarStyle.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherModel weather =
        BlocProvider.of<GetWeatherCubit>(context).weather!;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              getWeatherImage(weather.weatherState),
            ),
            fit: BoxFit.fitHeight),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.02,
            vertical: MediaQuery.sizeOf(context).width * 0.07), //8
        child: Column(
          children: [
            const AppBarStyle(),
            const Spacer(
              flex: 1,
            ),
            Text(
              weather.currentCity,
              style: GoogleFonts.alkalami(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              textAlign: TextAlign.center,
              //',
              '${weather.currentRegion} , ${weather.currentCountry}\n Updated at : ${DateFormat('hh:mm a').format(weather.lastUpdated)} \n ${weather.date}',
              style: GoogleFonts.alkalami(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  width: MediaQuery.sizeOf(context).width * 0.2, //100
                  height: MediaQuery.sizeOf(context).height * 0.12, //100
                  weather.weatherImage.contains("https:")
                      ? weather.weatherImage
                      : "https:${weather.weatherImage}",
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                ),
                Text(
                  '${weather.temp.round()}',
                  style: GoogleFonts.alkalami(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.18,
                ),
                Text(
                  'Max-temp ${weather.maxTemp.round()}\n Min-temp ${weather.minTemp.round()}',
                  style:
                      GoogleFonts.alkalami(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.06,
            ),
            Text(
              weather.weatherState,
              style: GoogleFonts.alkalami(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

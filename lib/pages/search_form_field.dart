import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather/components/methods.dart';
import 'package:weather/cubits/get_weather_cubits/weather_cubit.dart';

class SearchFormPage extends StatelessWidget {
  SearchFormPage({super.key});

  TextEditingController controller = TextEditingController();
  EdgeInsets edgeInsets =
      const EdgeInsets.symmetric(horizontal: 16, vertical: 16);

  @override
  Widget build(BuildContext context) {
    GetWeatherCubit weatherCubit = BlocProvider.of<GetWeatherCubit>(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  getWeatherImage(weatherCubit.weather?.weatherState),
                ),
                fit: BoxFit.fitHeight),
          ),
          padding: edgeInsets,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                  ),
                  Text(
                    'Search Weather',
                    style:
                        GoogleFonts.alkalami(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              TextField(
                onSubmitted: (city) {
                  weatherCubit.newWeather();
                  weatherCubit.getWeather(city: city);
                  Navigator.pop(context);
                },
                style: GoogleFonts.alkalami(fontSize: 20, color: Colors.white),
                controller: controller,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  labelText: 'Search',
                  labelStyle:
                      GoogleFonts.alkalami(fontSize: 20, color: Colors.white),
                  hintText: 'Enter City Name ...',
                  hintStyle:
                      GoogleFonts.alkalami(fontSize: 20, color: Colors.white),
                  contentPadding: edgeInsets,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  //prefixIconColor: Colors.white,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

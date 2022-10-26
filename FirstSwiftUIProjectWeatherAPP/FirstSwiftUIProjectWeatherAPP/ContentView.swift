//
//  ContentView.swift
//  FirstSwiftUIProjectWeatherAPP
//
//  Created by Bobomurod Ergashev on 30/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            GradientLayer(topColor: isNight ? .black : .blue,
                          bottomColor: isNight ? .gray : .white)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temperature: 76)
//                .padding(.bottom, 40)
                HStack(spacing: 20){
                    WeatherDayView(dayOfTheWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfTheWeek: "WED", imageName: "sun.max.fill", temperature: 70)
                    WeatherDayView(dayOfTheWeek: "THU", imageName: "wind.snow", temperature: 60)
                    WeatherDayView(dayOfTheWeek: "FRI", imageName: "sunset.fill", temperature: 45)
                    WeatherDayView(dayOfTheWeek: "SAT", imageName: "snow", temperature: 45)
                    
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfTheWeek : String
    var imageName : String
    var temperature : Int
    var body: some View {
        VStack {
            Text(dayOfTheWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)C")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
            
        }
        
    }
}

struct GradientLayer: View {
    var topColor : Color
    var bottomColor : Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}


struct CityTextView : View {
    var cityName : String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}


struct MainWeatherStatusView : View {
    var imageName : String
    var temperature: Int
    var body: some View {
        VStack(spacing : 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)C")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


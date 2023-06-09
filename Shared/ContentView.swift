//
//  ContentView.swift
//  Shared
//
//  Created by Eli Raney on 6/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var dayMode: Bool = true
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: dayMode ? .blue : .black,
                           bottomColor: dayMode ? Color("lightBlue") : .gray)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                   
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 10) {
                    WeatherDayView(day: "TUE", symbol: "cloud.rain.fill", degrees: "75°")
                    WeatherDayView(day: "WED", symbol: "cloud.hail.fill", degrees: "63°")
                    WeatherDayView(day: "THU", symbol: "wind", degrees: "74°")
                    WeatherDayView(day: "FRI", symbol: "wind.snow", degrees: "50°")
                    WeatherDayView(day: "SAT", symbol: "cloud.snow.fill", degrees: "56°")
                    WeatherDayView(day: "SUN", symbol: "sun.max.fill", degrees: "105°")
                }
                
                Spacer()
                
                Button {
                    dayMode.toggle()
                    print("tapped")
                } label: {
                    WeatherButton(title: dayMode ? "Change Night Time" : "Change Day Time", textColor: .blue, backgroundColor: .white)
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
    var day: String
    var symbol: String
    var degrees: String
    
    var body: some View {
        VStack {
            Text(day)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: symbol)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text(degrees)
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor,bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {

    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}



//
//  CurrentWeatherView.swift
//  Test App
//
//  Created by Meghana Joshi on 18/03/23.
//


import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var weatherViewModel: WeatherViewModel
    
    var body: some View {
        VStack(spacing: Constants.Dimensions.firstSpacing) {
            AsyncImage(url: URL(string: Constants.Strings.imageBaseUrl+weatherViewModel.weatherIcon+".png"))
                .scaledToFill()
                .frame(width: Constants.Dimensions.defaultWidth,
                       height: Constants.Dimensions.defaultHeight,
                       alignment: .center)
            HStack(spacing: Constants.Dimensions.secondSpacing) {
                VStack(alignment: .center) {
                    HStack {
                        Text(weatherViewModel.city)
                    }
                    Text("\(weatherViewModel.temperature)°C")
                        .font(.system(size: Constants.Font.largeSize))
                        .multilineTextAlignment(.center)
                    Text(weatherViewModel.conditions.localizated())
                        .font(.system(size: Constants.Font.mediumSize))
                }
            }
            HStack {
                Spacer()
                WidgetView(image: Constants.Images.wind,
                           text: Constants.Strings.windSpeed.localizated(),
                           title: "\(weatherViewModel.windSpeed) m/s")
                Spacer()
                WidgetView(image: Constants.Images.humidity,
                           text: Constants.Strings.humidity.localizated(),
                           title: "\(weatherViewModel.humidity)")
                Spacer()
                WidgetView(image: Constants.Images.umbrella,
                           text: Constants.Strings.rainChances.localizated(),
                           title: "\(weatherViewModel.rainChances)")
                Spacer()
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(
            RoundedRectangle(cornerRadius: Constants.Dimensions.cornerRadius)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: Constants.Colors.gradient),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
    
    private func WidgetView (image: String,
                             text: String,
                             title: String) -> some View {
        VStack {
            Text(text)
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: Constants.Dimensions.defaultWidth,
                       height: Constants.Dimensions.defaultHeight,
                       alignment: .center)
            Text(title)
        }
        .font(.system(size: Constants.Font.smallSize))
    }
}

struct CurrentlyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView(weatherViewModel: WeatherViewModel())
    }
}

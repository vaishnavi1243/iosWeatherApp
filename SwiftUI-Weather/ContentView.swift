import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    @State private var showWeatherView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : .white)
                VStack {
                    if !showWeatherView {
                        // Welcome Screen
                        Text("Hey, Welcome!")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                        
                        Button(action: {
                            showWeatherView.toggle()
                        }) {
                            Text("Go to Weather")
                                .font(.title)
                                .foregroundColor(.blue)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    } else {
                        // Weather Update Screen
                        VStack {
                            CityTextView(cityName: "Cupertino, CA")
                            MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 70)
                            HStack(spacing: 20) {
                                WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                                WeatherDayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 88)
                                WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temperature: 55)
                                WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temperature: 60)
                                WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 25)
                            }
                            Spacer()
                            Button(action: {
                                isNight.toggle()
                            }) {
                                WeatherButtton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}



struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design:.default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}

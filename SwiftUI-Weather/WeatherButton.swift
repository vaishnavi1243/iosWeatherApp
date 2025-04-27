//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Divami on 27/04/25.
//

import SwiftUI

struct WeatherButtton: View {
    var title: String
    var textColor: Color
    var  backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(Color.white)
            .font(.system(size: 20, weight: .bold,design: .default))
            .cornerRadius(10)
    }
}

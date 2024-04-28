//
//  PrimaryCircleButton.swift
//  ParkReminder
//
//  Created by Dimitri Brukakis on 08.11.23.
//

import SwiftUI

struct CirclePrimaryButton: View {
    let image: Image
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack {
                image
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .tint(Color.textOnButtonPrimary)
                    .frame(height: 22)
            }
            .frame(minWidth: 44, minHeight: 44)
            .background(Circle()
                .foregroundColor(Color.buttonPrimary)
                .shadow(type: .card))
        }
    }
}

struct CirclePrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CirclePrimaryButton(image: Image("iconCar"), action: {})
        }
    }
}

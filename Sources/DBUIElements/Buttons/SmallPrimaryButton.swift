//
//  SmallButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 22.09.23.
//

import SwiftUI

struct SmallPrimaryButton: View {
    let label: String
    let action: (() -> Void)
    var body: some View {
        Button(action: action) {
            VStack {
                Text(label)
                    .foregroundColor(Color.textOnButtonPrimary)
                    .textStyle(.smallButton)
            }
            .frame(minHeight: 24)
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .background(Color.buttonPrimary)
            .cornerRadius(90, corners: [.allCorners])
        }
    }
}

struct SmallPrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallPrimaryButton(label: "Small Button", action: {})
    }
}

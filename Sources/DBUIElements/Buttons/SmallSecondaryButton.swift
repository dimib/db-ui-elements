//
//  SmallSecondaryButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 22.09.23.
//

import SwiftUI

struct SmallSecondaryButton: View {
    let label: String
    let action: (() -> Void)
    var body: some View {
        Button(action: action) {
            ZStack {
                Text(label)
                    .textStyle(.smallButton)
                    .foregroundColor(Color.buttonPrimary)
            }
            .frame(minHeight: 20)
            .background(Color.clear)
            .padding(.horizontal, 16)
            .padding(.vertical, 4)
            .overlay {
                RoundedRectangle(cornerRadius: 90)
                    .stroke(Color.buttonPrimary, lineWidth: 2)
            }
        }
    }
}

struct SmallSecondaryButton_Previews: PreviewProvider {
    static var previews: some View {
        SmallSecondaryButton(label: "Small Secondary Button", action: {})
    }
}

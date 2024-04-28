//
//  SmallButton.swift
//  Zora
//
//  Created by Dimitri Brukakis on 21.09.23.
//

import Foundation
import SwiftUI

struct TertiaryButton: View {
    let label: String
    let action: (() -> Void)
    var body: some View {
        Button(action: action) {
            VStack {
                Text(label)
                    .foregroundColor(Color.textOnButtonTertiary)
                    .textStyle(.button2)
            }
            .frame(maxWidth: .infinity, minHeight: 16)
            .padding(2)
            .background(.buttonTertiary)
        }
    }
}

struct TertiaryButton_Previews: PreviewProvider {
    static var previews: some View {
        TertiaryButton(label: "Hallo", action: {})
    }
}

//
//  SwiftUIView.swift
//  
//
//  Created by Dimitri Brukakis on 14.05.24.
//

import SwiftUI

struct FlyoutButton: View {
    @State var expanded = false
    @State var offset = Self.collapsedOffsets
    @State var opacity: Double = 0.0
    @State var buttonImage: Image = Self.collapsedImage

    private var buttonColor = Color.blue
    private var textColor = Color.white
    private var shadowColor = Color.gray
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                FlyoutItemButton(title: "Add", icon: "plus") {
                    toggle()
                }
                .offset(offset[2])
                
                FlyoutItemButton(title: "Scan", icon: "camera") {
                    toggle()
                }
                .offset(offset[1])
                
                FlyoutItemButton(title: "Search", icon: "magnifyingglass") {
                    toggle()
                }
                .offset(offset[0])
            }
            .frame(alignment: .trailing)
            .opacity(opacity)
            
            HStack(alignment: .bottom){
                Spacer()
                Button(action: toggle) {
                    VStack {
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(textColor)
                            .rotationEffect(.degrees(expanded ? -45 : 0))
                    }
                }
                .buttonStyle(FlyoutButtonStyle())
            }
            .frame(width: 64, height: 64)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
        .padding(.trailing, 24)
        .background(.white)
    }
    
    private func toggle() {
        withAnimation {
            expanded.toggle()
            if expanded {
                offset = Self.expandedOffsets
                opacity = 1.0
                buttonImage = Self.expandedImage
            } else {
                offset = Self.collapsedOffsets
                opacity = 0.0
                buttonImage = Self.collapsedImage
            }
        }
    }
    
    private static var expandedOffsets: [CGSize] {
        [CGSize(width: -10, height: -140),
         CGSize(width: -10, height: -100),
         CGSize(width: -10, height: -60)]
    }
    private static var collapsedOffsets: [CGSize] {
        [CGSize(width: 0, height: 0),
         CGSize(width: 0, height: 0),
         CGSize(width: 0, height: 0)]
    }
    private static var expandedImage: Image {
        Image(systemName: "minus")
    }
    private static var collapsedImage: Image {
        Image(systemName: "plus")
    }

}

struct FlyoutItemButton: View {
    let title: String
    let icon: String
    let action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            Label(
                title: { Text(title)},
                icon: { Image(systemName: icon) }
            )
            .font(.title2)
            .fontWeight(.bold)
        }
        .buttonStyle(FlyoutItemButtonStyle())
    }
}

struct FlyoutButtonButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .trailing) {
            Spacer()
            
            FlyoutButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(.white)
    }
}

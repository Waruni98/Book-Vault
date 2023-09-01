//
//  SwiftUIView.swift
//  Bookvault
//
//  Created by waruni on 2023-06-16.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("cover")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                Spacer()
                NavigationLink(destination: ContentView()) {
                    Text("Click to Read")
                    .frame(minWidth: 0, maxWidth: 300)
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(40)
                    .font(.title)
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}


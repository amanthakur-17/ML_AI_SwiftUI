//
//  ContentView.swift
//  ML_AI_SwiftUI
//
//  Created by Aman on 29/07/25.
//


import SwiftUI


struct MainView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 50) {
                Text("Tap to select a sign to translate")
                    .font(.headline)
                
                ImageGalleryView()
                
                Spacer()
                
            }
            .trailTheme()
            .navigationTitle("Sign Decoder")
        }
    }
}


#Preview {
    MainView()
}


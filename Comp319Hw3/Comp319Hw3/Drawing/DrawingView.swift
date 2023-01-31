//
//  ContentView.swift
//  Comp319Hw3
//
//  Created by BURAK on 1.01.2023.
//

import SwiftUI

struct DrawingView: View {
    @StateObject private var viewModel = DrawingViewModel()
    @State private var infoPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text(viewModel.name1)
                    .padding(20)
                    .padding(.top, 40)
                Text(viewModel.name2)
                    .padding(20)
                Text(viewModel.name3)
                    .padding(20)
                Spacer()
                drawButton
                Spacer()
                bottomBar
            }
            .sheet(isPresented: $infoPresented, content: {
                InfoView()
            })
            .navigationTitle("Drawing App")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var drawButton: some View {
        Button(action: {
            viewModel.drawNames()
        }, label: {
            Text(viewModel.drawButtonTitle)
                .padding(25)
        })
        .background(Color.blue)
        .cornerRadius(10)
        .foregroundColor(.white)
    }
    
    private var bottomBar: some View
    {
        HStack {
            Button("INFO") {
                infoPresented.toggle()
            }

        }
        .padding(20)
        
    }
}

struct DrawingView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingView()
    }
}

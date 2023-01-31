//
//  InfoView.swift
//  Comp319Hw3
//
//  Created by BURAK on 2.01.2023.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Burak Yıldırım")
                    .padding(20)
                Text("72849")
                    .padding(5)
            }
            .navigationTitle("Info")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

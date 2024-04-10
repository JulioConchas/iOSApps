//
//  ContentView.swift
//  I am Rich SwiftUI
//
//  Created by Julio Conchas on 03/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemTeal)
            Text("I Am Rick")
                .font(.system(size: 40))
        }
    }
}

#Preview {
    ContentView().previewDevice(PreviewDevice(rawValue: "iPhone SE"))
}

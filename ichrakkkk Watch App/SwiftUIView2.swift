//
//  SwiftUIView2.swift
//  ichrakkkk Watch App
//
//  Created by Ichrak El Hatimi on 2023-01-22.
//

import SwiftUI

struct SwiftUIView2: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Here's your recorded meeting: ")
            Image("audioich")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
    }
}

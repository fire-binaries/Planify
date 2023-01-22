//
//  SwiftUIView.swift
//  ichrakkkk Watch App
//
//  Created by Ichrak El Hatimi on 2023-01-22.
//

import SwiftUI

struct Person: Identifiable {
    var id = UUID()
    var name: String
}

struct SwiftUIView: View {
    let people = [Person(name: "Daily work meeting"), Person(name: "Coop meeting"), Person(name: "meeting with boss"), Person(name: "CSI lecture"),Person(name: "SEG lecture")]
    var body: some View {
        NavigationView {
            List {
                ForEach(people) { person in
                    NavigationLink(destination: ContentView()) {
                        Text(person.name)
                    }
                }
            }
            .navigationBarTitle("Schedule")
        }
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

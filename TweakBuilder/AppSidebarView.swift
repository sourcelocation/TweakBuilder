//
//  ContentView.swift
//  TweakBuilder
//
//  Created by exerhythm on 16.05.2022.
//

import SwiftUI

struct AppSidebarView: View {
    @State private var selectedSectionTitle: String? = "Hooks"
    
    private var sections: [Section] = [
        .init(imageName: "link", title: "Hooks", description: "Edit tweak hooks"),
        .init(imageName: "swift", title: "SwiftUI", description: "Create SwiftUI views"),
        .init(imageName: "building.columns", title: "Libraries", description: "Add libraries to the tweak"),
        .init(imageName: "dollarsign.square", title: "Theos", description: "Export to Theos project and SDKs"),
        .init(imageName: "plus", title: "Plugins", description: "Download community made plugins"),
        .init(imageName: "paperclip", title: "Resources", description: "Images, icon, JSON etc."),
        .init(imageName: "gearshape", title: "Settings", description: "Edit project name, description"),
    ]
    
    struct Section: Identifiable {
        var id = UUID()
        var imageName: String
        var title: String
        var description: String
    }
    
    struct Row: View {
        @State var selected: Bool
        var section: Section
        
        var body: some View {
            HStack {
                Image(systemName: section.imageName)
                    .foregroundColor(.blue)
                    .font(.title3)
                VStack(alignment: .leading) {
                    Text(section.title)
                    Text(section.description)
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sections, id: \.title) { section in
                    NavigationLink(destination: ClassesView(), tag: section.title, selection: $selectedSectionTitle) {
                        Row(selected: selectedSectionTitle == section.title, section: section)
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("My Tweak")

        }
    }
}

@available(iOS 15.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

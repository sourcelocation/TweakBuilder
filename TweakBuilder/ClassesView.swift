//
//  ClassesView.swift
//  TweakBuilder
//
//  Created by exerhythm on 16.05.2022.
//

import SwiftUI

struct ClassesView: View {
    let classes: [iOSClass] = {
        (try? JSONDecoder().decode([iOSClass].self, from: Data(contentsOf: Bundle.main.url(forResource: "Layout.json", withExtension: nil)!))) ?? []
    }()
    
    var body: some View {
        ClassesList(classes: classes)
        .navigationTitle("Classes")
    }
}

struct ClassesList: View {
    struct ClassLabel: View {
        var `class`: iOSClass
        var body: some View {
            Label(`class`.name ?? `class`.className, systemImage: `class`.icon ?? "app.dashed")
        }
    }
    let classes: [iOSClass]
    
    var body: some View {
        List {
            ForEach(classes) { `class` in
                DisclosureGroup {
                    if let layout = `class`.layout {
                        ClassesList(classes: layout)
                    } else {
                        ClassLabel(class: `class`)
                    }
                } label: {
                    ClassLabel(class: `class`)
//                    Text()
                }
            }
        }
    }
}

@available(iOS 15.0, *)
struct ClassesView_Previews: PreviewProvider {
    static var previews: some View {
        AppSidebarView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

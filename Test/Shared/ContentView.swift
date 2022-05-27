//
//  ContentView.swift
//  Shared
//
//  Created by 이정찬 on 2022/05/27.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: testDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(testDocument()))
    }
}

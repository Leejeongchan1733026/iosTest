//
//  testApp.swift
//  Shared
//
//  Created by 이정찬 on 2022/05/27.
//

import SwiftUI

@main
struct testApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: testDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}

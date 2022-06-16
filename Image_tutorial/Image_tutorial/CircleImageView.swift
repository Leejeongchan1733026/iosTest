//
//  CircleImageView.swift
//  Image_tutorial
//
//  Created by 이정찬 on 2022/06/16.
//

import SwiftUI

struct CircleImageView : View {
    var body: some View {
        Image(systemName: "flame.fill")
            .font(.system(size: 200))
            .foregroundColor(.yellow)
            .shadow(color: .gray, radius: 2, x: 4, y: 20)
    }
}

struct CircleImagePreviews : PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}


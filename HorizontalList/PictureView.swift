//
//  PictureView.swift
//  HorizontalList
//
//  Created by Namrata Jain on 28/07/20.
//  Copyright © 2020 Namrata Jain. All rights reserved.
//

import SwiftUI

struct PictureView: View {
  var sceneName: String
  
    var body: some View {
      Image(sceneName).resizable().frame(width: 120.0, height: 180.0).cornerRadius(10).shadow(radius: 5)
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
      PictureView(sceneName: "Beach1")
    }
}

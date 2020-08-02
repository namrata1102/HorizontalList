//
//  ContentView.swift
//  HorizontalList
//
//  Created by Namrata Jain on 28/07/20.
//  Copyright © 2020 Namrata Jain. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @State var sceneArr = ["Beach1", "Beach2", "Ship", "Sunrise", "Sunset", "Sunset2"]
  var thoughtsArr = ["Everything in the world is temporary emotions, people and scenery. Do noy become attached just flow with it.", "Nothing is beyond the realm of possibility. There are no limitations except the limits of your imagination.", "Look back in forgivness, forward in hope, down with compassion and up with attitude.", "Life is like Ocean, it can be cool and clam or rigid and rough but in the end it's always beautiful.", "Look back in forgivness, forward in hope, down with compassion and up with attitude.", "When you arise in the morning, think of the precious privelage it is to be alive."]
  @State var blurVal = 0
  
  @State var selectedSceneIndex = 0
  @State var scaleOffset = 1.0
  
    var body: some View {
      VStack(alignment: .leading) {
        Text("Choose Wallpaper of your choice").font(Font.system(size: 24).bold()).padding(.leading)
        Text("\(sceneArr.count) Wallpapers").font(.subheadline).padding(.leading)
        Spacer().frame(height: 30)
        Text("Thought").fontWeight(.bold).padding(.leading).font(.subheadline)
        Text("\(thoughtsArr[self.selectedSceneIndex])").blur(radius: CGFloat(blurVal))
          .padding()
        
        VStack() {
          ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
              ForEach(sceneArr.indices, content: {
                index in
                PictureView(sceneName: self.sceneArr[index]).padding(10).gesture(TapGesture(count: 1).onEnded({
                  _ in
                  self.selectedSceneIndex = index
                  self.blurVal = 5
                  withAnimation(.linear(duration: 0.5)) {
                    self.blurVal = 0
                  }

                }))
                  .scaleEffect(self.selectedSceneIndex == index ? 1.12 : 1.0).animation(.default)
              })
            }
          }).padding(.bottom, 40.0)
          Image(sceneArr[selectedSceneIndex]).resizable().frame(width: 400.0, height: 300.0).blur(radius: CGFloat(blurVal))

        }
      }
      .background(Color(red: 0.965, green: 0.965, blue: 0.965))
  }

  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  PlayerView.swift
//  ShortVideoApp
//
//  Created by yuhyeonjae on 2022/03/03.
//

import SwiftUI
import AVKit

struct PlayerView: View {
    
    @Binding var data: [VideoVM]
    
    var body: some View {
        
        VStack(spacing: 0) {
            ForEach(0..<self.data.count) { index in
                
                ZStack {
                    Player(player: self.data[index].player)
                    // 페이징 처리를 위해 풀 사이즈
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    
                    if self.data[index].replay {
                        Button {
                            self.data[index].replay = false
                            self.data[index].player.seek(to: .zero)
                            self.data[index].player.play()
                        } label: {
                            Image(systemName: "goforward")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.data[0].player.play()
            self.data[0].player.actionAtItemEnd = .none
            
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.data[0].player.currentItem, queue: .main) { _ in
                self.data[0].replay = true
            }
        }
        .ignoresSafeArea()
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(data: .constant([]))
    }
}

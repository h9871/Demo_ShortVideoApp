//
//  HomeView.swift
//  ShortVideoApp
//
//  Created by yuhyeonjae on 2022/03/03.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
    /// 비디오 데이터
    @State var data = [
        VideoVM(id: 0, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "clouds", ofType: "mp4")!)), replay: false),
        VideoVM(id: 1, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "robin", ofType: "mp4")!)), replay: false),
        VideoVM(id: 2, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Seoul", ofType: "mp4")!)), replay: false),
        VideoVM(id: 3, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Skyscrapers", ofType: "mp4")!)), replay: false),
        VideoVM(id: 4, player: AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "Star", ofType: "mp4")!)), replay: false)
    ]

    var body: some View {
        ZStack {
            /// 전체적으로 스크롤 비디오 뷰 할당
            PlayerScrollView(data: self.$data)
            
            /// 각 버튼 뷰 설정
            VStack {
                // 1. 탑 메뉴 뷰
                TopMenuView()

                Spacer()
                
                // 2. 사이드 메뉴 뷰
                SideMenuView()
                
                // 3. 바텀 메뉴 뷰
                BottomMenuView()
                
            }
            .padding(.top)
            .padding(.bottom)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  PlayerManger.swift
//  ShortVideoApp
//
//  Created by yuhyeonjae on 2022/03/03.
//

import SwiftUI
import AVKit

/*
 PlayerView 활용
 */

// MARK: - 뷰 컨트롤러 사용
struct Player: UIViewControllerRepresentable {
    
    /// 플레이어
    var player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let view = AVPlayerViewController()
        view.player = self.player
        view.showsPlaybackControls = false
        view.videoGravity = .resizeAspectFill
        return view
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

// MARK: - 스크롤 뷰 사용
struct PlayerScrollView: UIViewRepresentable {
    
    @Binding var data: [VideoVM]
    
    func makeUIView(context: Context) -> UIScrollView {
        let view = UIScrollView()
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((self.data.count)))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((self.data.count)))
        view.addSubview(childView.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        return view
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((self.data.count)))
        
        uiView.subviews.forEach { subView in
            subView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat((self.data.count)))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(parent: self)
    }
    
    // 델리게이트 활용
    class Coordinator: NSObject, UIScrollViewDelegate {
        /// 슈퍼 뷰
        var parent: PlayerScrollView
        /// 몇 번째 페이지
        var index = 0
        
        init(parent: PlayerScrollView) {
            self.parent = parent
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let currentIndex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            
            if self.index != currentIndex {
                index = currentIndex
                
                // 다른 페이지 이동 시 영상 정지
                parent.data.forEach { vm in
                    vm.player.seek(to: .zero)
                    vm.player.pause()
                }
                
                // 다음 영상 재생
                parent.data[index].player.play()
                parent.data[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: parent.data[index].player.currentItem, queue: .main) { _ in
                    self.parent.data[self.index].replay = true
                }
            }
        }
    }
}

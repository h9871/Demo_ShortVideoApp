//
//  VideoVM.swift
//  ShortVideoApp
//
//  Created by yuhyeonjae on 2022/03/03.
//

import Foundation
import AVFoundation

struct VideoVM: Identifiable {
    var id: Int
    var player: AVPlayer
    var replay: Bool
    
}

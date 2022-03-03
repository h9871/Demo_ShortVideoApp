//
//  TopMenuView.swift
//  ShortVideoApp
//
//  Created by yuhyeonjae on 2022/03/03.
//

import SwiftUI

struct TopMenuView: View {
    /// 탑 버튼 넘버
    @State var index = 0
    
    var body: some View {
        HStack(spacing: 15) {
            Button {
                self.index = 0
            } label: {
                Text("Following")
                    .foregroundColor(self.index == 0 ? .white : .white.opacity(0.45))
                    .fontWeight(self.index == 0 ? .bold : .none)
                    .padding(.vertical)
            }
            
            Button {
                self.index = 1
            } label: {
                Text("For You")
                    .foregroundColor(self.index == 1 ? .white : .white.opacity(0.45))
                    .fontWeight(self.index == 1 ? .bold : .none)
                    .padding(.vertical)
            }

        }
    }
}

struct TopMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TopMenuView()
    }
}

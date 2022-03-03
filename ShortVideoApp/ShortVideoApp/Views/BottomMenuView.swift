//
//  BottomMenuView.swift
//  ShortVideoApp
//
//  Created by yuhyeonjae on 2022/03/03.
//

import SwiftUI

struct BottomMenuView: View {
    
    /// 바텀 페이지 넘버
    @State var index = 0
    
    var body: some View {
        HStack(spacing: 0) {
            
            // 1. 홈
            Button {
                self.index = 0
            } label: {
                Image(systemName: "house.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 0 ? .white : .white.opacity(0.35))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            // 2. 검색
            Button {
                self.index = 1
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 1 ? .white : .white.opacity(0.35))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            // 3. 생방송
            Button {

            } label: {
                Image(systemName: "plus.rectangle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 50, height: 35)
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            // 4. 댓글
            Button {
                self.index = 2
            } label: {
                Image(systemName: "text.bubble.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 2 ? .white : .white.opacity(0.35))
                    .padding(.horizontal)
            }
            
            Spacer(minLength: 0)
            
            // 5. 프로필
            Button {
                self.index = 3
            } label: {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(self.index == 3 ? .white : .white.opacity(0.35))
                    .padding(.horizontal)
            }
            
        }
        .padding(.horizontal)
    }
}

struct BottomMenuView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuView()
    }
}

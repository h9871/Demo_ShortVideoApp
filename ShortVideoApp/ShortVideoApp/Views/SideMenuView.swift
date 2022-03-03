//
//  SideMenuView.swift
//  ShortVideoApp
//
//  Created by yuhyeonjae on 2022/03/03.
//

import SwiftUI

struct SideMenuView: View {
    
    var body: some View {
        HStack {
            
            Spacer()
            
            // 사이드 메뉴
            VStack(spacing: 35) {
                
                // 1. 프로필
                Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                
                
                // 2. 좋아요
                Button {
                    
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "suit.heart.fill")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("22K")
                            .foregroundColor(.white)
                    }
                }
                
                // 댓글
                Button {
                    
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "message.fill")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("1021")
                            .foregroundColor(.white)
                    }
                }
                
                // 공유
                Button {
                    
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "arrowshape.turn.up.right.fill")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Text("Share")
                            .foregroundColor(.white)
                    }
                }

            }
            .padding(.bottom, 55)
            .padding(.trailing)
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

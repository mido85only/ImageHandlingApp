//
//  ControlView.swift
//  ImageHandlingApp
//
//  Created by mohammed on 17/02/2024.
//

import SwiftUI

struct ControlView: View {
    
    @Binding var imageScale : CGFloat
    @Binding var imageOffset : CGSize
    @Binding var position : CGSize
    
    var body: some View {
        HStack{
            Button {
                if imageScale > 1 {
                    imageScale = imageScale - 1
                }else{
                    imageOffset = .zero
                    position = .zero
                }
            } label: {
                Image(systemName: "minus.magnifyingglass")
            }
            
            Button {
                imageScale = 1
                imageOffset = .zero
                position = .zero
            } label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            }
            
            Button {
                if imageScale < 5 {
                    imageScale = imageScale + 1
                }
            } label: {
                Image(systemName: "plus.magnifyingglass")
            }

        }//: Hstack
        .padding(.vertical , 10)
        .padding(.horizontal , 15)
        .foregroundStyle(.white)
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 20))
        .font(.largeTitle)
    }
}

#Preview {
    ControlView(imageScale: .constant(1), imageOffset: .constant(.zero) ,position: .constant(.zero))
}

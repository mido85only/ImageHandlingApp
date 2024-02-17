//
//  PannelView.swift
//  ImageHandlingApp
//
//  Created by mohammed on 17/02/2024.
//

import SwiftUI

struct PannelView: View {
    
    @State var isPannelDisplayed = false
    var scale : CGFloat
    var offset : CGSize
    
    var body: some View {
        HStack{
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .onLongPressGesture(minimumDuration: 1) {
                    isPannelDisplayed.toggle()
                }

            Spacer()
            HStack{
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                    .padding(.vertical , 7)
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                    .padding(.vertical , 7)
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                    .padding(.vertical , 7)
                Spacer()
            }//: Hstack
            .background(.ultraThinMaterial)
            .font(.footnote)
            .frame(maxWidth: 420 , minHeight: 30 , alignment: .center)
            .opacity(isPannelDisplayed ? 1 : 0)
        }
    }
}

#Preview {
    PannelView(scale: 1, offset: .zero)
}

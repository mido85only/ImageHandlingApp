//
//  DrawerView.swift
//  ImageHandlingApp
//
//  Created by mohammed on 17/02/2024.
//

import SwiftUI

struct DrawerView: View {
    //Properties
    let covers : [Cover] = coverData
    @State var isDrawerOpen = false
    @Binding var index : Int
    
    var body: some View {
        HStack{
            Image(systemName: "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 40 , alignment: .center)
                .padding(8)
                .foregroundStyle(.secondary)
                .rotationEffect(Angle(degrees: isDrawerOpen ? 180 : 0))
                .onTapGesture {
                    isDrawerOpen.toggle()
                }
            Spacer()
            
            ForEach(covers){ cover in
                Image(cover.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120 , alignment: .center)
                    .padding(.horizontal , 2)
                    .onTapGesture {
                        index = cover.id - 1
                    }
            }
            
        }//: Hstack
        .frame(width: 360)
        .background(.thinMaterial)
        .clipShape(.rect(cornerRadius: 8))
        .offset(x: isDrawerOpen ? 0 : 310)
        .animation(.easeInOut(duration: 1), value: isDrawerOpen)
    }
}

#Preview {
    DrawerView(index: .constant(0))
}

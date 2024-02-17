//
//  ContentView.swift
//  ImageHandlingApp
//
//  Created by mohammed on 17/02/2024.
//

import SwiftUI

struct ContentView: View {
    //Properties
    @State var imageScale : CGFloat = 1
    @State var imageOffset : CGSize = .zero
    @State var position : CGSize = .zero
    let covers : [Cover] = coverData
    @State var coverIndex = 0
    
    private func resetImage(){
        imageScale = 1
        imageOffset = .zero
        position = .zero
    }
    
    //Body
    var body: some View {
        Image(covers[coverIndex].coverName)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 10))
            .padding()
            .scaleEffect(imageScale)
            .offset(x: imageOffset.width + position.width, y: imageOffset.height + position.height)
            .shadow(color: Color(red: 0, green: 0, blue: 0 , opacity: 0.35), radius: 8, x: 3, y: 3)
        
        //1. Double tap gesture
            .onTapGesture(count: 2, perform: {
                withAnimation(.spring()) {
                    if imageScale == 1 {
                        imageScale = 5
                    }else {
                        resetImage()
                    }
                }
            })
        
        //2. Drag Gesture
            .gesture(DragGesture()
                .onChanged({ gesture in
                    imageOffset = gesture.translation
                })
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            if imageScale <= 1 {
                                resetImage()
                            }else {
                                position.width += value.translation.width
                                position.height += value.translation.height
                                imageOffset = .zero
                            }
                        }
                    }))
        //3. Magnification gesture
            .gesture(MagnifyGesture()
                .onChanged({ magnify in
                    withAnimation(.spring()) {
                        if imageScale >= 1 && imageScale <= 5 {
                            imageScale = magnify.magnification
                        }else if imageScale > 5 {
                            imageScale = 5
                        } else if imageScale < 1{
                            imageScale = 1
                        }
                    }
                })
                    .onEnded({ value in
                        withAnimation(.spring()) {
                            if imageScale > 5 {
                                imageScale = 5
                            }else if imageScale < 1 {
                                imageScale = 1
                            }
                        }
                        
                    }))
        //Drawar
            .overlay(alignment:.topTrailing) {
                DrawerView(index: $coverIndex)
                    .padding(.top , 16)
            }
        
        // Control view
            .overlay(alignment: .bottom) {
                ControlView(imageScale: $imageScale, imageOffset: $imageOffset , position: $position)
            }
        
        // Pannel view
        
            .overlay(alignment: .top) {
                PannelView(scale: imageScale, offset: imageOffset)
                    .padding()
                    .offset(y: -50)
            }
        
    }
}

#Preview {
    ContentView()
}

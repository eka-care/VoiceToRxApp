//
//  DraggableModifier.swift
//  VoiceToRxApp
//
//  Created by Arya Vashisht on 19/02/25.
//

import SwiftUI

enum Constants {
  static let padding: CGFloat = 20
}

struct FloatingVideoCallModifier: ViewModifier {
  let viewWidth: CGFloat
  let viewHeight: CGFloat
  @State private var position: CGPoint = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
  @State private var dragOffset: CGSize = .zero
  
  init(
    viewWidth: CGFloat,
    viewHeight: CGFloat
  ) {
    self.viewWidth = viewWidth
    self.viewHeight = viewHeight
  }
  
  func body(content: Content) -> some View {
    content
      .position(position)
      .offset(dragOffset)
      .gesture(
        DragGesture()
          .onChanged { value in
            print("Value of translation \(value.translation)")
            dragOffset = value.translation
          }
          .onEnded { value in
            let screenWidth = UIScreen.main.bounds.width
            let screenHeight = UIScreen.main.bounds.height
            
            // New position after dragging
            let newX = position.x + value.translation.width
            let newY = position.y + value.translation.height
            
            // Postion is center so move accordingly
            let widthOffset = viewWidth / 2 + Constants.padding
            
            // Snap to nearest side
            let snappedX = newX < screenWidth / 2 ? widthOffset : screenWidth - widthOffset
            
            // Constrain Y position within screen bounds
            let constrainedY = min(max(newY, 75), screenHeight - 75)
            
            // Update position
            withAnimation {
              position = CGPoint(x: snappedX, y: constrainedY)
              dragOffset = .zero
            }
          }
      )
  }
}

// MARK: - Extension for Easy Usage
extension View {
  func floatingVideoCall(
    viewWidth: CGFloat,
    viewHeight: CGFloat
  ) -> some View {
    self.modifier(
      FloatingVideoCallModifier(
        viewWidth: viewWidth,
        viewHeight: viewHeight
      )
    )
  }
}

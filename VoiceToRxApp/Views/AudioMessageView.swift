//
//  AudioMessageView.swift
//  VoiceToRxApp
//
//  Created by Arya Vashisht on 19/02/25.
//

import SwiftUI

struct AudioMessageView: View {
  @State private var isPlaying = false
  @State private var timer: Timer?
  @State private var elapsedTime: TimeInterval = 0
  let name = "Amit Bharti"
  
  var body: some View {
    HStack(spacing: 12) {
      VStack(alignment: .leading) {
        Text(name)
          .font(.system(size: 16, weight: .semibold))
        
        Text(formatTime(elapsedTime))
          .font(.system(size: 14))
          .foregroundColor(.gray)
      }
      
      Spacer()
      
      Button(action: {
        if isPlaying {
          stopTimer()
        } else {
          startTimer()
        }
        isPlaying.toggle()
      }) {
        Image(systemName: isPlaying ? "stop.fill" : "play.fill")
          .font(.system(size: 18))
          .foregroundColor(isPlaying ? .red : .green)
      }
    }
    .padding()
    .background(MeshGradientView())
    .clipShape(RoundedRectangle(cornerRadius: 12))
    .frame(maxWidth: 300) // Adjust width as per your need
  }
  
  func startTimer() {
    timer?.invalidate()
    elapsedTime = 0
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
      elapsedTime += 1
    }
  }
  
  func stopTimer() {
    timer?.invalidate()
    timer = nil
    elapsedTime = 0
  }
  
  func formatTime(_ time: TimeInterval) -> String {
    let minutes = Int(time) / 60
    let seconds = Int(time) % 60
    return String(format: "%02d:%02d", minutes, seconds)
  }
}

struct AudioMessageView_Previews: PreviewProvider {
  static var previews: some View {
    AudioMessageView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}

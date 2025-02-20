//
//  ContentView.swift
//  VoiceToRxApp
//
//  Created by Arya Vashisht on 11/02/25.
//

import SwiftUI
import Pipify

struct ContentView: View {
  @State var isPresented = false
  var body: some View {
    VStack {
      AudioMessageView()
        .frame(width: 200, height: 90)
        .floatingVideoCall(viewWidth: 200, viewHeight: 90)
    }
    .onAppear {
      isPresented = true
    }
  }
}

#Preview {
  ContentView()
}

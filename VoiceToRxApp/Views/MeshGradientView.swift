//
//  MeshGradientView.swift
//  VoiceToRxApp
//
//  Created by Arya Vashisht on 19/02/25.
//


import SwiftUI

struct MeshGradientView: View {
  var body: some View {
    MeshGradient(
      width: 3,
      height: 3,
      points: [
        .init(0, 0),
        .init(0.5, 0),
        .init(1, 0),
        .init(0, 0.5),
        .init(0.5, 0.5),
        .init(1, 0.5),
        .init(0, 1),
        .init(0.5, 1),
        .init(1, 1)
      ],
      colors: [
        Color(red: 0.73, green: 0.80, blue: 1.00),
        .white,
        Color(red: 0.89, green: 0.77, blue: 0.95),
        Color(red: 0.73, green: 0.80, blue: 1.00),
        Color(red: 0.88, green: 0.81, blue: 0.96),
        Color(red: 0.89, green: 0.76, blue: 0.94),
        .white,
        Color(red: 0.92, green: 0.87, blue: 0.97),
        Color(red: 0.93, green: 0.76, blue: 1.00)
      ]
    )
  }
}

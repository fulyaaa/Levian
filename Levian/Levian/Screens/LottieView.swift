//
//  LottieView.swift
//  Levian
//
//  Created by fulya akan on 1.10.2026.
//
import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    
    let fileName: String
    
    func makeUIView(context: Context) -> LottieAnimationView {
        let view = LottieAnimationView(name: fileName)
        view.loopMode = .loop
        view.play()
        view.contentMode = .scaleAspectFit
        return view
    }
    
    func updateUIView(_ uiView: LottieAnimationView, context: Context) {
    }
}

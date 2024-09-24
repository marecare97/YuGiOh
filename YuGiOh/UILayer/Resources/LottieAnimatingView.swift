//
//  LottieAnimatingView.swift
//  YuGiOh
//
//  Created by Marko Sentivanac on 18.8.24..
//

import Foundation
import UIKit
import SwiftUI
import Lottie

struct YuGiOhLoaderView: View {
    
    @ViewBuilder
    func loaderView() -> some View {
        VStack {
            
            Spacer()
            
            LottieAnimatingView(animation: .loader)
            
            Spacer()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .ignoresSafeArea(edges: .top)
        .background(.white)
    }
    
    var body: some View {
        loaderView()
    }
}

struct LottieAnimatingView: UIViewRepresentable {
    enum Lottie: String {
        case loader
    }
    let animation: Lottie
    let loopMode: LottieLoopMode = .loop
    
    init(animation: LottieAnimatingView.Lottie = .loader) {
        self.animation = animation
    }

    func makeUIView(context: UIViewRepresentableContext<LottieAnimatingView>) -> UIView {
        let view = UIView(frame: .zero)

        let animationView = LottieAnimationView()
        let animation = LottieAnimation.named(animation.rawValue)
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play()

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIViewType, context: Context) { }
}


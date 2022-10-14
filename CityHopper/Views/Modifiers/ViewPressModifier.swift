//
//  ViewPressModifier.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/9/22.
//
// code and idea from https://www.youtube.com/watch?v=JdUs3GD2zzI
// code originally written by SerialCoder.dev

import SwiftUI

//
struct ViewPressModifier: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void

    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}

//  Written by SerialCoder.dev
extension View {
    func pressEvents(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(ViewPressModifier(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}

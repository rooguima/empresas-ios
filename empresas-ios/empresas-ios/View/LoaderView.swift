//
//  LoaderView.swift
//  empresas-ios
//
//  Created by Rodrigo Guimarães on 07/10/20.
//

import SwiftUI

struct LoaderView: View {
    @State var isLoading = true

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color("pink2"), lineWidth: 4)
                .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
                .frame(width: 50, height: 50, alignment: .center)

            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color("pink2"), lineWidth: 4)
                .frame(width: 75, height: 75, alignment: .center)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                isLoading.toggle()
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}

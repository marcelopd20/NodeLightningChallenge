//
//  LoadingView.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            ProgressView("Fetching Data...")
                .tint(Color.accentColor)
                .scaleEffect(2.0, anchor: .center)
        }.ignoresSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)

    }
}

#Preview {
    LoadingView()
}

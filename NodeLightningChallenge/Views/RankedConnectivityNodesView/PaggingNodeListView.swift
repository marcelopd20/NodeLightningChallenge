//
//  PaggingNodeListView.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import SwiftUI

struct PaggingNodeListView: View {
    @Binding var currentPage: Int
    var body: some View {
        VStack {
            Text("Página \(currentPage + 1) de 10")
                .font(.system(.title3, design: .rounded, weight: .bold))
            HStack {
                Button {
                    currentPage -= 1
                } label: {
                    Text("Voltar")
                        .font(.system(.title3, design: .rounded, weight: .semibold))
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(currentPage == 0 ? Color(.lightGray) : Color(.darkBlue1))
                        .clipShape(.rect(cornerRadius: 12))
                } .disabled(currentPage == 0)
                Spacer()
                Button {
                        currentPage += 1
                } label: {
                    Text("Avançar")
                        .font(.system(.title3, design: .rounded, weight: .semibold))
                        .padding()
                        .foregroundStyle(Color.white)
                        .background(currentPage == 9 ? Color(.lightGray) : Color(.darkBlue1))
                        .clipShape(.rect(cornerRadius: 12))
                }.disabled(currentPage == 9)
            }.padding()
        }.padding()
    }
}

#Preview {
    PaggingNodeListView(currentPage: .constant(1))
}

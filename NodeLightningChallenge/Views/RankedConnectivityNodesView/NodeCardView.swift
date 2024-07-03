//
//  NodeCardView.swift
//  NodeLightningChallenge
//
//  Created by Marcelo Pastana Duarte on 03/07/24.
//

import SwiftUI

struct NodeCardView: View {
    @State var expandable: Bool = false
    let alias: String
    let index: String
    let country: String
    let city: String
    let channels: Int
    let firstSeen: String
    let updateAt: String
    let btcCapacity: Double

    var body: some View {
        LazyVStack {
            VStack(spacing: 0)  {
                HStack {
                    Text(index)
                        .font(.system(.largeTitle, design: .rounded, weight: .black))
                        .foregroundStyle(Color.black)
                    Spacer()
                    Text(alias)
                        .font(.system(.title2, design: .rounded, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.black)
                    Spacer()
                    Image(systemName: expandable ? "chevron.down" : "chevron.right" )
                        .foregroundStyle(Color.black)
                        .fontWeight(.bold)
                }
                .padding(5)
                .background(Color(.yellow1))
                .onTapGesture {
                    withAnimation {
                        expandable.toggle()
                    }
                }
                if expandable {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Label("\(city), \(country)", systemImage: "location")
                                .font(.system(.headline, design: .rounded, weight: .semibold))

                        }
                        Spacer()

                        Spacer()
                        VStack(alignment: .trailing) {

                            Text("Aparição")
                                .font(.system(.headline, design: .rounded, weight: .black))
                                .multilineTextAlignment(.trailing)
                            Text(firstSeen)
                            Text("Atualizado")
                                .font(.system(.headline, design: .rounded, weight: .black))
                            Text(updateAt)
                        }

                    }
                    .padding()
                    .background(Color(.blue1))
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text("Capacity")
                            .font(.system(.title3, design: .rounded, weight: .black))
                            .foregroundStyle(Color.white)
                        Text("\(btcCapacity) BTC")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                    Spacer()
                    VStack(alignment: .trailing)  {
                        Text("Canais")
                            .font(.system(.headline, design: .rounded, weight: .black))
                            .foregroundStyle(Color.white)
                        Text("\(channels)")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                    }
                }.padding(5)
                .frame(maxWidth: .infinity)
                .background(Color(.darkPurple1))
            }
            .clipShape(.rect(cornerRadius: 12))
            .padding()
        }

        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    NodeCardView(alias: "Garlic", index: "42º", country: "EUA", city: "Nova Iorque", channels: 12345, firstSeen: "5 Jun 2024", updateAt: "5 Jun 2024", btcCapacity: 0.55)
}

//
//  BuySpotView.swift
//  LoveChain
//
//  Created by 유정인 on 2022/08/20.
//

import SwiftUI

struct BuySpotView: View {
    @SwiftUI.Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @State var toggleTouched: Bool = false
    @Binding var spotNumber: Int
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(alignment: .top, spacing: 17) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .scaledToFit()
                        .frame(width: 96)
                    HStack {
                        Text("#1-1")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 60, trailing: 30))
                    .frame(width: 96, height: 96)
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("spot number \(spotNumber)")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(Color("subTitleColor"))
                    HStack(spacing: 4) {
                        Image("loveCoin")
                        Text("0.1390 ($2.04)")
                            .font(.system(size: 12))
                            .fontWeight(.bold)
                    }
                }
                Spacer()
            }
            Divider()
            HStack(alignment: .center) {
                Text("FEE")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                    .foregroundColor(Color("subTitleColor"))
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    HStack(spacing: 4) {
                        Image("loveCoin")
                        Text("0.0009")
                            .font(.custom("InsaniburgerwithCheese", size: 24))
                            .fontWeight(.bold)
                    }
                    Text("($0.04)")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
            }
            Divider()
            HStack(alignment: .center) {
                Text("TOTAL")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                    .foregroundColor(Color("subTitleColor"))
                Spacer()
                VStack(alignment: .trailing, spacing: 5) {
                    HStack(spacing: 4) {
                        Image("loveCoin")
                        Text("0.1399")
                            .font(.custom("InsaniburgerwithCheese", size: 24))
                            .fontWeight(.bold)
                    }
                    Text("($2.08)")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                }
            }
            .padding(.bottom, 265)
            HStack(spacing: 12) {
                Button {
                    self.toggleTouched.toggle()
                } label: {
                    Image(systemName: self.toggleTouched == false ? "square" : "checkmark.square.fill")
                        .foregroundColor(.black)
                }
                Text("By checking this box, I agree to Love Chain’s Terms of Service")
                    .font(.system(size: 10))
                    .fontWeight(.bold)
            }
            .padding(.bottom, 10)
            Button {
                self.presentationMode.wrappedValue.dismiss()
                
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(self.toggleTouched == true ? .black : Color("lightGrayColor"))
                    .frame(width: 334, height: 58)
                    .overlay(
                        Text("CHECKOUT")
                            .font(.custom("InsaniburgerwithCheese", size: 20))
                            .foregroundColor(.white)
                    )
            }

        }
        .padding(.horizontal, 40)
    }
}

struct BuySpotView_Previews: PreviewProvider {
    static var previews: some View {
        BuySpotView(spotNumber: .constant(1))
    }
}

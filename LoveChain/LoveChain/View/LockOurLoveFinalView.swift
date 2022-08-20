//
//  LockOurLoveFinalView.swift
//  LoveChain
//
//  Created by Terry Koo on 2022/08/21.
//

import SwiftUI

struct LockOurLoveFinalView: View {
    @Binding var firstNaviLinkActive: Bool
    
    var body: some View {
        ZStack {
            Color.white
            VStack {
                Text("YOUR LOVE IS LOCKED!")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                ZStack {
                    Image("coupleImage")
                        .resizable()
                        .frame(width: 315, height: 315)
                    Image("LoveLocker")
                        .resizable()
                        .frame(width: 25, height: 34)
                        .offset(x: 123, y: -123)
                }
                HStack {
                    Text("Minji")
                        .font(.custom("InsaniburgerwithCheese", size: 20))
                        .padding(EdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 0))
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    Text("Dongjun")
                        .font(.custom("InsaniburgerwithCheese", size: 20))
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .foregroundColor(.black)
                        .offset(x: -25, y: 0)
                }
                Divider()
                    .padding(EdgeInsets(top: 20, leading: 25, bottom: 20, trailing: 25))
                VStack(alignment: .leading) {
                Text("BUY COUPLE SPOT")
                    .font(.custom("InsaniburgerwithCheese", size: 20))
                    .foregroundColor(.gray)
                Text("You can buy the couple spot to hang a lock")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 30, trailing: 0))
                }
                .offset(x: -30, y: 0)
                ZStack {
                    Image("GoButton")
                        .resizable()
                        .frame(width: 302, height: 72)
                    Button(action: {
                        // TODO: - 메인뷰로 이동 로직 구현
                        print("메인뷰로 이동")
                        firstNaviLinkActive.toggle()
                    }, label: {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 302, height: 72)
                            .opacity(0)
                    })
                }
            }
            .padding()
        }
    }
}
//
//struct LockOurLoveFinalView_Previews: PreviewProvider {
//    static var previews: some View {
//        LockOurLoveFinalView()
//    }
//}

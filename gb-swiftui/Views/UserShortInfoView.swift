//
//  UserShortInfo.swift
//  gb-swiftui
//
//  Created by Marat Khanbekov on 18.09.2021.
//

import SwiftUI


struct UserShortInfoView: View {
    
    let name: String
    let status: String
    let mode: String
    
    var body: some View {
        HStack {
            Image("giraffe")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
                .modifier(CircleShadow(shadowColor: .gray, shadowRadius: 2))
                .padding(10)
            VStack (alignment: .leading) {
                Text(name)
                    .modifier(HeaderModifier())
                Text(status)
                    .modifier(SubHeaderModifier())
                Text(mode)
                    .modifier(ModeModifier())
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(10)
    }
}

struct UserShortInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserShortInfoView(name: "Isaak Newton", status: "Something in my mind", mode: "Online")
    }
}

//
//  Profile.swift
//  gb-swiftui
//
//  Created by Marat Khanbekov on 18.09.2021.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack  {
            UserShortInfoView(name: "Isaak Newton", status: "Something in my mind", mode: "Online")
            HStack {
                ButtonsMenu {
                    ButtonMenu(title: "История", thumbName: "camera")
                    ButtonMenu(title: "Запись", thumbName: "square.and.pencil")
                    ButtonMenu(title: "Фото", thumbName: "photo")
                    ButtonMenu(title: "Клип", thumbName: "infinity")
                }
            }
            Spacer()
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

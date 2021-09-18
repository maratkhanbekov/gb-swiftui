//
//  buttons-menu.swift
//  gb-swiftui
//
//  Created by Marat Khanbekov on 18.09.2021.
//

import SwiftUI



struct ButtonMenu: View {
    var title: String
    var thumbName: String
    var body: some View {
        VStack {
            Image(systemName: thumbName)
                .frame(width: 15, height: 15, alignment: .center)
            Text(title)
                .font(.system(size: 12))
        }.frame(width: 80, height: 60, alignment: .center)
    }
}

struct buttons_menu: View {
    var body: some View {
        VStack  {
            HStack {
                ButtonsMenu {
                    ButtonMenu(title: "История", thumbName: "camera")
                    ButtonMenu(title: "Запись", thumbName: "square.and.pencil")
                    ButtonMenu(title: "Фото", thumbName: "photo")
                    ButtonMenu(title: "Клип", thumbName: "infinity")
                }
            }
        }
    }
}

struct buttons_menu_Previews: PreviewProvider {
    static var previews: some View {
        buttons_menu()
    }
}






//
//  CustomTab.swift
//  UI-138
//
//  Created by にゃんにゃん丸 on 2021/03/04.
//

import SwiftUI

struct CustomTab: View {
    @State var selected = "house"
    var body: some View {
        ZStack(alignment:.bottom){
            
            
            Color.orange
                .ignoresSafeArea()
            
           CustomTabButton(selectedtab: $selected)
            
            
            
            
        }
       
        
    }
}

struct CustomTab_Previews: PreviewProvider {
    static var previews: some View {
        CustomTab()
    }
}

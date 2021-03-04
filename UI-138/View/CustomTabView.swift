//
//  CustomTabView.swift
//  UI-138
//
//  Created by にゃんにゃん丸 on 2021/03/04.
//

import SwiftUI

struct CustomTabView: View {
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var selected = "設定"
    
    @Environment(\.colorScheme) var shceme
    var body: some View {
        
        ZStack(alignment:.bottom){
            
            TabView(selection:$selected){
                
                Color.red
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("ハウス")
                
                
               NextView()
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("設定")
                
                
                Color.purple
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("まっぷ")
                
                Color.orange
                    .ignoresSafeArea(.all, edges: .all)
                    .tag("フォルダ-")
                
                
                
            }
            
            HStack(spacing:0){
                
                TabButton(title: "ハウス", image: "house", selected: $selected)
                
                TabButton(title: "設定", image: "gear", selected: $selected)
                
                TabButton(title: "まっぷ", image: "map", selected: $selected)
                
                TabButton(title: "フォルダ-", image: "folder.fill", selected: $selected)
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(shceme == .dark ? Color.black : Color.white)
            
            
            
        }
        .ignoresSafeArea(.all, edges: .bottom)
       
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}

struct TabButton : View {
    var title : String
    var image : String
    @Binding var selected : String
    var body: some View{
        
        Button(action: {
            
            withAnimation(.easeInOut){
                
                selected = title
            }
            
        }, label: {
            VStack{
                
                Image(systemName: image)
                    .font(.system(size: 30))
                    .foregroundColor(selected == title ? .white : .primary)
                
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(selected == title ? .white : .primary)
                    
                    
                
                
                
                
            }
            .padding(.bottom,8)
            .frame(width: (self.getrect().width - 75) / 3, height: 55 + self.getsafeareabottom())
            .background(Color.blue.offset(y: selected == title ? 0 : 100))
        })
     
        
        
    }
}

extension View{
    
    func getrect()->CGRect{
        
        return UIScreen.main.bounds
    }
    func getsafeareabottom()->CGFloat{
        
        return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 10
    }
}





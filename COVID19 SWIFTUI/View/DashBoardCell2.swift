//
//  DashBoardCell2.swift
//  COVID19 SWIFTUI
//
//  Created by Lalith on 24/03/20.
//  Copyright © 2020 NANI. All rights reserved.
//

import SwiftUI

struct DashBoardCell2: View {
    
    var total: Int
    var indians: Int
    var foreigners: Int
    var deaths: Int
    var recovered: Int
    
    var body: some View {
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack{
            VStack{
                Text(String(total)).font(.system(size: 50))
                Text("Total Cases").font(.system(size: 23))
                
            }
            HStack{
                Spacer()
                VStack{
                    Text(String(indians)).font(.system(size: 50))
                    Text("Indians").font(.system(size: 23))
                    
                }
                Spacer()
                VStack{
                    Text(String(foreigners)).font(.system(size: 50))
                    Text("Foreigners").font(.system(size: 23))
                }
                Spacer()
            }
//            Spacer()
            HStack{
                Spacer()
                VStack{
                    Text(String(deaths)).font(.system(size: 50))
                    Text("Deaths").font(.system(size: 23))
                    
                }
                Spacer()
                VStack{
                    Text(String(recovered)).bold().font(.system(size: 50))
                    Text("Recovered").font(.system(size: 23))
                    
                }
                Spacer()
            }
        }.frame(width: UIScreen.main.bounds.width-40, height: 280, alignment: .center).background(Color("DashColor1"))
    }
}

struct DashBoardCell2_Previews: PreviewProvider {
    static var previews: some View {
        DashBoardCell2(total: 10, indians: 2, foreigners: 8, deaths: 2, recovered: 1)
    }
}

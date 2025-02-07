//
//  PredatorDetail.swift
//  JPApexPredators18
//
//  Created by Mark Santoro on 2/1/25.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
            ScrollView{
                ZStack(alignment: .bottomTrailing){
                    // background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    // dino image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                    // this adjusts width and height to model of phone
                        .frame(width: geo.size.width / 1.5, height: geo.size.height / 3.7)
                    // flip to face left, 1 = no size change. - means change direction
                        .scaleEffect(x: -1)
                    // add a shadow
                        .shadow(color: .black,radius: 7)
                    // add slight 3d effect
                        .offset(y: 20)
                    
                }// end zstack
                
                
                // dino name
                
                // current location
                
                // appears in
                
                
                // movie moments
                
                // webpage link
                
                
            }// end scroll view
            
            
        }// end geo reader
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
      //  .preferredColorScheme(.dark)
}

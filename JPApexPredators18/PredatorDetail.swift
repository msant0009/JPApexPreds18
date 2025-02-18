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
                        .overlay{
                            LinearGradient(stops: [
                                Gradient.Stop(color: .clear, location: 0.8),
                                Gradient.Stop(color: .black, location: 1)
                            ], startPoint: .top, endPoint: .bottom)
                            
                        }
                    
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
                
                VStack(alignment: .leading){
                    // dino name
                    Text(predator.name)
                        .font(.largeTitle)
                
                    // current location
                    
                    // appears in
                    Text("Appears in:")
                        .font(.title3)
                    ForEach(predator.movies, id: \.self){ movie in
                        Text("• " + movie)
                            .font(.subheadline)
                    }
                    
                    
                    // movie moments
                    Text("Movie Moments")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes){ scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                        
                        
                        
                    }
                    // webpage link
                    Text("Read More...")
                        .font(.caption)
                    Link(predator.link, destination: URL(string:predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                        
                    
                }
                .padding()
                .padding(.bottom, 15)
                .frame(width: geo.size.width, alignment: .leading)
                
                
                
            }// end scroll view
            
            
        }// end geo reader
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[7])
        .preferredColorScheme(.dark)
}

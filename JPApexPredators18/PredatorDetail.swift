//
//  PredatorDetail.swift
//  JPApexPredators18
//
//  Created by Mark Santoro on 2/1/25.
//

import MapKit
import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    @State var position: MapCameraPosition
    
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
                    NavigationLink{
                        Text("Temporary view")
                    } label: {
                        
                        Map(position: $position) {
                            Annotation(predator.name, coordinate: predator.location){
                                Image(systemName: "mappin.and.ellipse")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                    .symbolEffect(.pulse)
                            }
                            .annotationTitles(.hidden)// hide dino name on image
                        }
                        .frame(height: 125)
                       
                        .overlay(alignment: .trailing){
                            Image(systemName: "greaterthan")
                                .imageScale(.large)
                                .font(.title3)
                                .padding(.trailing, 5)
                        }
                        .overlay(alignment: .topLeading){
                            Text("Current Location")
                                .padding([.leading, .bottom], 5)
                                .padding(.trailing, 8)
                                .background(.black.opacity(0.33))
                                .clipShape(.rect(bottomTrailingRadius: 15))
                        
                        }
                        .clipShape(.rect(cornerRadius: 15))
                        
                    }// end navi link label
                    
                    // appears in
                    Text("Appears in:")
                        .font(.title3)
                        .padding(.top)
                    
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
        .toolbarBackground(.automatic)
    }
}

#Preview {
    let predator = Predators().apexPredators[2]
    
    NavigationStack {// needed to allow the pin link to work in this view
        PredatorDetail(predator: predator,
                       position: .camera(
                        MapCamera(centerCoordinate:
                                    predator.location,
                                  distance: 30000
                                 )))
        .preferredColorScheme(.dark)
    }
}

//
//  MapViewActionButton.swift
//  Uber Clone
//
//  Created by Ali Erdem Kökcik on 31.01.2023.
//

import SwiftUI

struct MapViewActionButton: View {
    // MARK: - Properties
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation(.spring()){
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState ))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white) 
                .clipShape(Circle())
                .shadow(color: .black, radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    func actionForState(_ state: MapViewState){
        switch state{
        case .noInput:
            print("No input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected:
            mapState = .noInput
            viewModel.selectedLocationCoordinate = nil
        }
    }
    func imageNameForState(_ state: MapViewState) -> String {
        switch state{
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
        }
    }
}

struct MapViewActionButton_Previews: PreviewProvider {
    static var previews: some View {
        MapViewActionButton(mapState: .constant(.noInput ))
            .environmentObject(LocationSearchViewModel())
    }
}

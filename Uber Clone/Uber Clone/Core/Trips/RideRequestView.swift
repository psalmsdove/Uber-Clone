//
//  RideRequestView.swift
//  Uber Clone
//
//  Created by Ali Erdem Kökcik on 1.02.2023.
//

import SwiftUI

struct RideRequestView: View {
    @State private var selectedRideType: RideType = .uberX
    var body: some View {
        VStack{
            Capsule()
                .foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            HStack {
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 8, height: 8 )
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    Rectangle()
                        .fill(.black)
                        .frame(width: 8, height: 8 )
                }
                VStack(alignment: .leading, spacing: 24){
                    HStack{
                        Text("Current location")
                            .font(.system(size: 16, weight: .semibold ))
                            .foregroundColor(.gray)
                        Spacer()
                        Text("1.30 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    HStack{
                        Text("Burger King")
                            .font(.system(size: 16, weight: .semibold ))
                        Spacer()
                        Text("1.50 PM")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            Divider()
            Text("SUGGESTED RIDES")
                .font(.subheadline)
                .padding()
                .foregroundColor(.gray)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(RideType.allCases, id: \.self){ type in
                        VStack(alignment: .leading){
                            Image(type.imageName)
                                .resizable()
                                .scaledToFit()
                            VStack(alignment: .leading, spacing: 4){
                                Text(type.description)
                                    .font(.system(size: 14, weight: .semibold))
                                Text("34.06₺")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .padding(8)
                        }
                        .frame(width: 122, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : .black)
                        .background(Color(type == selectedRideType ? .black : .systemGroupedBackground))
                        .scaleEffect(type == selectedRideType ? 1.1 : 1.0)
                        .cornerRadius(15)
                        .onTapGesture{
                            withAnimation(.spring()){
                                selectedRideType = type
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 25)
            Divider()
                .padding(.vertical, 8)
            HStack(spacing: 12){
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.black)
                    .cornerRadius(5)
                    .foregroundColor(.white)
                    .padding(.leading)
                Text("**** 1234")
                    .fontWeight(.bold)
                Spacer()
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Button {
                //
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.black)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
        }
        .cornerRadius(16)
        .background(.white)
        .padding(.bottom, 24)
    }
}

struct RideRequestView_Previews: PreviewProvider {
    static var previews: some View {
        RideRequestView()
    }
}

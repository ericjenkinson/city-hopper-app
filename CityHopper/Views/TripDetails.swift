//
//  TripDetails.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 11/2/22.
//
import class PhotosUI.PHPickerViewController
import SwiftUI

struct TripDetails: View {
  @EnvironmentObject var tripsVM: TripsViewModel
 // @State var showingDialog = false
  @State var showingImagePicker = false
  var tripIndex: Int
  // replace with Trips vars
  @State var tripComplete = false
  @State var reviewString = ""
  @State var tripImage: Image?

  var body: some View {
    VStack(alignment: .leading) {
      Spacer()
      HStack(spacing: 16) {
        Button {
          // Write change to core data
          tripComplete.toggle()
          tripsVM.trips[tripIndex].taken = tripComplete
        } label: {
          Image(tripComplete ? "tripCompleted" : "tripNotCompleted")
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48)
        }
        VStack(alignment: .leading) {
          Text(tripsVM.trips[tripIndex].name)
          Text("\(tripsVM.trips[tripIndex].date)")
        }
      }
      VStack {
        Divider()
          .padding(.vertical)
        TextField("Review...", text: $tripsVM.trips[tripIndex].review)
        Divider()
          .padding(.vertical)

        Image(systemName: "photo")
          .resizable()
          .scaledToFit()
          .opacity(0.5)
          .padding()

        Button("Update Image..") { showingImagePicker = true }
        Spacer()
      }
      .sheet(isPresented: $showingImagePicker) {
        PHPickerViewController.View(image: $tripImage)
      }
    }
    .onDisappear {
      withAnimation {
        // write changes
      }
    }
    .padding()
  }
}

struct TripDetails_Previews: PreviewProvider {
  static var previews: some View {
    TripDetails(tripIndex: 1)
  }
}

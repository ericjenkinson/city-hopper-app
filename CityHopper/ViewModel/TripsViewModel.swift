//
//  TripViewController.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 9/23/22.
//

import Foundation
import CoreData

///// Information detailing a trip.
class TripsViewModel: ObservableObject {
  let viewContext = PersistenceController.shared.container.viewContext

  @Published var trips: [Trips] = []

  init() {
    fetchTrips()
  }
  
  private func coreDataSave() {
    do {
      try viewContext.save()
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }

  func fetchTrips() {
    let request = NSFetchRequest<Trips>(entityName: "Trips")
    do {
      trips = try viewContext.fetch(request)
    } catch let error {
      print("Error fetching Trips. \(error.localizedDescription)")
    }
  }

  func newTrip(tripName: String,
                         tripDate: Date,
                         tripCity: String,
                         groupSize: Int64,
                         costPerPerson: Double,
                         totalCost: Double,
                         tripTaken: Bool) {
    let newTrip = Trips(context: viewContext)
    newTrip.tripName = tripName
    newTrip.tripDate = tripDate
    newTrip.tripCity = tripCity
    newTrip.groupSize = groupSize
    newTrip.costPerPerson = costPerPerson
    newTrip.totalCost = totalCost
    newTrip.tripTaken = tripTaken

    coreDataSave()
  }

}

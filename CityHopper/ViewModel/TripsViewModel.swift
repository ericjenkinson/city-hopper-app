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
      fetchTrips() // update the Published var trips
    } catch {
      let nserror = error as NSError
      fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
    }
  }

  func isEmpty() -> Bool {
    if trips.isEmpty {
      return true
    }
    return false
  }

  func numberOfTrips() -> Int {
    return trips.count
  }

  func fetchTrips() {
    let request = NSFetchRequest<Trips>(entityName: "Trips")
    do {
      trips = try viewContext.fetch(request)
    } catch let error {
      print("Error fetching Trips. \(error.localizedDescription)")
    }
  }

  // swiftlint:disable:next function_parameter_count
  func newTrip(tripName: String,
               tripDate: Date,
               tripCity: String,
               groupSize: Int64,
               costPerPerson: Double,
               totalCost: Double,
               tripTaken: Bool) {
    let newTrip = Trips(context: viewContext)
    newTrip.name = tripName
    newTrip.date = tripDate
    newTrip.city = tripCity
    newTrip.groupsize = groupSize
    newTrip.costperperson = costPerPerson
    newTrip.totalcost = totalCost
    newTrip.taken = tripTaken

    coreDataSave()
  }

}

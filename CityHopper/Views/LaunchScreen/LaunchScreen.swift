//
//  SplashScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 10/8/22.
//

import SwiftUI

struct LaunchScreen: View {
  
  private var dataRetriever = DataRetriever()
  
  var body: some View {
    GeometryReader { geo in
      ZStack {
        
        RotatingGlobe()
          .offset(y: 500)
        
        VStack {
          AnimatedAppName()
          ProgressView("Loading city data...", value: 50, total: 100)
        }
        .offset(y: -250)
        .frame(maxWidth: geo.size.width)
        
      }
      .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
//      .onAppear(perform: {
//                  Task {
//                    await getData()
//                  }
//      })
    }
  }
  
//  // methods
//  private func getData(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
//    if let url = URL(string: urlString) {
//      let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
//        if let error = error {
//          completion(.failure(error))
//        }
//
//        if let data = data {
//          completion(.success(data))
//        }
//      }
//
//      urlSession.resume()
//    }
//  }
//
//  private func getData() async {
//    do {
//      let output = try await dataRetriever.getData()
//
//      let _ = print(output)
//    } catch {
//      print(error)
//    }
//
//    let output = await dataRetriever.getCookies()
//    let _ = print(output)
//
//    let urlString = "https://fakestoreapi.com/products"
//    self.getData(fromURLString: urlString) { (result) in
//      switch result {
//      case .success(let data):
//        let _ = print("Bytes from closure \(data)")
//      case .failure(let error):
//        print(error)
//      }
//    }
//  }
  
}


struct SplashScreen_Previews: PreviewProvider {
  static var previews: some View {
    LaunchScreen()
  }
}

//
//  HomeScreen.swift
//  CityHopper
//
//  Created by Eric Jenkinson on 8/20/22.
//

import SwiftUI

struct HomeScreen: View {
  
  private var dataRetriever = DataRetriever()
  
  @State var showLaunchScreen = true
 
  var body: some View {
    ZStack {
      HomeTabView()
        .opacity(showLaunchScreen ? 0 : 1)
    
      LaunchScreen()
        .opacity(showLaunchScreen ? 1 : 0)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
              withAnimation(.easeOut(duration: 2)) {
                showLaunchScreen = false
              }
            }
          }
    
      }
      .task {
        await getData()
      }

  }
  
  // methods
  private func getData(fromURLString urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
    if let url = URL(string: urlString) {
      let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
        if let error = error {
          completion(.failure(error))
        }

        if let data = data {
          completion(.success(data))
        }
      }

      urlSession.resume()
    }
  }
  
  private func getData() async {
    do {
      let output = try await dataRetriever.getData()
      
      let _ = print(output)
    } catch {
      print(error)
    }
    
    let output = await dataRetriever.getCookies()
    let _ = print(output)
   
    let urlString = "https://fakestoreapi.com/products"
    self.getData(fromURLString: urlString) { (result) in
      switch result {
      case .success(let data):
        let _ = print("Bytes from closure \(data)")
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

struct HomeScreen_Previews: PreviewProvider {
  static var previews: some View {
    HomeScreen()
  }
}

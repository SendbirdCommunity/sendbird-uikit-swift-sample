//
//  ContentView.swift
//  sendbirduikit_swiftui
//
//  Created by jasonkoo on 4/15/21.
//

import SwiftUI
import SendBirdUIKit

class ViewModel : ObservableObject {
    @Published public var displayText: String = "Connecting..."

    init() {
        
        // After your user has authenticated, use a string
        // identifier unique to that user to pass to Sendbird.
        // To keep things simple we're using a user id
        // we created from the Sendbird dashboard
        let authenticatedUserId = "awesome_user"
        
        // Initialize the SendbirdSDK with your application id,
        // also found in the Sendbird dashboard
        SBDMain.initWithApplicationId("your_awesome_app_id")
        
        // Connect with Sendbird using just the user id
        SBDMain.connect(withUserId: authenticatedUserId, completionHandler:  { [weak self] (user, error) in
            
            // user object will be an instance of SBDUser
            guard let sbUser = user else {
                // Display any error we encounter
                self?.displayText = "Oops, there was a problem connecting. Check the app id and user id in the ContentView's init()."
                print("ContentView: init: connect: ERROR: \(String(describing: error))")
                return
            }
            guard let name = sbUser.nickname else {
                // User not yet assigned an optional nickname
                self?.displayText = "Awesome, you (who shall not be named) are connected!"
                return
            }
            self?.displayText = "Awesome, you're connected \(name)!"
        })
    }
    
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()

    var body: some View {

        NavigationView{
            VStack(){
                // Text to just tell us if we're connected or not
                Text("\(viewModel.displayText)")
                    .padding()
                    .multilineTextAlignment(.center)
                
                // Link to actually kick of Sendbird's UIKit
                NavigationLink(destination: ChannelListView()){
                        // TODO: Disable if not connected to Sendbird
                        Text("Tap to continue")
                }
                .navigationBarHidden(true)
                .navigationBarTitle("Demo", displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

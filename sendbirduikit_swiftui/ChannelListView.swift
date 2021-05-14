//
//  ChannelListView.swift
//  sendbirduikit_swiftui
//
//  Created by jasonkoo on 4/15/21.
//

import SwiftUI
import SendBirdUIKit

struct ChannelListContainer: UIViewControllerRepresentable {
    typealias UIViewControllerType = NaviControlChannelListViewController

    init() {
        
        // Initialize the SendbirdSDK with your application id,
        // also found in the Sendbird dashboard
        SBUMain.initialize(applicationId:"YOUR_SENDBIRD_APPLICATION_ID")
        
        // After your user has authenticated, use a string
        // identifier unique to that user to pass to Sendbird.
        SBUGlobals.CurrentUser = SBUUser(userId: "A_SENDBIRD_USER_ID")

        // Connect with Sendbird now that the CurrentUser is set
        SBUMain.connect { (user, error) in
            
            // user object will be an instance of SBDUser
            guard let _ = user else {
                print("ContentView: init: connect: ERROR: \(String(describing: error))")
                return
            }
        }
    }
    
    func makeUIViewController(context: Context) -> NaviControlChannelListViewController {
        return NaviControlChannelListViewController()
    }
    
    func updateUIViewController(_ uiViewController: NaviControlChannelListViewController, context: Context) {
    }
    
}

class NaviControlChannelListViewController : UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        displaySendbirdChanelList()
    }
    
    @objc
    func displaySendbirdChanelList(){
        // The SBUChannelListViewController will take care of creating
        // an instance of SBUChannleViewController when a group chat channel
        // is selected, and creating an instance of SBUCreateChannelViewController
        // when wanting to create a new group chat channel.
        let clvc = SBUChannelListViewController()
        let navc = UINavigationController(rootViewController: clvc)
        navc.title = "Sendbird SwiftUI Demo"
        navc.modalPresentationStyle = .fullScreen
        present(navc, animated: true)
    }
}

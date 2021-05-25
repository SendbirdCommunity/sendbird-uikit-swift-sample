//
//  ChannelListView.swift
//  sendbirduikit_swiftui
//
//  Created by jasonkoo on 4/15/21.
//

import SwiftUI
import SendBirdUIKit

struct ChannelListViewContainer: UIViewControllerRepresentable {
    typealias UIViewControllerType = ChannelListViewController
    
    func makeUIViewController(context: Context) -> ChannelListViewController {
        return ChannelListViewController()
    }
    
    func updateUIViewController(_ uiViewController: ChannelListViewController, context: Context) {
    }
    
}

class ChannelListViewController : UIViewController {
    
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

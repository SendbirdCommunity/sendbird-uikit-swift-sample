//
//  ChannelListView.swift
//  sendbirduikit_swiftui
//
//  Created by jasonkoo on 4/15/21.
//

import SwiftUI
import SendBirdUIKit

struct ChannelListView : View {

    var body: some View {
        SendbirdChannelListContainer()
    }
    
}

struct SendbirdChannelListContainer: UIViewControllerRepresentable {
    typealias UIViewControllerType = SBUChannelListViewController
    
    func makeUIViewController(context: Context) -> SBUChannelListViewController {
        // The SBUChannelListViewController will take care of creating
        // an instance of SBUChannleViewController when a group chat channel
        // is selected, and creating an instance of SBUCreateChannelViewController
        // when wanting to create a new group chat channel.
        return SBUChannelListViewController()
    }
    
    func updateUIViewController(_ uiViewController: SBUChannelListViewController, context: Context) {
        
    }
}

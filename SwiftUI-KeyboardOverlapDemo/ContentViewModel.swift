//
//  ContentViewModel.swift
//  SwiftUI-KeyboardOverlapDemo
//
//  Created by Russell Archer on 07/05/2021.
//

import UIKit
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var keyboardHeight: Int = 0
    
    var showKeyboard: AnyCancellable?
    var hideKeyboard: AnyCancellable?

    init() {
        showKeyboard = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillShowNotification)
            .sink(receiveValue: { notification in
                if let userInfo = notification.userInfo,
                   let kbRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    self.keyboardHeight = Int(kbRect.height)
                }
            })
        
        hideKeyboard = NotificationCenter.default
            .publisher(for: UIResponder.keyboardWillHideNotification)
            .sink(receiveValue: { notification in
                self.keyboardHeight = 0
            })
    }
}

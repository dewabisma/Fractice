//
//  NotificationExtensions.swift
//  Fractice
//
//  Created by Bisma Mahendra I Dewa Gede on 18/04/23.
//

import SwiftUI

extension Notification {
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
}

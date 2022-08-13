//
//  SignupViewModel.swift
//  Signup
//
//  Created by Josue Cruz on 8/10/22.
//

import SwiftUI

final class SignupViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirmation: String = ""
    @Published var currentUser: User = .parent
    @Published var invalidEmail: Bool = false
    
    func setBackgroundColor(user: User) -> some View {
        switch user {
        case .parent:
            return Color.mint
        case .child:
            return Color.indigo
        case .teacher:
            return Color.cyan
        }
    }
}

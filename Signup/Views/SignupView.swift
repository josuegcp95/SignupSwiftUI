//
//  SignupView.swift
//  Signup
//
//  Created by Josue Cruz on 8/10/22.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var viewModel = SignupViewModel()
        
    var body: some View {
        ZStack {
            Rectangle()
                .padding(.all, -50)
                .foregroundColor(viewModel.setBackgroundColor(user: viewModel.currentUser) as? Color)
            VStack{
                Text("Sign up")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .offset(y: -75)
                Text("WHO ARE YOU?")
                    .font(.system(size: 25))
                    .fontWeight(.heavy)
                    .offset(y: -50)
                
//MARK: ICONS
                HStack {
                    VStack {
                        Image("parent")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(100.0)
                            .opacity(viewModel.currentUser.rawValue == "parent" ? 1.0 : 0.5)
                            .onTapGesture {
                                viewModel.currentUser = .parent
                            }
                        Text("PARENT")
                            .foregroundColor(.yellow)
                            .fontWeight(.bold)
                            .offset(y: -10)
                            .opacity(viewModel.currentUser.rawValue == "parent" ? 1.0 : 0.5)
                    }
                    VStack {
                        Image("child")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(100.0)
                            .opacity(viewModel.currentUser.rawValue == "child" ? 1.0 : 0.5)
                            .onTapGesture {
                                viewModel.currentUser = .child
                            }
                        Text("CHILD")
                            .foregroundColor(.orange)
                            .fontWeight(.bold)
                            .offset(y: -10)
                            .opacity(viewModel.currentUser.rawValue == "child" ? 1.0 : 0.5)
                    }
                    VStack {
                        Image("teacher")
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(100.0)
                            .opacity(viewModel.currentUser.rawValue == "teacher" ? 1.0 : 0.5)
                            .onTapGesture {
                                viewModel.currentUser = .teacher
                            }
                        Text("TEACHER")
                            .foregroundColor(.cyan)
                            .fontWeight(.bold)
                            .offset(y: -10)
                            .opacity(viewModel.currentUser.rawValue == "teacher" ? 1.0 : 0.5)
                    }
                }
                
//MARK: TEXT FIELDS
                VStack {
                    HStack {
                        Image(systemName: "person")
                        TextField("User name", text: $viewModel.username)
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20))
                    }
                    .textFieldStyle(.roundedBorder)
                    HStack {
                        Image(systemName: "envelope")
                        TextField("Email", text: $viewModel.email)
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20))
                    }
                    .textFieldStyle(.roundedBorder)

                    HStack {
                        Image(systemName: "lock")
                        TextField("Password", text: $viewModel.password)
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20))
                    }
                    .textFieldStyle(.roundedBorder)
                    HStack {
                        Image(systemName: "lock")
                        TextField("Confirm Password", text: $viewModel.passwordConfirmation)
                            .frame(width: 250, height: 50)
                            .font(.system(size: 20))
                    }
                    .textFieldStyle(.roundedBorder)
                    .disabled(viewModel.password.count < 6 ? true : false)
                    .opacity(viewModel.password.count < 6 ? 0.5 : 1)
                    .foregroundColor(viewModel.password == viewModel.passwordConfirmation ? .black : .gray)
        
                }
                
//MARK: SIGNUP BUTTON
                Button(action: {
                    if !viewModel.email.isValidEmail {
                        viewModel.invalidEmail = true
                    }
                }) {
                    Text("SIGNUP")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .frame(width: 250, height: 40)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(viewModel.password.count < 6 || viewModel.password != viewModel.passwordConfirmation)
                
                .opacity(viewModel.password.count < 6 || viewModel.password != viewModel.passwordConfirmation ? 0.5 : 1)
                
                .alert("Enter valid Email", isPresented: $viewModel.invalidEmail) {
                    
                    Button("OK", role: .cancel) { }
                }
                .offset(y: 75)
                
//MARK: LOGIN OPTION
                HStack {
                    Text("Already have an account.")
                        .foregroundColor(.white)
                    Text("Login here")
                        .foregroundColor(.orange)
                }
                .offset(y: 100)
            }
        }
    }
}

//MARK: PREVIEWS
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}

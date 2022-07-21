//
//  ToDoList.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 04.07.2022.
//

import SwiftUI

struct LoginPage: View {
    private let secretUser = "admin"
    private let secretPassword = "password"
    
    @State var username: String = ""
    @State var password: String = ""
    @State var correctCredentials: Bool = false
    @State var emptyCredentials: Bool = false
    @State var incorrectCredentials: Bool = false
    
    var body: some View {
        VStack {
            WelcomeText()
            TextField("Username", text: $username)
                .padding()
                .background(Color.lightGray)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .accessibilityIdentifier("usernameField")
            SecureField("Password", text: $password)
                .padding()
                .background(Color.lightGray)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .accessibilityIdentifier("passwordField")
            Button(action: {
                checkCredentials()
            }) {
                GreenButton(buttonText: "Login")
            }
            .accessibilityIdentifier("loginButton")
            if incorrectCredentials {
                ErrorText(message: "Worng password or email")
            }
            
            if emptyCredentials {
                ErrorText(message: "Please email and password")
            }
            
            if correctCredentials {
                Text("Correct!")
                    .font(.title2)
                    .foregroundColor(.green)
                    .accessibilityIdentifier("messageText")
            }
        }
        .padding()
    }
    
    private func checkCredentials() {
        correctCredentials = false
        incorrectCredentials = false
        emptyCredentials = false
        
        if username == secretUser && password == secretPassword {
            correctCredentials = true
        } else if username.isEmpty || password.isEmpty {
            emptyCredentials = true
        } else {
            incorrectCredentials = true
        }
    }
}




struct WelcomeText : View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}

struct ErrorText : View {
    var message: String
    var body: some View {
        return Text(message)
            .foregroundColor(.red)
            .accessibilityIdentifier("messageText")
    }
}

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

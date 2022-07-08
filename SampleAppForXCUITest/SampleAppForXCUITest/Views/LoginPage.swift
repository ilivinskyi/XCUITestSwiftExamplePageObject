//
//  ToDoList.swift
//  SampleAppForXCUITest
//
//  Created by Ihor Livinskyi on 04.07.2022.
//

import SwiftUI

struct LoginPage: View {
    let secretUser = "admin"
    let secretPassword = "password"
    
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
                Text("Worng password or email")
                    .foregroundColor(.red)
                    .accessibilityIdentifier("errorText")
            }
            
            if emptyCredentials {
                Text("Please email and password")
                    .foregroundColor(.red)
                    .accessibilityIdentifier("errorText")
                
            }
            
            if correctCredentials {
                Text("Correct!")
                    .font(.title2)
                    .foregroundColor(.green)
                    .accessibilityIdentifier("successText")
            }
        }
        .padding()
    }
    
    func checkCredentials() {
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

struct ToDoList_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}

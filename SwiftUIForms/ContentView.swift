//
//  ContentView.swift
//  SwiftUIForms
//
//  Created by Kinney Kare on 3/24/21.
//

import SwiftUI

struct ContentView: View {
    //Be sure to understand what @State is doing
    @State var theUser = ""
    @State var airplaneModeIsOn = true
    @State var pushNotificationsAreOn = true
    @State private var previewIndex = 0
    var previewOptions = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PROFILE")) {
                    TextField("User", text: $theUser)
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.orange)
                                .cornerRadius(10)
                            
                            Image(systemName: "airplane")
                                .foregroundColor(.white)
                        }
                        Toggle("Airplane Mode", isOn: $airplaneModeIsOn)
                    }
                }
                Section(header: Text("NOTIFICATIONS")) {
                    Toggle("Push Notifications", isOn: $pushNotificationsAreOn)
                    Picker(selection: $previewIndex, label: Text("Show Previews")) {
                        ForEach(0 ..< previewOptions.count) {
                            Text(previewOptions[$0])
                        }
                    }
                }
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.0.0")
                    }
                }
                Section {
                    
                    HStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.gray)
                                .cornerRadius(10)
                            
                            Image(systemName: "gear")
                                .foregroundColor(.white)
                        }
                            
                        
                        Button(action: {
                            //Code goes here
                            print("All Settings Have Been Restored To Factory Settings!")
                        }, label: {
                            Text("Erase all Content and Settings")
                    })
                    }
                }
            }
            .navigationBarTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  BaseUser.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-24.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

class BaseUser{
    var id: Int
    var name: String
    var email: String
    var mobile: String
    var address: String
    var gender: Gender
    
    init() {
        self.id = 0
        self.name = ""
        self.email = ""
        self.mobile = ""
        self.address = ""
        self.gender = Gender.Male
    }
    
    init(id: Int, name: String, email: String, mobile: String, address: String, gender: Gender){
        self.id = id
        self.name = name
        self.email = email
        self.mobile = mobile
        self.address = address
        self.gender = gender
    }
    
    func displayUserID(){
        print("\t\tID: \(self.id)")
    }
    
    func displayData(){
//        print("\tID\t\t\tName\t\t\tGender\t\t\t Email\t\t\t\tContact\t\t\t\t\tAddress")
//        print("\t--\t\t\t----\t\t\t------\t\t\t -----\t\t\t\t-------\t\t\t\t\t-------")
//        print("\t\(self.id)\t\t\(self.name)\t\t\(self.gender)\t\t\(self.email)\t\t\(self.mobile)\t\t\(self.address)")
        print("\n\t\t\t\t\t\tID:     \t\t\t\(self.id)")
        print("\n\t\t\t\t\t\tName:   \t\t\t\(self.name)")
        print("\n\t\t\t\t\t\tGender: \t\t\t\(self.gender)")
        print("\n\t\t\t\t\t\tEmail:  \t\t\t\(self.email)")
        print("\n\t\t\t\t\t\tContact:\t\t\t\(self.mobile)")
        print("\n\t\t\t\t\t\tAddress:\t\t\t\(self.address)")
    }
    
    func addUser(){
        print("\nEnter details: ")
        print("\nEnter ID(numeric): ")
        self.id = (Int)(readLine()!)!
        print("\nEnter Name: ")
        self.name = readLine()!
        print("\nEnter Gender: ")
        print("\nPress :\n\tM for Male\n\tF for Female")
        let gend: String = readLine()!
        if (gend.elementsEqual("M")) || (gend.elementsEqual("m")){
            self.gender = Gender.Male
        } else if (gend.elementsEqual("F")) || (gend.elementsEqual("f")){
            self.gender = Gender.Female
        }
        print("\nEnter Email: ")
        self.email = readLine()!
        print("\nEnter Mobile: ")
        self.mobile = readLine()!
        print("\nEnter Address: ")
        self.address = readLine()!
    }
    
    func addUserWithID(userID: Int){
        self.id = userID
        print("\nEnter Name: ")
        self.name = readLine()!
        print("\nEnter Gender: ")
        print("\nPress :\n\tM for Male\n\tF for Female")
        let gend: String = readLine()!
        if (gend.elementsEqual("M")) || (gend.elementsEqual("m")){
            self.gender = Gender.Male
        } else if (gend.elementsEqual("F")) || (gend.elementsEqual("f")){
            self.gender = Gender.Female
        }
        print("\nEnter Email: ")
        self.email = readLine()!
        print("\nEnter Mobile: ")
        self.mobile = readLine()!
        print("\nEnter Address: ")
        self.address = readLine()!
    }
    
}

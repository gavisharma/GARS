//
//  Passenger.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-25.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

class Passenger: BaseUser{
    var passportNumber: String
    var age: Int
    var physicallyChallenged: Bool
    
    override init() {
        self.passportNumber = ""
        self.age = 0
        self.physicallyChallenged = false
        super.init()
    }
    
    init(id: Int, name: String, email: String, mobile: String, address: String, gender: Gender, passportNumber: String, age: Int, physicallyChallenged: Bool) {
        self.passportNumber = passportNumber
        self.age = age
        self.physicallyChallenged = physicallyChallenged
        super.init(id: id, name: name, email: email, mobile: mobile, address: address, gender: gender)
    }
    
    func enterPassengerDetailsWithID(passengerID: Int) -> Passenger {
        super.addUserWithID(userID: passengerID)
        print("\nEnter Passport Number: ")
        self.passportNumber = readLine()!
        print("\nEnter Age(only years numeric): ")
        self.age = (Int)(readLine()!)!
        print("\nAre you physically challenged?\n\tPress Y for YES\n\tPress N for NO")
        let chlngd: String = readLine()!
        if (chlngd.elementsEqual("Y")) || (chlngd.elementsEqual("y")) {
            self.physicallyChallenged = true
        } else if (chlngd.elementsEqual("N")) || (chlngd.elementsEqual("n")) {
            self.physicallyChallenged = false
        }
        return self
    }
    
    override func displayData() {
        print("\t\t\t\tPassenger details: ")
        delimiterWith(line: 1)
        super.displayData()
        print("\n\t\t\t\t\t\tPassport#:   \t\t\(self.passportNumber)")
        print("\n\t\t\t\t\t\tAge:         \t\t\(self.age)")
        print("\n\t\t\t\t\t\tHandicapped: \t\t\(self.physicallyChallenged)")
    }
}

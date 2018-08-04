//
//  PassengerDataHelper.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-31.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

class PassengerDataHelper {
    var passengers = [Int : Passenger]()
    
    init() {
        self.loadPassengers()
    }
    
    func loadPassengers(){
    }
    
    func displayPassengers(){
        for(_, passenger) in passengers.sorted(by: {$0.key < $1.key}){
            print("\(passenger.displayData())")
        }
    }
    
    func displayPassengerIds(){
        for(_, passenger) in passengers.sorted(by: {$0.key < $1.key}){
            print("\(passenger.displayUserID())")
        }
    }
    
    func deletePassengerWithId(empID: Int){
        passengers.removeValue(forKey: empID)
    }
    
    func addPassenger() -> Passenger{
        print("\nEnter details: ")
        print("\nEnter the Passenger ID(numeric):")
        let psngrID = (Int)(readLine()!)!
        var passengerID : Int = 0
        if passengerExistsWith(psngrID: psngrID){
            passengerID = reEnterPassengerID()
        } else if passengerID == 0 {
            passengerID = psngrID
        }
        let psngr = Passenger().enterPassengerDetailsWithID(passengerID: passengerID)
        passengers[psngr.id] = psngr
        return psngr
    }
    
    func reEnterPassengerID() -> Int{
        print("\nSorry! A passenger exists with this ID.\n\nPlease enter different Passenger ID:")
        var psngrId = (Int)(readLine()!)!
        if passengerExistsWith(psngrID: psngrId){
            psngrId = reEnterPassengerID()
        } else {
            return psngrId
        }
        return psngrId
    }
    
    func reEnterIDForPassenger(psngr: Passenger){
        print("Please enter different Passenger ID:")
        if passengerExistsWith(psngrID: (Int)(readLine()!)!){
            reEnterIDForPassenger(psngr: psngr)
        } else {
            passengers[psngr.id] = psngr
        }
    }
    
    func passengerExistsWith(psngrID: Int) -> Bool {
        var userInvalid: Bool
        if passengers[psngrID] == nil{
            userInvalid = false
        } else {
            userInvalid = true
        }
        return userInvalid
    }
}

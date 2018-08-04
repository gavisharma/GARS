//
//  Flight.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-27.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

class Flight{
    var id: Int
    var name: String
    var source: String
    var destination: String
    var plane: Plane
    var employee : Employee
    var baseFare : Double
    var bookedSeats: [String:[[Int:String]]]
    
    init() {
        self.id = 0
        self.name = ""
        self.source = ""
        self.destination = ""
        self.plane = Plane()
        self.employee = Employee()
        self.baseFare = 0.0
        bookedSeats = [String:[[Int:String]]]()
    }
    
    init(id: Int, name: String, source: String, destination: String, plane: Plane, employee: Employee, baseFare: Double) {
        self.id = id
        self.name = name
        self.source = source
        self.destination = destination
        self.plane = plane
        self.employee = employee
        self.baseFare = baseFare
        self.bookedSeats = [String:[[Int:String]]]()
    }
    
    func displayData(){
        delimiterWith(line: 1)
        print("\n\t\t\t\t\t\tID:     \t\t\t\(self.id)")
        print("\n\t\t\t\t\t\tName:   \t\t\t\(self.name)")
        print("\n\t\t\t\t\t\tSource: \t\t\t\(self.source)")
        print("\n\t\t\t\t\t\tDestination: \t\t\(self.destination)")
        print("\n\t\t\t\t\t\tPlane Type:  \t\t\(self.plane.PlaneType)")
//        print("\n\t\t\t\t\t\tChief Staff: \t\t\(self.employee.name)")
        print("\n\t\t\t\t\t\tBase Fare:   \t\t\(self.baseFare.asCurrency)")
    }
    
    func availableSeatsOn(date: String) -> Int{
        var availableSeats = 42
        guard let bookedSeat:[[Int:String]] = self.bookedSeats[date] else {
            return availableSeats
        }
        if (bookedSeat.count) > 0 {
            availableSeats -= bookedSeat.count
        }
        return availableSeats
    }
    
    func displayFlightID(){
        print("\t\tID: \(self.id) ---->\(self.name)")
    }
    
    func bookSeatForPassengerWith(id: Int, date: String) -> [String:[[Int:String]]]{
        print(bookedSeats)
        delimiterWith(line: 1)
        var row = ["A","B","C","D","E","F","G"]
        var seatsBooked: [String] = [String]()
        let bookedSeat:[[Int:String]]? = self.bookedSeats[date]
        if bookedSeat != nil {
            if (bookedSeat?.count)! > 0 {
                for booking in bookedSeat!{
                    for bookSeat in booking.values{
                        seatsBooked.append(bookSeat)
                    }
                }
            }
        }
        for i in 0..<row.count{
            var rowString = ""
            for j in 1...6{
                let seatString: String = row[i]+"\(j)"
                if seatsBooked.contains(seatString){
                    rowString = rowString + "\t\t" + "--"
                } else {
                    rowString = rowString + "\t\t" + seatString
                }
            }
            print(rowString + "\n")
        }
        print("\nPlease enter the seat number you want to book:")
        let selectedSeat: String = readLine()!
        if seatsBooked.count > 0 {
            self.bookedSeats[date]?.append([id:selectedSeat.uppercased()])
        } else {
            self.bookedSeats[date] = [[id:selectedSeat.uppercased()]]
        }
        delimiterWith(line: 1)
        return self.bookedSeats
    }
}

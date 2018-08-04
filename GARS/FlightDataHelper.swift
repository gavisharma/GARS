//
//  FlightDataHelper.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-27.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation
class FlightDataHelper{
    var flights = [Int : Flight]()
    
    init() {
        self.loadFlights()
    }
    
    func loadFlights(){
        let flight1 = Flight.init(id: 101, name: "Air Canada", source: "Toronto", destination: "Delhi", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 600.0)
        flights[flight1.id] = flight1
        
        let flight2 = Flight.init(id: 102, name: "Air Canada", source: "Toronto", destination: "Paris", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[102]!, baseFare: 400.0)
        flights[flight2.id] = flight2
        
        let flight3 = Flight.init(id: 103, name: "Air Canada", source: "Toronto", destination: "London", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 500.0)
        flights[flight3.id] = flight3
        
        let flight4 = Flight.init(id: 104, name: "Air Canada", source: "Toronto", destination: "Mumbai", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 400.0)
        flights[flight4.id] = flight4
        
        let flight5 = Flight.init(id: 105, name: "Air India", source: "Delhi", destination: "Toronto", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 450.0)
        flights[flight5.id] = flight5
        
        let flight6 = Flight.init(id: 106, name: "Air India", source: "Delhi", destination: "London", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 370.0)
        flights[flight6.id] = flight6
        
        let flight7 = Flight.init(id: 107, name: "Air India", source: "Delhi", destination: "Paris", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 450.0)
        flights[flight7.id] = flight7
        
        let flight8 = Flight.init(id: 108, name: "Air India", source: "Delhi", destination: "Mumbai", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[104]!, baseFare: 430.0)
        flights[flight8.id] = flight8
        
        let flight9 = Flight.init(id: 109, name: "Lufthansa", source: "Paris", destination: "Toronto", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 410.0)
        flights[flight9.id] = flight9
        
        let flight10 = Flight.init(id: 110, name: "Lufthansa", source: "Paris", destination: "London", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 440.0)
        flights[flight10.id] = flight10
        
        let flight11 = Flight.init(id: 111, name: "Lufthansa", source: "Paris", destination: "Delhi", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 500.0)
        flights[flight11.id] = flight11
        
        let flight12 = Flight.init(id: 112, name: "Lufthansa", source: "Paris", destination: "Mumbai", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[102]!, baseFare: 450.0)
        flights[flight12.id] = flight12
        
        let flight13 = Flight.init(id: 113, name: "British Airways", source: "London", destination: "Paris", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 550.0)
        flights[flight13.id] = flight13
        
        let flight14 = Flight.init(id: 114, name: "British Airways", source: "London", destination: "Delhi", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 450.0)
        flights[flight14.id] = flight14
        
        let flight15 = Flight.init(id: 115, name: "British Airways", source: "London", destination: "Mumbai", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 250.0)
        flights[flight15.id] = flight15
        
        let flight16 = Flight.init(id: 116, name: "British Airways", source: "London", destination: "Toronto", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 270.0)
        flights[flight16.id] = flight16
        
        let flight17 = Flight.init(id: 117, name: "Jet Airways", source: "Mumbai", destination: "London", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 350.0)
        flights[flight17.id] = flight17
        
        let flight18 = Flight.init(id: 118, name: "Jet Airways", source: "Mumbai", destination: "Paris", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[104]!, baseFare: 450.0)
        flights[flight18.id] = flight18
        
        let flight19 = Flight.init(id: 119, name: "Jet Airways", source: "Mumbai", destination: "Toronto", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 450.0)
        flights[flight19.id] = flight19
        
        let flight20 = Flight.init(id: 120, name: "Jet Airways", source: "Mumbai", destination: "Delhi", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 400.0)
        flights[flight20.id] = flight20
        
        let flight21 = Flight.init(id: 121, name: "Air France", source: "Toronto", destination: "Delhi", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 500.0)
        flights[flight21.id] = flight21
        
        let flight22 = Flight.init(id: 122, name: "Air France", source: "Toronto", destination: "Paris", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[102]!, baseFare: 300.0)
        flights[flight22.id] = flight22
        
        let flight23 = Flight.init(id: 123, name: "Air France", source: "Toronto", destination: "London", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 450.0)
        flights[flight23.id] = flight23
        
        let flight24 = Flight.init(id: 124, name: "Air France", source: "Toronto", destination: "Mumbai", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 450.0)
        flights[flight24.id] = flight24
        
        let flight25 = Flight.init(id: 125, name: "Qatar Airline", source: "Delhi", destination: "Toronto", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 350.0)
        flights[flight25.id] = flight25
        
        let flight26 = Flight.init(id: 126, name: "Qatar Airline", source: "Delhi", destination: "London", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 370.0)
        flights[flight26.id] = flight26
        
        let flight27 = Flight.init(id: 127, name: "Qatar Airline", source: "Delhi", destination: "Paris", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 550.0)
        flights[flight27.id] = flight27
        
        let flight28 = Flight.init(id: 128, name: "Qatart Airline", source: "Delhi", destination: "Mumbai", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[104]!, baseFare: 330.0)
        flights[flight28.id] = flight28
        
        let flight29 = Flight.init(id: 129, name: "Ethiopian Airlines", source: "Paris", destination: "Toronto", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 450.0)
        flights[flight29.id] = flight29
        
        let flight30 = Flight.init(id: 130, name: "Ethiopian Airlines", source: "Paris", destination: "London", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 490.0)
        flights[flight30.id] = flight30
        
        let flight31 = Flight.init(id: 131, name: "Ethiopian Airlines", source: "Paris", destination: "Delhi", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 450.0)
        flights[flight31.id] = flight31
        
        let flight32 = Flight.init(id: 132, name: "Ethiopian Airlines", source: "Paris", destination: "Mumbai", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[102]!, baseFare: 500.0)
        flights[flight32.id] = flight32
        
        let flight33 = Flight.init(id: 133, name: "Delta Airlines", source: "London", destination: "Paris", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 450.0)
        flights[flight33.id] = flight33
        
        let flight34 = Flight.init(id: 134, name: "Delta Airlines", source: "London", destination: "Delhi", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 500.0)
        flights[flight34.id] = flight34
        
        let flight35 = Flight.init(id: 135, name: "Delta Airlines", source: "London", destination: "Mumbai", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 350.0)
        flights[flight35.id] = flight35
        
        let flight36 = Flight.init(id: 136, name: "Delta Airlines", source: "London", destination: "Toronto", plane: PlaneDataHelper().planeList[101]!, employee: EmployeeDataHelper().employees[101]!, baseFare: 370.0)
        flights[flight36.id] = flight36
        
        let flight37 = Flight.init(id: 137, name: "Indigo", source: "Mumbai", destination: "London", plane: PlaneDataHelper().planeList[102]!, employee: EmployeeDataHelper().employees[103]!, baseFare: 450.0)
        flights[flight37.id] = flight37
        
        let flight38 = Flight.init(id: 138, name: "Indigo", source: "Mumbai", destination: "Paris", plane: PlaneDataHelper().planeList[103]!, employee: EmployeeDataHelper().employees[104]!, baseFare: 350.0)
        flights[flight38.id] = flight38
        
        let flight39 = Flight.init(id: 139, name: "Indigo", source: "Mumbai", destination: "Toronto", plane: PlaneDataHelper().planeList[104]!, employee: EmployeeDataHelper().employees[105]!, baseFare: 410.0)
        flights[flight39.id] = flight39
        
        let flight40 = Flight.init(id: 140, name: "Indigo", source: "Mumbai", destination: "Delhi", plane: PlaneDataHelper().planeList[105]!, employee: EmployeeDataHelper().employees[106]!, baseFare: 450.0)
        flights[flight40.id] = flight40
    }
    
    func searchFlightWithSource(){
        print("Please enter the source city:")
        let source: String = readLine()!
        print("Please enter the destination city:")
        let destination: String = readLine()!
        delimiterWith(line: 2)
        var allFlights:[Flight]? = [Flight]()
        for (_,flt) in flights {
            if flt.source.lowercased() == source.lowercased() && flt.destination.lowercased() == destination.lowercased() {
                allFlights?.append(flt)
            }
        }
        if (allFlights?.count)! > 0 {
            print("\t\t\t\t\t\tFlights list from \(source.uppercased()) to \(destination.uppercased()):")
            for flt in allFlights!{
                flt.displayData()
            }
            delimiterWith(line: 2)
        } else {
            print("Sorry! There are no flights available from \(source.uppercased()) to \(destination.uppercased()).")
            delimiterWith(line: 2)
        }
    }
    
    func searchFlight() -> [Flight] {
        print("Please enter the source city:")
        let source: String = readLine()!
        print("Please enter the destination city:")
        let destination: String = readLine()!
        var flight: [Flight] = [Flight]()
        for (_,flt) in flights {
            if flt.source.lowercased() == source.lowercased() && flt.destination.lowercased() == destination.lowercased(){
                flight.append(flt)
            }
        }
        return flight
    }
    
    func viewFlightsFor(date: String){
        for (_,flight) in (self.flights.sorted(by: {$0.key < $1.key})) {
            flight.displayData()
            print("\n\t\t\t\t\t\tAvailable Seats:  \t\(flight.availableSeatsOn(date: date))")
        }
    }
    
    func displayFlightIds(){
        for(_, flight) in flights.sorted(by: {$0.key < $1.key}){
            flight.displayFlightID()
        }
    }
    
    func deleteFlightWithId(flightId: Int){
        flights.removeValue(forKey: flightId)
    }
    
    func addFlight() {
        var id:Int
        var name:String
        var source:String
        var destination:String
        var basefare:Double
        var planeId: Int
        var employeeId : Int
        print("Enter Flight Id")
        id = (Int)(readLine()!)!
        print("Enter Flight Name")
        name = readLine()!
        print("Enter Source")
        source = readLine()!
        print("Enter Destination")
        destination = readLine()!
        print("************Select Flight Id From The List Below****************")
        print("Little Bit More With Our Servers**********")
        sleep(2)
        print("We Are Done**********")
        sleep(1)
        print("WE ARE DONE👍")
        planeDataHelper?.displayPlaneIds()
        print("Enter Plane Id")
        planeId = (Int)(readLine()!)!
        print("************Select Employee Id From The List Below****************")
        print("Little Bit More With Our Servers**********")
        sleep(2)
        print("We Are Done**********")
        sleep(1)
        print("WE ARE DONE👍")
        employeeHelper?.displayEmployeeIds()
        print("Enter Employee Id")
        employeeId = (Int)(readLine()!)!
        print("Enter Base Fair")
        basefare = (Double)(readLine()!)!
        //let selectedPlane:Plane = PlaneDataHelper().planeList[planeId]!
        //let emp:Employee = EmployeeDataHelper().employees[employeeId]!
        let newflight =  Flight.init(id: id, name: name, source: source, destination: destination, plane: PlaneDataHelper().planeList[planeId]!, employee: EmployeeDataHelper().employees[employeeId]!, baseFare: basefare)
        self.flights[newflight.id] = newflight
    }
}

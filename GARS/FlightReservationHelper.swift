//
//  FlightReservationHelper.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-30.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation
class FlightReservationHelper{
    var flights = [Int : FlightReservation]()
    
    init() {
        self.loadFlights()
    }
    
    func loadFlights(){
    }
    
    func searchReservationWithReservationID() -> [FlightReservation] {
        print("Please enter the Flight Reservation ID:")
        let source: Int = (Int)(readLine()!)!
        var reservedFlights: [FlightReservation] = [FlightReservation]()
        for (_,flt) in flights {
            if flt.id == source{
                reservedFlights.append(flt)
            }
        }
        return reservedFlights
    }
    
    func selectMeal() -> MealType{
        print("Please select the meal you want:")
        print("\tPress 1: Mexican")
        print("\tPress 2: Asian Hindu")
        print("\tPress 3: Vegetarian")
        print("\tPress 4: Non vegetarian")
        let mealType: MealType = (MealType)(rawValue: (Int)(readLine()!)!)!
        return mealType
    }
    
    func selectClass() -> FlightClassType{
        print("Please select the class of the flight:")
        print("\tPress 1: First Class")
        print("\tPress 2: Business")
        print("\tPress 3: Economy")
        let fltClass: FlightClassType = (FlightClassType)(rawValue: (Int)(readLine()!)!)!
        return fltClass
    }
    
    func calculateFareForFlight(flight: Flight, forClass: FlightClassType) -> Double{
        var totalFare: Double = 0.0
        switch forClass{
        case FlightClassType.Business:
            totalFare = flight.baseFare * 1.5
        case FlightClassType.First:
            totalFare = flight.baseFare * 2
        case FlightClassType.Economy:
            totalFare = flight.baseFare * 1
        }
        totalFare += totalFare * 0.13
        return totalFare
    }
    
    func bookFlight(flight: Flight){
        print("\nEnter date of travelling (in DD/MM/YYYY format and that too ohter than today):")
        var date: String = readLine()!
        if dateIsValid(date: date){
            date = formattedDateFrom(unformattedDate: date)
            print("\nEnter number of seats you want to book:")
            let requiredSeats: Int = (Int)(readLine()!)!
            if requiredSeats <= (flight.availableSeatsOn(date: date)) {
                for i in 0..<requiredSeats{
                    delimiterWith(line: 1)
                    print("\nPlease enter the details of the Passenger\(i+1):")
                    let passenger = passengerDataHelper?.addPassenger()
                    let mealType: MealType = selectMeal()
                    flight.bookedSeats = (flight.bookSeatForPassengerWith(id: (passenger?.id)!, date: date))
                    var flightReservationID: Int = 0
                    if flights.count > 0 {
                        for (id,_) in flights.sorted(by: {$0.key < $1.key}){
                            flightReservationID = id
                        }
                        flightReservationID += 1
                    } else {
                        flightReservationID = 10101
                    }
                    let reserveFlight: FlightReservation = FlightReservation( id: flightReservationID, flightDetail: flight, passengerDetail: passenger!, reservationStatus: ReservationStatus.Confirmed, reservationDate: date, selectedMeal: mealType, selectedClass: selectClass())
                    flights[flightReservationID] = reserveFlight
                    delimiterWith(line: 1)
                    print("Woohoo... Congratulations...!! The flight has been booked successfully...!!!")
                    print("\n\nPrinting receipt...")
                    sleep(3)
                    delimiterWith(line: 2)
                    reserveFlight.displayData()
                }
            } else {
                print("Sorry required number of seats are not available. Please try again with different date or lesser seats. Thanks")
            }
        } else {
            print("Please select another day to travel.\n\n")
        }
    }
    
    func noBookingsFor(id: Int){
        delimiterWith(line: 2)
        if id == -1 {
            print("There are no bookings so far...!!!")
        } else {
            print("There are no bookings for ID: \(id)...!!!")
        }
        delimiterWith(line: 2)
    }
    
    func searchBooking() -> FlightReservation? {
        var flightReservation: FlightReservation?
        if self.flights.count > 0 {
            print("Please enter the Reservation ID: ")
            let source: Int = (Int)(readLine()!)!
            flightReservation = flights[source]
            if flightReservation == nil {
                noBookingsFor(id: source)
            }
        } else {
            noBookingsFor(id: -1)
        }
        return flightReservation
    }
    
    func cancelBooking(){
        let cancelFlight = searchBooking()
        if cancelFlight != nil {
            cancelFlight?.reservationStatus = .Cancelled
            cancelFlight?.displayData()
        }
    }
    
    func promptEditingInput(){
        print("To change the date please cancel the current booking and proceed with new booking. Thanks!\n\n")
        print("\tPlease choose what do you want to update...")
        print("\t\tPress N: To change the name of the passenger")
        print("\t\tPress P: To change the contact of the passenger")
        print("\t\tPress E: To change the email of the passenger")
        print("\t\tPress A: To change the Age of the passenger")
        print("\t\tPress C: To change the class of the flight")
        print("\t\tPress M: To change the type of the meal")
        print("\t\tPress S: To save changes and go back")
    }
    
    func editBooking(){
        let editReservation: FlightReservation? = searchBooking()
        if editReservation != nil {
            promptEditingInput()
            var choice = readLine()!.uppercased()
            while !choice.elementsEqual("S") {
                switch choice{
                case "N":
                    delimiterWith(line: 1)
                    print("\nPlease enter new Name:")
                    editReservation?.passengerDetail.name = readLine()!
                case "P":
                    delimiterWith(line: 1)
                    print("\nPlease enter new Contact Number:")
                    editReservation?.passengerDetail.mobile = readLine()!
                case "E":
                    delimiterWith(line: 1)
                    print("\nPlease enter new Email:")
                    editReservation?.passengerDetail.email = readLine()!
                case "A":
                    delimiterWith(line: 1)
                    print("\nPlease enter new Age:")
                    editReservation?.passengerDetail.age = (Int)(readLine()!)!
                case "C":
                    delimiterWith(line: 1)
                    editReservation?.selectedClass = selectClass()
                case "M":
                    delimiterWith(line: 1)
                    print("\nPlease enter new Name:")
                    editReservation?.selectedMeal = selectMeal()
                case "S":
                    editReservation?.displayData()
                    delimiterWith(line: 2)
                default:
                    print("Sorry. Invalid input. Please select valid option.")
                }
                promptEditingInput()
                choice = readLine()!.uppercased()
            }
        }
    }
}

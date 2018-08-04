//
//  FlightReservation.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-30.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

class FlightReservation{
    var id: Int
    var flightDetail: Flight
    var passengerDetail: Passenger
    var reservationStatus: ReservationStatus
    var reservationDate: String
    var selectedMeal: MealType
    var selectedClass: FlightClassType
    var bookingDate: String
    
    //Get only and computed property
    var totalFare: Double?{
        get{
            if reservationStatus == .Cancelled {
                return 0.0
            } else {
                switch self.selectedClass {
                case .First:
                    return 2 * self.flightDetail.baseFare
                case .Business:
                    return 1.5 * self.flightDetail.baseFare
                case .Economy:
                    return 1 * self.flightDetail.baseFare
                }
            }
        }
    }
    
    init() {
        self.id = 0
        self.flightDetail = Flight()
        self.passengerDetail = Passenger()
        self.reservationStatus = ReservationStatus.InProgress
        self.reservationDate = ""
        self.selectedMeal = MealType.AsianHindu
        self.selectedClass = FlightClassType.Economy
        self.bookingDate = convertDateToString(date: Date())
    }
    
    init(id: Int, flightDetail: Flight, passengerDetail: Passenger, reservationStatus: ReservationStatus, reservationDate: String, selectedMeal: MealType, selectedClass: FlightClassType) {
        self.id = id
        self.flightDetail = flightDetail
        self.passengerDetail = passengerDetail
        self.reservationStatus = reservationStatus
        self.reservationDate = formattedDateFrom(unformattedDate: reservationDate)
        self.selectedMeal = selectedMeal
        self.selectedClass = selectedClass
        self.bookingDate = convertDateToString(date: Date())
    }
    
    func displayData(){
        print("\t\t\t\tPassenger Details:")
        delimiterWith(line: 1)
        print("\n\t\t\t\t\t\tReservation ID:   \(self.id)")
        print("\n\t\t\t\t\t\tPassenger Name:   \(self.passengerDetail.name.uppercased())")
        print("\n\t\t\t\t\t\tGender:           \(self.passengerDetail.gender)")
        print("\n\t\t\t\t\t\tAge:              \(self.passengerDetail.age)")
        print("\n\t\t\t\t\t\tContact:          \(self.passengerDetail.mobile.uppercased())")
        print("\n\t\t\t\t\t\tEmail:            \(self.passengerDetail.email.uppercased())")
        delimiterWith(line: 1)
        print("\t\t\t\tFlight Details:")
        delimiterWith(line: 1)
        print("\n\t\t\t\t\t\tFlight Name:      \(self.flightDetail.name.uppercased())")
        print("\n\t\t\t\t\t\tDeparting From:   \(self.flightDetail.source.uppercased())")
        print("\n\t\t\t\t\t\tArriving At:      \(self.flightDetail.destination.uppercased())")
        print("\n\t\t\t\t\t\tDeparture Date:   \(self.reservationDate)")
        delimiterWith(line: 1)
        print("\t\t\t\tReservation Details:")
        delimiterWith(line: 1)
        print("\n\t\t\t\t\t\tBooking Date:     \(self.bookingDate)")
        print("\n\t\t\t\t\t\tSelected Class:   \(self.selectedClass)")
        print("\n\t\t\t\t\t\tBooking Status:   \(self.reservationStatus)")
        print("\n\t\t\t\t\t\tSelected Meal:    \(self.selectedMeal)")
        delimiterWith(line: 1)
        print("\t\t\t\t\t\tTotal Fare:       \(self.totalFare?.asCurrency ?? 0.0.asCurrency)")
        delimiterWith(line: 2)
        print("\n\n\n")
    }
}

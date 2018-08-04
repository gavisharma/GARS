//
//  Utilities.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-25.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

enum JobType: Int {
    case Full_Time = 1
    case Part_Time
}

enum Experience: Int {
    case One = 1
    case Two
    case Three
    case Four
    case Five
}

enum Gender: Int{
    case Male = 1
    case Female
}

enum FlightClassType: Int{
    case First = 1
    case Business
    case Economy
}

enum AirportList : Int{
    case Pearson_Airport = 1
    case Indira_Gandhi_International_Airport
    case Charles_de_Gaulle_Airport
    case Heathrow_Airport
    case Chhatrapati_Shivaji_International_Airport
    case International_Airport
}

enum Citiies: Int{
    case Toronto = 1
    case Delhi
    case Paris
    case London
    case Mumbai
    case Chandigarh
}

enum PlaneType: Int{
    case Boeing_747 = 1
    case Boeing_787
    case Airbus_A380
    case Embraer_190
    case Bombardier_CRJ900
    case None
}

enum ReservationStatus: Int{
    case Confirmed = 1
    case InProgress
    case Cancelled
    case Waiting
    case Voided
}

enum MealType: Int{
    case Mexican = 1
    case AsianHindu
    case Vegetarian
    case NonVegetarian
}

func dateIsValid(date: String) -> Bool{
    var isValid: Bool = false
    let date:Date = convertStringToDate(dateString: date)
    if  date.compare(Date()).rawValue > 0{
        isValid = true
    }
    return isValid
}

func convertDateToString(date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MMM-yyyy"
    // again convert your date to string
    let myStringafd = formatter.string(from: date)
    return myStringafd
}

func convertStringToDate(dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy"
    dateFormatter.locale = Locale.current
    guard let date = dateFormatter.date(from: dateString) else {
        return Date()
    }
    return date
}

func formattedDateFrom(unformattedDate: String) -> String {
    let formatter = DateFormatter()
    // initially set the format based on your datepicker date / server String
    formatter.dateFormat = "dd-MM-yyyy"
    // convert your string to date
    let yourDate = formatter.date(from: unformattedDate)
    //then again set the date format whhich type of output you need
    formatter.dateFormat = "dd-MMM-yyyy"
    // again convert your date to string
    let myStringafd = formatter.string(from: yourDate!)
    
    return myStringafd
}

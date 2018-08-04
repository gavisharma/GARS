//
//  main.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-26.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//


//TODO

//Display updated flight info after updation
//Seat deletion after flight cancellation


import Foundation

var admin: String = ""
var flightHelper: FlightDataHelper?
var planeDataHelper: PlaneDataHelper?
var employeeHelper: EmployeeDataHelper?
var passengerDataHelper: PassengerDataHelper?
var flightReservationHelper: FlightReservationHelper?

//MARK: Admins
let admins = ["govinda":"sharma", "arshdeep":"singh", "foram":"dadhania"]

func delimiterWith(line: Int){
    if line == 1 {
        print("\n-------------------------------------------------------------------------------------------------------------\n")
    } else if line == 2{
        print("\n=============================================================================================================\n")
    }
}

//MARK:
//MARK: Intro of APP
func showIntro(){
    print("\n\t\t\t\t\t\t\t\t*** Welcome to GARS ***\n\t\t\t\t\t\t\tGAVI ARSH AIR RESERVATION SYSTEM\n")
}

//MARK:
//MARK: Prompt USER Type
func promptInput(){
    delimiterWith(line: 1)
    print("Please select an option:\t\tPress A : ADMIN\n\t\t\t\t\t\t\t\tPress U : USER\n\t\t\t\t\t\t\t\tPress X : EXIT")
    delimiterWith(line: 1)
}

//MARK:
//MARK: Method to print all the employees
func viewAllEmployees(){
    print("Generating List...")
    sleep(1)
    delimiterWith(line: 2)
    print("\t\t\t\tFollowing is the list of all the employees:")
    delimiterWith(line: 1)
    employeeHelper?.displayEmployees()
    adminSubRoutine()
}

//MARK:
//MARK: Method to delete an employee
func deleteEmployee(){
    delimiterWith(line: 2)
    print("Please enter the ID of the Employee you want to delete (from the following):")
    employeeHelper?.displayEmployeeIds()
    let userId: Int = (Int)(readLine()!)!
    employeeHelper?.deleteEmployeeWithId(empID: userId)
    delimiterWith(line: 1)
    print("Deleting user...")
    sleep(1)
    print("User with ID: \(userId) has been deleted.")
    delimiterWith(line: 2)
    adminSubRoutine()
}

func deleteFlight(){
    print("Loading List Please Wait*******")
    sleep(1)
    flightHelper?.displayFlightIds()
    print("Please enter the ID of the Flight you want to delete (from the following):")
    let flightid: Int = (Int)(readLine()!)!
    flightHelper?.deleteFlightWithId(flightId: flightid)
    print("Removing******")
    sleep(2)
    print("Flight with ID: \(flightid) has been deleted.")
    sleep(1)
    adminSubRoutine()
}

func deletePlane(){
    print("Loading List Please Wait*******")
    sleep(1)
    planeDataHelper?.displayPlaneIds()
    print("Please enter the ID of the Plane you want to delete (from the following):")
    let planeid: Int = (Int)(readLine()!)!
    planeDataHelper?.deletePlaneWithId(planeId: planeid)
    print("Removing******")
    sleep(2)
    print("Plane with ID: \(planeid) has been deleted.")
    sleep(1)
    adminSubRoutine()
}

//MARK:
//MARK: Maethod to add an employee
func addEmployee(){
    delimiterWith(line: 2)
    employeeHelper?.addEmployees()
    print("User added succesfully.")
    delimiterWith(line: 2)
    adminSubRoutine()
}

func viewAllPlanes(){
    for (_,plane) in (planeDataHelper?.planeList.sorted(by: {$0.key < $1.key}))! {
        print(plane.displayData())
    }
    adminSubRoutine()
}

//MARK:
//MARK: Admin's duties
func adminSubRoutine(){
    delimiterWith(line: 2)
    print("\tWelcome: \(admin) (Admin)")
    print("\n\t\t\t\tPress 1: To view all Employees")
    print("\t\t\t\tPress 2: To Delete an Employee")
    print("\t\t\t\tPress 3: To Add an Employee")
    print("\t\t\t\tPress 4: To View all Flights")
    print("\t\t\t\tPress 5: To Add a Flight")
    print("\t\t\t\tPress 6: To Delete a Flight")
    print("\t\t\t\tPress 7: To View all Planes")
    print("\t\t\t\tPress 8: To Add a Plane")
    print("\t\t\t\tPress 9: To Delete a Plane")
    print("\t\t\t\tPress 0: Go Back\n\n")
    let adminInput: Int = (Int)(readLine()!)!
    switch adminInput {
    case 1:
        viewAllEmployees()
    case 2:
        deleteEmployee()
    case 3:
        addEmployee()
    case 4:
        viewAllFlights()
        adminSubRoutine()
    case 5 :
        flightHelper?.addFlight()
        adminSubRoutine()
        break
    case 6 :
        deleteFlight()
        break
    case 7 :
        viewAllPlanes()
        break
    case 8 :
        planeDataHelper?.addPlane()
        print("*****Returning To Menu*****")
        sleep(1)
        adminSubRoutine()
        break
    case 9 :
        deletePlane()
        break
    case 0:
        initialStep()
    default:
        print("Default case")
    }
}

//MARK:
//MARK: View all flights
func viewAllFlights(){
    delimiterWith(line: 1)
    print("Please enter the date(in dd-mm-yyyy format) for which you want to enquire for the flights:")
    var date = readLine()!
    date = formattedDateFrom(unformattedDate: date)
    delimiterWith(line: 2)
    print("\t\t\t\t\tFlights List for \(date) is below:")
    flightHelper?.viewFlightsFor(date: date)
    delimiterWith(line: 2)
    print("\n\n\n")
}

//MARK:
//MARK: Search a flight
func searchFlight(){
    flightHelper?.searchFlightWithSource()
//    for flight in (flightHelper?.searchFlight())!{
//        flight.displayData()
//    }
    userSubRoutine()
}

//MARK:
//MARK: Book a flight
func bookFlight(){
    var flights: [Flight]
    flights = (flightHelper?.searchFlight())!
    if flights.count > 0 {
        delimiterWith(line: 2)
        print("\n\t\t\t\t\tAvailable flights are:")
        for flight in flights{
            flight.displayData()
//            print("\nID: \(flight.id)  Name: \(flight.name)  Source: \(flight.source)  Destination: \(flight.destination)\nPlane Type: \(flight.plane.PlaneType)  Chief Staff: \(flight.employee.name)  Base Fare: \(flight.baseFare.asCurrency)\n")
        }
        delimiterWith(line: 1)
        print("\n\nEnter the Flight ID to proceed to booking:")
        let flightID: Int = (Int)(readLine()!)!
        var flight: Flight?
        for flt in flights{
            if flt.id == flightID {
                flight = flt
            }
        }
        if flight == nil {
            print("There is no such flight.")
        } else {
            flightReservationHelper?.bookFlight(flight: flight!)
        }
    } else {
        print("Sorry! There are no flights available from this location.\nPlease select another location.\nThanks.\n\n")
    }
    userSubRoutine()
}

//MARK:
//MARK: View all bookings
func viewBookings(){
    delimiterWith(line: 2)
    for (_,flight) in (flightReservationHelper?.flights.sorted(by: { $0.key < $1.key }))! {
        flight.displayData()
    }
    userSubRoutine()
}

func searchBooking(){
//    flightReservationHelper?.searchBookings()
    let reservedFlight = flightReservationHelper?.searchBooking()
    if reservedFlight != nil {
        reservedFlight?.displayData()
    }
    userSubRoutine()
}

func editBooking(){
    flightReservationHelper?.editBooking()
    userSubRoutine()
}

func cancelBooking(){
    flightReservationHelper?.cancelBooking()
    userSubRoutine()
}

//MARK:
//MARK: User's duties
func userSubRoutine(){
    delimiterWith(line: 2)
    print("\n\n\tWelcome Guest user:")
    print("\n\t\t\t\tPress 1: To view all Flights and availbale seats on a particular day")
    print("\t\t\t\tPress 2: To search a Flight")
    print("\t\t\t\tPress 3: To book a Flight")
    print("\t\t\t\tPress 4: To view the bookings")
    print("\t\t\t\tPress 5: To search bookings")
    print("\t\t\t\tPress 6: To edit the booking")
    print("\t\t\t\tPress 7: To cancel the booking")
    print("\t\t\t\tPress 8: Go Back\n\n")
    let userInput: Int = (Int)(readLine()!)!
    switch userInput {
    case 1:
        viewAllFlights()
        userSubRoutine()
    case 2:
        searchFlight()
    case 3:
        bookFlight()
    case 4:
        viewBookings()
    case 5:
        searchBooking()
    case 6:
        editBooking()
    case 7:
        cancelBooking()
    default:
        initialStep()
    }
}

//MARK:
//MARK: Verify admin
func verifyAdmin(){
    print("Press Y to continue or N to Go Back...")
    let cont: String = readLine()!
    if cont == "Y" || cont == "y" {
        print("\nPlease enter Username: ")
        let userName: String = readLine()!
        print("\nPlease enter your password: ")
        let password: String = readLine()!
        if admins[userName] == password{
            print("Login successful")
            admin = userName.uppercased()
            adminSubRoutine()
        } else if admins[userName] == nil {
            print("User doesn't exist.")
            verifyAdmin()
            print("\n\n")
        }
        else{
            print("Incorrect username/password")
            verifyAdmin()
            print("\n\n")
        }
    } else{
        initialStep()
    }
}

//MARK:
//MARK: Initial and Main menu step
func initialStep(){
    if flightHelper == nil{
        flightHelper = FlightDataHelper()
    }
    if planeDataHelper == nil{
        planeDataHelper = PlaneDataHelper()
    }
    if employeeHelper == nil{
        employeeHelper = EmployeeDataHelper()
    }
    if flightReservationHelper == nil {
        flightReservationHelper = FlightReservationHelper()
    }
    if passengerDataHelper == nil {
        passengerDataHelper = PassengerDataHelper()
    }
    var userInput: String
    promptInput()
    userInput = readLine()!
//    while !userInput.uppercased().elementsEqual("X") {
//        switch userInput.uppercased(){
//        case "A":
//            verifyAdmin()
//            print("Admin role completed")
//        case "U":
//            userSubRoutine()
//            print("User role comoleted")
//        case "X":
//            return
//        default:
//            print("Sorry! You provided and invalid input.\n\n")
//            promptInput()
//            userInput = readLine()!
//        }
//    }
    if userInput.elementsEqual("A") || userInput.elementsEqual("a") {
        delimiterWith(line: 2)
        print("You selected to proceed as an Admin.\n")
        verifyAdmin()
    } else if userInput.elementsEqual("U") || userInput.elementsEqual("u") {
        userSubRoutine()
    } else if !((userInput.elementsEqual("x")) || (userInput.elementsEqual("X"))){
        initialStep()
    }
    print("\n\n\n\n\n")
}

showIntro()
initialStep()



//Uncomment the following code to enter the passenger details
//var psngr = Passenger()
//psngr.enterPassengerDetails()
//psngr.displayData()

//
//  EmployeeDataHelper.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-26.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

class EmployeeDataHelper {
    var employees = [Int : Employee]()
    
    init() {
        self.loadEmployees()
    }
    
    func loadEmployees(){
        let emp1 = Employee(id: 101, name: "Jigisha  Patel", email: "jigisha.patel@ai.ca", mobile: "6477577191", address: "4 Scarborough Denison", gender: Gender.Female, designation: " Pilot ", sin: "334535423", jobType: JobType.Full_Time, experience: Experience.Five)
        employees[emp1.id] = emp1
        
        let emp2 = Employee(id: 102, name: "Arshdeep Singh", email: "arshdipsingh@jet.ca", mobile: "2265013433", address: "4 Plasm Av Etobicoke", gender: Gender.Male, designation: " Pilot ", sin: "324654234", jobType: JobType.Part_Time, experience: Experience.Two)
        employees[emp2.id] = emp2
        
        let emp3 = Employee(id: 103, name: "Arshdeep Singh", email: "arsh__deep__@ba.ca", mobile: "2264544823", address: "5 Lafleur Ct Brampton", gender: Gender.Male, designation: "CoPilot", sin: "326554234", jobType: JobType.Full_Time, experience: Experience.Three)
        employees[emp3.id] = emp3
        
        let emp4 = Employee(id: 104, name: "Jigisha  Patel", email: "patel.jigisha@ai.ca", mobile: "6476857190", address: "4 EastWest Scarborough", gender: Gender.Female, designation: "CoPilot", sin: "334545542", jobType: JobType.Part_Time, experience: Experience.Five)
        employees[emp4.id] = emp4
        
        let emp5 = Employee(id: 105, name: "Govinda Sharma", email: "govindasharma@lh.ca", mobile: "2265017482", address: "3, Teal Drive, Guelph", gender: Gender.Male, designation: " Pilot ", sin: "324654234", jobType: JobType.Full_Time, experience: Experience.Five)
        employees[emp5.id] = emp5
        
        let emp6 = Employee(id: 106, name: "Govinda Sharma", email: "_gavi_sharma_@lh.ca", mobile: "226501GAVI", address: "3, Teal Drive, Guelph", gender: Gender.Male, designation: "CoPilot", sin: "329054234", jobType: JobType.Full_Time, experience: Experience.Five)
        employees[emp6.id] = emp6
    }
    
    func displayEmployees(){
        for(_, employee) in employees.sorted(by: {$0.key < $1.key}){
            employee.displayData()
        }
    }
    
    func displayEmployeeIds(){
        for(_, employee) in employees.sorted(by: {$0.key < $1.key}){
            employee.displayUserID()
        }
    }
    
    func deleteEmployeeWithId(empID: Int){
        employees.removeValue(forKey: empID)
    }
    
    func addEmployees() {
        print("\nEnter details: ")
        print("\nEnter Employee ID(numeric):")
        let empID = (Int)(readLine()!)!
        var employeeID : Int = 0
        if employeeExistsWith(empId: empID){
            employeeID = reEnterEmployeeID()
        } else if employeeID == 0 {
            employeeID = empID
        }
        let emp = Employee().addEmployeeWith(empID: employeeID)
        employees[emp.id] = emp
    }
    
    func reEnterEmployeeID() -> Int{
        print("\nSorry! An Empoyee exists with this ID.\n\nPlease enter different Employee ID:")
        var empId = (Int)(readLine()!)!
        if employeeExistsWith(empId: empId){
            empId = reEnterEmployeeID()
        } else {
            return empId
        }
        return empId
    }
    
    func addEmployee(){
        let emp = Employee().addEmployee()
        if employeeExistsWith(empId: emp.id){
            reEnterIDForEmployee(empl: emp)
        } else {
            employees[emp.id] = emp
        }
    }
    
    func reEnterIDForEmployee(empl: Employee){
        print("Please enter different Employee ID:")
        empl.id = (Int)(readLine()!)!
        if employeeExistsWith(empId: (Int)(readLine()!)!){
            reEnterIDForEmployee(empl: empl)
        } else {
            employees[empl.id] = empl
        }
    }
    
    func employeeExistsWith(empId: Int) -> Bool {
        var userInvalid: Bool
        if employees[empId] == nil{
            userInvalid = false
        } else {
            userInvalid = true
        }
        return userInvalid
    }
}

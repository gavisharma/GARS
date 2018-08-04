//
//  Employee.swift
//  GARS
//
//  Created by Govinda Sharma on 2018-07-25.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation

class Employee: BaseUser{
    var sin: String
    var designation: String
    var jobType: JobType
    var experience: Experience
    
    override init() {
        self.sin = ""
        self.designation = ""
        self.jobType = JobType.Full_Time
        self.experience = Experience.Five
        super.init()
    }
    
    init(id: Int, name: String, email: String, mobile: String, address: String, gender: Gender, designation: String, sin: String, jobType: JobType, experience: Experience) {
        self.sin = sin
        self.designation = designation
        self.jobType = jobType
        self.experience = experience
        super.init(id: id, name: name, email: email, mobile: mobile, address: address, gender: gender)
    }
    
    override func displayData(){
        super.displayData()
//        print("\n\t\t\t\t\t\t\t\tDesignation\t\tJob Type\t\tExperience")
//        print("\t\t\t\t\t\t\t\t-----------\t\t--------\t\t----------")
//        print("\t\t\t\t\t\t\t\t\(self.designation)\t\t\t\(self.jobType)\t\t\t\(self.experience)")
        print("\n\t\t\t\t\t\tDesignation: \t\t\(self.designation)")
        print("\n\t\t\t\t\t\tJob Type:    \t\t\(self.jobType)")
        print("\n\t\t\t\t\t\tExperience:  \t\t\(self.experience)")
        delimiterWith(line: 1)
    }
    
    override func displayUserID() {
        super.displayUserID()
    }
    
    func addEmployeeWith(empID: Int) -> Employee{
        super.addUserWithID(userID: empID)
        print("Enter SIN: ")
        self.sin = readLine()!
        print("Enter Designation: ")
        self.designation = readLine()!
        print("Enter experience:\n\tPress 1 for One Year\n\tPress 2 for Two Years\n\tPress 3 for Three Years\n\tPress 4 for Four Years\n\tPress 5 for Five+ Years")
        let exp: Int = (Int)(readLine()!)!
        switch exp {
        case 1: self.experience = Experience.One
        case 2: self.experience = Experience.Two
        case 3: self.experience = Experience.Three
        case 4: self.experience = Experience.Four
        case 5: self.experience = Experience.Five
        default: self.experience = Experience.Five
        }
        print("Enter Job Type:\n\tPress F for Full Time\n\tPress P for Part Time")
        let job: String = readLine()!
        if job.elementsEqual("F") || job.elementsEqual("f"){
            self.jobType = JobType.Full_Time
        } else if job.elementsEqual("P") || job.elementsEqual("p"){
            self.jobType = JobType.Part_Time
        }
        return self
    }
    
    func addEmployee() -> Employee{
        super.addUser()
        print("Enter SIN: ")
        self.sin = readLine()!
        print("Enter Designation: ")
        self.designation = readLine()!
        print("Enter experience:\n\tPress 1 for One Year\n\tPress 2 for Two Years\n\tPress 3 for Three Years\n\tPress 4 for Four Years\n\tPress 5 for Five+ Years")
        let exp: Int = (Int)(readLine()!)!
        switch exp {
        case 1: self.experience = Experience.One
        case 2: self.experience = Experience.Two
        case 3: self.experience = Experience.Three
        case 4: self.experience = Experience.Four
        case 5: self.experience = Experience.Five
        default: self.experience = Experience.Five
        }
        print("Enter Job Type:\n\tPress F for Full Time\n\tPress P for Part Time")
        let job: String = readLine()!
        if job.elementsEqual("F") || job.elementsEqual("f"){
            self.jobType = JobType.Full_Time
        } else if job.elementsEqual("P") || job.elementsEqual("p"){
            self.jobType = JobType.Part_Time
        }
        return self
    }
}

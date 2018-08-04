//
//  Plane.swift
//  plane
//
//  Created by Govinda Sharma on 2018-07-24.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation
class Plane{
    
    private var id : Int
    private var name : String
    private var capacity : Int
    private var type : PlaneType
    
    var Id : Int{
        get{ return self.id}
        set{self.id = newValue}
    }
    
    var PlaneType : PlaneType{
        get{ return self.type}
        set{self.type = newValue}
    }
    
    var Name : String{
        get{return self.name}
        set{self.name = newValue}
    }
    
    var PlaneCapacity : Int{
        get{return self.capacity}
        set{self.capacity = newValue}
    }
    
    init(){
        self.id = 0
        self.name = ""
        self.capacity = 0
        self.type = .Airbus_A380
    }
    
    init(planeID: Int, planeName: String, planeCapacity: Int, planetype: PlaneType){
        self.id = planeID
        self.name = planeName
        self.capacity = planeCapacity
        self.type = planetype
        }
    
    
    func displayData() -> String{
        var returnData = ""
   
        if self.id != 0{
            returnData += "\tPlane ID : \(String(describing: self.id))"
        }
        if !self.name.elementsEqual("") {
            returnData += "\tPlane Name : " + self.name
        }
        if self.capacity != 0{
            returnData += "\tPlane Capacity : \(String(describing: self.capacity))"
        }
        if self.type.rawValue != 0{
            returnData += "\tPlane Type : \(self.type)"
        }
            return returnData
    }
    
    func dispPlaneID() {
        print("\(self.Id)---->\(self.type)")
    }
}

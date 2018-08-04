//
//  PlaneDataHelper.swift
//  plane
//
//  Created by Govinda Sharma on 2018-07-24.
//  Copyright © 2018 Govinda Sharma. All rights reserved.
//

import Foundation


class PlaneDataHelper{
    var planeList = [Int : Plane]()
    
    init(){
        self.loadPlanes()
    }
    
    func loadPlanes(){
        planeList = [:]
        
        let AirCanada = Plane(planeID: 101 , planeName: "Air Canada", planeCapacity: 300, planetype : .Boeing_747 )
        planeList[AirCanada.Id] = AirCanada
        
        let JetAirways = Plane(planeID: 102, planeName: "Jet Airways", planeCapacity: 400, planetype : .Bombardier_CRJ900 )
        planeList[JetAirways.Id] = JetAirways
        
        let AirIndia = Plane(planeID: 103, planeName: "Air India", planeCapacity: 250, planetype : .Embraer_190 )
        planeList[AirIndia.Id] = AirIndia
        
        let BritishAirways = Plane(planeID: 104, planeName: "British Airways", planeCapacity: 290, planetype : .Airbus_A380 )
        planeList[BritishAirways.Id] = BritishAirways
        
        let Lufthansa = Plane(planeID: 105, planeName: "Lufthansa", planeCapacity: 290, planetype : .Boeing_787 )
        planeList[Lufthansa.Id] = Lufthansa
    }
    
    func addPlane(){
        let id:Int?
        let planename : String?
        let planecapacity : Int?
        var planetypeid : Int?
        var planetype : PlaneType = PlaneType.None
        print("Enter Planne ID")
        id = (Int)(readLine()!)!
        print("Enter Plane Name")
        planename = readLine()!
        print("Enter Plane Capacity")
        planecapacity = (Int)(readLine()!)!
        print("******SELECT PLANE TYPE*******")
        sleep(1)
        print("************Select Plane Type From The List Below****************")
        print("Little Bit More With Our Servers**********")
        sleep(2)
        print("Little Bit More**********")
        sleep(1)
        print("WE ARE DONE👍")
        print("Press 1 For Boeing_747")
        print("Press 2 For Boeing_787")
        print("Press 3 For Airbus_A380")
        print("Press 4 For Embraer_190")
        print("Press 5 For Bombardier_CRJ900")
        print("Enter Plane Type")
        planetypeid = (Int)(readLine()!)!
        if planetypeid == 1 {
            planetype = PlaneType.Boeing_747
        }
        else if planetypeid == 2 {
            planetype = PlaneType.Boeing_787
        }
        else if planetypeid == 3 {
            planetype = PlaneType.Airbus_A380
        }
        else if planetypeid == 4 {
            planetype = PlaneType.Embraer_190
        }
        else if planetypeid == 5 {
            planetype = PlaneType.Bombardier_CRJ900
        }
        let newplane = Plane(planeID: id!, planeName: planename!, planeCapacity: planecapacity!, planetype: planetype)
        planeList[newplane.Id] = newplane
        print("******Adding Plane******")
        sleep(2)
        print("Plane Added SuccessFully")
    }
    
    func displayPlaneIds(){
        for(_, plane) in planeList.sorted(by: {$0.key < $1.key}){
            plane.dispPlaneID()
        }
    }
    
    func deletePlaneWithId(planeId: Int){
        planeList.removeValue(forKey: planeId)
    }
    
    func displayPlane(){
        for (_, value) in self.planeList.sorted(by: { $0.key < $1.key} ){
            print(value.displayData())
        }
    }
}


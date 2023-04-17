//
//  Car.swift
//  Geely
//
//  Created by Abd Qasem on 29/03/2023.
//

import UIKit

struct Car {
    let CarPhoto: UIImage
    let CarName: String
    let CarModel: String
    let CarNumber: String
    let NumberOfNotification: Int
    let KmLeft: Int
    let BatteryRemaining: Int
    let timeLeft: String
    let Services: [Service]
    let Id: Int
    
}

let Cars: [Car] = [

    Car(CarPhoto: UIImage(named: "dummy_car_img")!, CarName: "Geometry A",CarModel: "000", CarNumber: "51-984-74", NumberOfNotification: 1, KmLeft: 25, BatteryRemaining: 9,timeLeft: "11:23",Services: services, Id: 4),
  
    Car(CarPhoto: UIImage(named: "dummy_car_img")!, CarName: "Geometry A",CarModel: "111", CarNumber: "51-984-74", NumberOfNotification: 1, KmLeft: 25, BatteryRemaining: 20,timeLeft: "11:23",Services: services3, Id: 3),
    Car(CarPhoto: UIImage(named: "dummy_car_img")!, CarName: "Geometry D",CarModel: "222", CarNumber: "51-984-74", NumberOfNotification: 6, KmLeft: 11, BatteryRemaining: 50,timeLeft: "11:23",Services: services2, Id: 2),
    Car(CarPhoto: UIImage(named: "dummy_car_img")!, CarName: "Geometry C",CarModel: "333", CarNumber: "51-984-74", NumberOfNotification: 2, KmLeft: 44, BatteryRemaining: 80,timeLeft: "11:23",Services: services, Id: 1),
    Car(CarPhoto: UIImage(named: "dummy_car_img")!, CarName: "Geometry A",CarModel: "444", CarNumber: "51-984-74", NumberOfNotification: 1, KmLeft: 25, BatteryRemaining: 100,timeLeft: "11:23",Services: services3, Id: 0),
 

]
    
let services: [Service] = [
    Service(serviceIcon: UIImage(named: "chargingPointIcon")!, serviceName: "Charging"),
    Service(serviceIcon: UIImage(named: "batteryIcon")!, serviceName: "Battery"),
    Service(serviceIcon: UIImage(named: "orderATreatmentIcon")!, serviceName: "Charging"),
    Service(serviceIcon: UIImage(named: "chargingPointIcon")!, serviceName: "Order"),
    Service(serviceIcon: UIImage(named: "orderATreatmentIcon")!, serviceName: "Order"),
   ]

let services2: [Service] = [
    Service(serviceIcon: UIImage(named: "orderATreatmentIcon")!, serviceName: "Order"),
    Service(serviceIcon: UIImage(named: "batteryIcon")!, serviceName: "Charging"),
    
]
let services3: [Service] = [
    Service(serviceIcon: UIImage(named: "orderATreatmentIcon")!, serviceName: "Order"),
    Service(serviceIcon: UIImage(named: "batteryIcon")!, serviceName: "Battery"),
    Service(serviceIcon: UIImage(named: "chargingPointIcon")!, serviceName: "Charging"),
   
]




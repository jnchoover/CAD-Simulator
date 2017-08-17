//
//  Address.swift
//  CAD Simulator
//
//  Created by Douglas Avery on 8/17/17.
//  Copyright © 2017 Jennifer Carlson. All rights reserved.
//

import UIKit
import os.log

class Address: NSObject, NSCoding {
    
    //MARK: Properties
    
    var street: String
    var apartment: String?
    var city: String
    var state: String
    var zipCode: String
    var gpsCoord: String?
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("addresses")
    
    //MARK: Types
    struct PropertyKey {
        static let street = "street"
        static let apartment = "apartment"
        static let city = "city"
        static let state = "state"
        static let zipCode = "zipCode"
        static let gpsCoord = "gpsCoord"
    }
    
    //MARK Initialization
    init?(street: String, apartment: String?, city: String, state: String, zipCode: String, gpsCoord: String?) {
        
        // the street address must not be empty
        guard !street.isEmpty else {
            return nil
        }
        
        // the city must not be empty
        guard !city.isEmpty else {
            return nil
        }
        
        // the state must not be empty
        guard !state.isEmpty else {
            return nil
        }
        
        // the zipCode must not be empty
        guard !zipCode.isEmpty else {
            return nil
        }
        
        // Initialize stored properties
        self.street = street
        self.apartment = apartment
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.gpsCoord = gpsCoord
        
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(street, forKey: PropertyKey.street)
        aCoder.encode(apartment, forKey: PropertyKey.apartment)
        aCoder.encode(city, forKey: PropertyKey.city)
        aCoder.encode(state, forKey: PropertyKey.state)
        aCoder.encode(zipCode, forKey: PropertyKey.zipCode)
        aCoder.encode(gpsCoord, forKey: PropertyKey.gpsCoord)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        // The street is required. If unable to decode a street string, the initializer should fail
        guard let street = aDecoder.decodeObject(forKey: PropertyKey.street) as? String
            else {
                os_log("Unable to decode the street for an Address object", log: OSLog.default, type: .debug)
                return nil
        }
        
        // Because apartment is an optional property of Address, just use conditional cast.
        let apartment = aDecoder.decodeObject(forKey: PropertyKey.apartment) as? String
        
        // The city is required. If unable to decode a city string, the initializer should fail
        guard let city = aDecoder.decodeObject(forKey: PropertyKey.city) as? String
            else {
                os_log("Unable to decode the city for an Address object", log: OSLog.default, type: .debug)
                return nil
        }
        
        // The state is required. If unable to decode a state string, the initializer should fail
        guard let state = aDecoder.decodeObject(forKey: PropertyKey.state) as? String
            else {
                os_log("Unable to decode the state for an Address object", log: OSLog.default, type: .debug)
                return nil
        }
        
        // The zipCode is required. If unable to decode a zipCode string, the initializer should fail
        guard let zipCode = aDecoder.decodeObject(forKey: PropertyKey.zipCode) as? String
            else {
                os_log("Unable to decode the zipCode for an Address object", log: OSLog.default, type: .debug)
                return nil
        }
        
        // Because gpsCoord is an optional property of Address, just use conditional cast.
        let gpsCoord = aDecoder.decodeObject(forKey: PropertyKey.gpsCoord) as? String
        // Must call designated initializer
        self.init(street: street, apartment: apartment, city: city, state: state, zipCode: zipCode, gpsCoord: gpsCoord)
    }
    
}


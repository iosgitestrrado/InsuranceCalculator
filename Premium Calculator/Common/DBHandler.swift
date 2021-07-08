//
//  DBHandler.swift
//  aiCafe
//
//  Created by Softnotions Technologies Pvt Ltd on 26/08/20.
//  Copyright © 2020 Softnotions Technologies Pvt Ltd. All rights reserved.
//

import Foundation
import SwiftyJSON
import SQLite

class DBHandler {
    
    static let shared = DBHandler()
    
    private init() {}
    
    var fileURL:URL? = nil
    
    
    //MARK: - Creation
    
    func createVehicleClass() {
        /*
         {
         "id": 1,
         "class_name": "Private Vehicle",
         "status": 1
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            print(fileURL)
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("VehicleClass")
            
            let classid = Expression<Int?>("VehicleClassId")
            let classname = Expression<String?>("VehicleClassName")
            let status = Expression<Int?>("Status")
            
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(classid, unique: true)
                t.column(classname)
                t.column(status)
                
                
            })
            
        } catch {
            print("Error in creating VehicleClass: ",error)
        }
        
    }
    func createVehicleCategory() {
        /*
         {
         "id": 2,
         "category_name": "Station Wagon",
         "class_id": 1,
         "status": 1
         }
         */
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            print(fileURL)
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("VehicleCategory")
            let catid = Expression<Int?>("VehicleCatId")
            let catname = Expression<String?>("VehicleCatName")
            let classid = Expression<Int?>("VehicleClassId")
            let status = Expression<Int?>("Status")
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(catid, unique: true)
                t.column(catname)
                t.column(classid)
                t.column(status)
            })
            
        } catch {
            print("Error in creating VehicleClass: ",error)
        }
        
    }
    func createVehicleTypes() {
        /*
         {
         "id": 4,
         "type_name": "Aluminium Tanker",
         "category_id": 12,
         "status": 1
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            print(fileURL)
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("VehicleTypes")
            let typeid = Expression<Int?>("VehicleTypeId")
            let typename = Expression<String?>("VehicleTypeName")
            let classid = Expression<Int?>("VehicleCatId")
            let status = Expression<Int?>("Status")
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(typeid, unique: true)
                t.column(typename)
                t.column(classid)
                t.column(status)
            })
            
        } catch {
            print("Error in creating VehicleTypes: ",error)
        }
        
    }
    
    func createWeightRange() {
        /*
         {
         "id": 1,
         "range_name": "Up to 2 tonnes",
         "status": 1
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("WeightRange")
            let rangeid = Expression<Int?>("RangeId")
            let rangename = Expression<String?>("RangeName")
            let status = Expression<Int?>("Status")
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(rangeid, unique: true)
                t.column(rangename)
                t.column(status)
            })
            
        } catch {
            print("Error in creating WeightRange: ",error)
        }
        
    }
    
    func createPremiumCoverType() {
        /*
         {
         "id": 1,
         "cover_name": "Comprehensive",
         "status": 1
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            print(fileURL)
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("PremiumCoverType")
            let coverid = Expression<Int?>("PremiumCoverTypeID")
            let covername = Expression<String?>("VehicleCoverName")
            
            let status = Expression<Int?>("Status")
            
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(coverid, unique: true)
                t.column(covername)
                t.column(status)
                
                
            })
            
        } catch {
            print("Error in creating VehicleClass: ",error)
        }
        
    }
    func createAddons() {
        /*
         {
         "id": 1,
         "addon_name": "Excess Buy Back",
         "description": "10% loading on the OD premium.",
         "addon_value": "10",
         "value_type": "1",
         "addon_value_text": "10 %"
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            print(fileURL)
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("Addons")
            let addonID = Expression<Int?>("AddonID")
            let addonName = Expression<String?>("AddonName")
            let addonDesc = Expression<String?>("AddonDesc")
            let addonValue = Expression<String?>("AddonValue")
            let addonType = Expression<String?>("AddonType")
            let addonValueText = Expression<String?>("AddonValueText")
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(addonID, unique: true)
                t.column(addonName)
                t.column(addonDesc)
                t.column(addonValue)
                t.column(addonType)
                t.column(addonValueText)
                
            })
            
        } catch {
            print("Error in creating VehicleClass: ",error)
        }
        
    }
    func createPremiumRates() {
        /*
         {
         {
         "id": 1,
         "vehicle_class": 1,
         "premium_type": 1,
         "vehicle_category": 0,
         "vehicle_type": 0,
         "claim_free_rate": "3.50",
         "claim_free_rate_percent": 1,
         "claim_on_rate": "4.00",
         "claim_on_rate_percent": 1,
         "extra_claim_rate": "0.00",
         "extra_claim_rate_percent": 0,
         "minimum_rate": "250000.00",
         "minimum_rate_percent": 0,
         "pasger_carry_extra": "0.00",
         "pasger_carry_extra_percent": 0,
         "weight_range": 0,
         "above_year_range": 0,
         "per_seat_extra": "0.00",
         "per_seat_extra_percent": 0,
         "status": 1
         }
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            print(fileURL)
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("PremiumRates")
            let premiumID = Expression<Int>("premiumID")
            let vehicleClass = Expression<Int>("vehicleClass")
            let premiumType = Expression<Int>("premium_type")
            let vehicleCategory = Expression<Int>("vehicleCategory")
            let vehicleType = Expression<Int>("vehicleType")
            let claimFreeRate = Expression<String>("claimFreeRate")
            let claimFreeRatePercent = Expression<Int>("claimFreeRatePercent")
            let claimOnRate = Expression<String>("claimOnRate")
            let claimOnRatePercent = Expression<Int>("claimOnRatePercent")
            let extraClaimRate = Expression<String>("extraClaimRate")
            let extraClaimRatePercent = Expression<Int>("extraClaimRatePercent")
            let minimumRate = Expression<String>("minimumRate")
            let minimumRatePercent = Expression<Int>("minimumRatePercent")
            let pasgerCarryExtra = Expression<String>("pasgerCarryExtra")
            let pasgerCarryExtraPercent = Expression<Int>("pasgerCarryExtraPercent")
            let weightRange = Expression<Int>("weightRange")
            let aboveYearRange = Expression<String>("aboveYearRange")
            let perSeatExtra = Expression<String>("perSeatExtra")
            let perSeatExtraPercent = Expression<Int>("perSeatExtraPercent")
            let status = Expression<Int>("status")
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(premiumID, unique: true)
                t.column(vehicleClass)
                t.column(premiumType)
                
                t.column(vehicleCategory)
                t.column(vehicleType)
                t.column(claimFreeRate)
                t.column(claimFreeRatePercent)
                t.column(claimOnRate)
                t.column(claimOnRatePercent)
                t.column(extraClaimRate)
                t.column(extraClaimRatePercent)
                t.column(minimumRate)
                t.column(minimumRatePercent)
                t.column(pasgerCarryExtra)
                t.column(pasgerCarryExtraPercent)
                t.column(weightRange)
                t.column(aboveYearRange)
                t.column(perSeatExtra)
                t.column(perSeatExtraPercent)
                t.column(status)
                
                
            })
            
        } catch {
            print("Error in creating VehicleClass: ",error)
        }
        
    }
    
    func createExtraFields() {
        /*
         {
         "id": 10,
         "field": "passenger_carrying",
         "field_type": "radio",
         "label": "Passenger Carrying",
         "vehicle_class": 2,
         "vehicle_category": 0,
         "premium_type": 0
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            print(fileURL?.absoluteString)
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("ExtraFields")
            let fieldsID = Expression<Int>("fieldsID")
            let field = Expression<String>("field")
            let field_type = Expression<String>("field_type")
            let label = Expression<String>("label")
            let vehicle_class = Expression<Int>("vehicle_class")
            let vehicle_category = Expression<Int>("vehicle_category")
            let premium_type = Expression<Int>("premium_type")
            
            try db.run(user.create(ifNotExists: true) { t in
                t.column(fieldsID, unique: true)
                t.column(field)
                t.column(field_type)
                t.column(label)
                t.column(vehicle_class)
                t.column(vehicle_category)
                t.column(premium_type)
                
            })
            
        } catch {
            print("Error in creating VehicleClass: ",error)
        }
        
    }
    
    
    //MARK: - Insertion
    
    
    func insertVehicleClass(array: [VehicleClassTable]) {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let vehicleclass = Table("VehicleClass")
            
            let classid = Expression<Int?>("VehicleClassId")
            let classname = Expression<String?>("VehicleClassName")
            let status = Expression<Int?>("Status")
            
            
            if try db.run(vehicleclass.delete()) > 0 {
                print("deleted old list of vehicleclass")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(vehicleclass.insert(or: .replace,
                                               classid <- dat.id,
                                               classname <- dat.className!,
                                               status <- dat.status!
                ))
            }
        } catch {
            print("Error in insertion (wallet): ",error)
        }
        
    }
    func insertVehicleType(array: [VehicleTypesTable]) {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let vehicletypes = Table("VehicleTypes")
            let typeid = Expression<Int?>("VehicleTypeId")
            let typename = Expression<String?>("VehicleTypeName")
            let catid = Expression<Int?>("VehicleCatId")
            let status = Expression<Int?>("Status")
            
            
            if try db.run(vehicletypes.delete()) > 0 {
                print("deleted old list of vehicletypes")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(vehicletypes.insert(or: .replace,
                                               typeid <- dat.id,
                                               typename <- dat.typeName!,
                                               catid <- dat.categoryId!,
                                               status <- dat.status!
                ))
            }
        } catch {
            print("Error in insertion (VehicleTypes): ",error)
        }
        
    }
    func insertVehicleCat(array: [VehicleCategoryTable]) {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let vehicleCategory = Table("VehicleCategory")
            let catid = Expression<Int?>("VehicleCatId")
            let catname = Expression<String?>("VehicleCatName")
            let classid = Expression<Int?>("VehicleClassId")
            let status = Expression<Int?>("Status")
            
            
            if try db.run(vehicleCategory.delete()) > 0 {
                print("deleted old list of VehicleCategory")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(vehicleCategory.insert(or: .replace,
                                                  catid <- dat.id,
                                                  catname <- dat.categoryName!,
                                                  classid <- dat.classId!,
                                                  status <- dat.status!
                ))
            }
        } catch {
            print("Error in insertion (VehicleCategory): ",error)
        }
        
    }
    func insertVehicleWeightRange(array: [WeightRangeTable]) {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let weightRange = Table("WeightRange")
            let rangeid = Expression<Int?>("RangeId")
            let rangename = Expression<String?>("RangeName")
            let status = Expression<Int?>("Status")
            
            
            if try db.run(weightRange.delete()) > 0 {
                print("deleted old list of VehicleCategory")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(weightRange.insert(or: .replace,
                                              rangeid <- dat.id,
                                              rangename <- dat.rangeName!,
                                              status <- dat.status!
                ))
            }
        } catch {
            print("Error in insertion (WeightRange): ",error)
        }
        
    }
    
    func insertPremiumCoverType(array: [PremiumCoverTypeTable]) {
        /*
         {
         "id": 1,
         "cover_name": "Comprehensive",
         "status": 1
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
    
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("PremiumCoverType")
            let coverid = Expression<Int?>("PremiumCoverTypeID")
            let covername = Expression<String?>("VehicleCoverName")
            let status = Expression<Int?>("Status")
            
            if try db.run(user.delete()) > 0 {
                print("deleted old list of VehicleCategory")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(user.insert(or: .replace,
                                       coverid <- dat.id!,
                                       covername <- dat.coverName!,
                                       status <- dat.status!
                ))
            }
        } catch {
            print("Error in insertion (WeightRange): ",error)
        }
        
    }
    
    func insertAddons(array: [AddonsTable]) {
        /*
         
         {
         "id": 1,
         "addon_name": "Excess Buy Back",
         "description": "10% loading on the OD premium.",
         "addon_value": "10",
         "value_type": "1",
         "addon_value_text": "10 %"
         }
         
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let user = Table("Addons")
            let addonID = Expression<Int?>("AddonID")
            let addonName = Expression<String?>("AddonName")
            let addonDesc = Expression<String?>("AddonDesc")
            let addonValue = Expression<String?>("AddonValue")
            let addonType = Expression<String?>("AddonType")
            let addonValueText = Expression<String?>("AddonValueText")
            
            
            if try db.run(user.delete()) > 0 {
                print("deleted old list of VehicleCategory")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(user.insert(or: .replace,
                                       addonID <- dat.id!,
                                       addonName <- dat.addonName!,
                                       addonDesc <- dat.description!,
                                       addonValue <- dat.addonValue!,
                                       addonType <- dat.valueType!,
                                       addonValueText <- dat.addonValueText!
                ))
            }
        } catch {
            print("Error in insertion (WeightRange): ",error)
        }
        
    }
    
    func insertPremiumRates(array: [PremiumRates]) {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            let user = Table("PremiumRates")
            
         
            let premiumID = Expression<Int>("premiumID")
            let vehicleClass = Expression<Int>("vehicleClass")
            let premiumType = Expression<Int>("premium_type")
            let vehicleCategory = Expression<Int>("vehicleCategory")
            let vehicleType = Expression<Int>("vehicleType")
            let claimFreeRate = Expression<String>("claimFreeRate")
            let claimFreeRatePercent = Expression<Int>("claimFreeRatePercent")
            let claimOnRate = Expression<String>("claimOnRate")
            let claimOnRatePercent = Expression<Int>("claimOnRatePercent")
            let extraClaimRate = Expression<String>("extraClaimRate")
            let extraClaimRatePercent = Expression<Int>("extraClaimRatePercent")
            let minimumRate = Expression<String>("minimumRate")
            let minimumRatePercent = Expression<Int>("minimumRatePercent")
            let pasgerCarryExtra = Expression<String>("pasgerCarryExtra")
            let pasgerCarryExtraPercent = Expression<Int>("pasgerCarryExtraPercent")
            let weightRange = Expression<Int>("weightRange")
            let aboveYearRange = Expression<Int>("aboveYearRange")
            let perSeatExtra = Expression<String>("perSeatExtra")
            let perSeatExtraPercent = Expression<Int>("perSeatExtraPercent")
            let status = Expression<Int>("status")
            
            if try db.run(user.delete()) > 0 {
                print("deleted old list of PremiumRates")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(user.insert(or: .replace,
                                       premiumID <- dat.id!,
                                       vehicleClass <- dat.vehicleClass!,
                                       premiumType <- dat.premiumType!,
                                       
                                       vehicleCategory <- dat.vehicleCategory!,
                                       vehicleType <- dat.vehicleType!,
                                       claimFreeRate <- dat.claimFreeRate!,
                                       claimFreeRatePercent <- dat.claimFreeRatePercent!,
                                       claimOnRate <- dat.claimOnRate!,
                                       claimOnRatePercent <- dat.claimOnRatePercent!,
                                       extraClaimRate <- dat.extraClaimRate!,
                                       extraClaimRatePercent <- dat.extraClaimRatePercent!,
                                       minimumRate <- dat.minimumRate!,
                                       minimumRatePercent <- dat.minimumRatePercent!,
                                       pasgerCarryExtra <- dat.pasgerCarryExtra!,
                                       pasgerCarryExtraPercent <- dat.pasgerCarryExtraPercent!,
                                       weightRange <- dat.weightRange!,
                                       aboveYearRange <- dat.aboveYearRange!,
                                       perSeatExtra <- dat.perSeatExtra!,
                                       perSeatExtraPercent <- dat.perSeatExtraPercent!,
                                       status <- dat.status!
                    
                ))
            }
        } catch {
            print("Error in insertion (WeightRange): ",error)
        }
        
    }
    
    func insertExtraFields(array: [ExtraFieldsTable]) {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            let extraFields = Table("ExtraFields")
            let fieldsID = Expression<Int>("fieldsID")
            let field = Expression<String>("field")
            let field_type = Expression<String>("field_type")
            let label = Expression<String>("label")
            let vehicle_class = Expression<Int>("vehicle_class")
            let vehicle_category = Expression<Int>("vehicle_category")
            let premium_type = Expression<Int>("premium_type")
            
            
            if try db.run(extraFields.delete()) > 0 {
                print("deleted old list of ExtraFields")
            } else {
                print("not found")
            }
            
            for dat in array {
                try db.run(extraFields.insert(or: .replace,
                                              fieldsID <- dat.id!,
                                              field <- dat.field!,
                                              field_type <- dat.fieldType!,
                                              label <- dat.label!,
                                              vehicle_class <- dat.vehicleClass!,
                                              vehicle_category <- dat.vehicleCategory!,
                                              premium_type <- dat.premiumType!
                    
                ))
            }
        } catch {
            print("Error in insertion (WeightRange): ",error)
        }
        
    }
    
    
    //MARK: - Retrieval
    
    
    func fetchVehicleClass() -> [VehicleClass] {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            for row in try db.prepare("SELECT * FROM VehicleClass") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["class_name"] = row[1]
                tempD["status"] = row[2]
                
                
                tempDarr.append(tempD)
            }
        } catch {
            print("Error in fetch: ",error)
        }
        //print("vehicleClassList From DB ::: ",tempDarr)
        
        var vehicleClass = [VehicleClass]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            vehicleClass = try JSON(data: jsonData).arrayValue.map { VehicleClass($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return vehicleClass
        
    }
    
    
    func fetchVehicleClassTab() -> [VehicleClassTable] {
           
           fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
               .appendingPathComponent("PremiumCalculator.sqlite")
           
           var tempDarr = [Dictionary<String,Any>]()
           
           do {
               let db = try Connection(fileURL!.absoluteString)
               
               for row in try db.prepare("SELECT * FROM VehicleClass") {
                   var tempD = Dictionary<String,Any>()
                   tempD["id"] = row[0]
                   tempD["class_name"] = row[1]
                   tempD["status"] = row[2]
                   
                   
                   tempDarr.append(tempD)
               }
           } catch {
               print("Error in fetch: ",error)
           }
           //print("vehicleClassList From DB ::: ",tempDarr)
           
           var vehicleClass = [VehicleClassTable]()
           do {
               
               let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
               
               vehicleClass = try JSON(data: jsonData).arrayValue.map { VehicleClassTable($0) }
           } catch {
               print("Error in serialization: ",error.localizedDescription)
           }
           return vehicleClass
           
       }
       
    
    func fetchVehicleType(vehicleCatId:String) -> [VehicleTypesTable] {
        
        var query:String = "SELECT * FROM VehicleTypes WHERE VehicleCatId =\"" + vehicleCatId + "\""
        print("query ",query)
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            for row in try db.prepare(query) {
                //for row in try db.prepare("SELECT * FROM VehicleTypes") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["type_name"] = row[1]
                tempD["category_id"] = row[2]
                tempD["status"] = row[3]
                tempDarr.append(tempD)
            }
        } catch {
            print("Error in fetch: ",error)
        }
        //print("WalletHistory From DB ::: ",tempDarr)
        
        var vehicleType = [VehicleTypesTable]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            vehicleType = try JSON(data: jsonData).arrayValue.map { VehicleTypesTable($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return vehicleType
        
    }
    
    
    func fetchVehicleCat(vehicleClassId:String) -> [VehicleCategoryTable] {
        var query:String = "SELECT * FROM VehicleCategory WHERE VehicleClassId =\"" + vehicleClassId + "\""
        print("query ",query)
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            // for row in try db.prepare("SELECT * FROM VehicleCategory") {
            for row in try db.prepare(query) {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["category_name"] = row[1]
                tempD["class_id"] = row[2]
                tempD["status"] = row[3]
                
                tempDarr.append(tempD)
            }
        } catch {
            print("Error in fetch: ",error)
        }
       // print("VehicleCategory From DB ::: ",tempDarr)
        
        var vehicleCategories = [VehicleCategoryTable]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            vehicleCategories = try JSON(data: jsonData).arrayValue.map { VehicleCategoryTable($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return vehicleCategories
        
    }
    
    
    func fetchVehicleWeight() -> [WeightRanges] {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            for row in try db.prepare("SELECT * FROM WeightRange") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["range_name"] = row[1]
                tempD["status"] = row[2]
                tempDarr.append(tempD)
                
            }
        } catch {
            print("Error in fetch: ",error)
        }
        //print("VehicleCategory From DB ::: ",tempDarr)
        
        var weightRanges = [WeightRanges]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            weightRanges = try JSON(data: jsonData).arrayValue.map { WeightRanges($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return weightRanges
        
    }
    func fetchVehicleWeightRange() -> [WeightRangeTable] {
        
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            for row in try db.prepare("SELECT * FROM WeightRange") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["range_name"] = row[1]
                tempD["status"] = row[2]
                tempDarr.append(tempD)
                
            }
        } catch {
            print("Error in fetch: ",error)
        }
        //print("VehicleCategory From DB ::: ",tempDarr)
        
        var weightRanges = [WeightRangeTable]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            weightRanges = try JSON(data: jsonData).arrayValue.map { WeightRangeTable($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return weightRanges
        
    }
    
    func fetchPremiumCoverType() -> [PremiumCoverTypeTable] {
          /*
         {
                        "id": 1,
                        "cover_name": "Comprehensive",
                        "status": 1
                    },
         */
          fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
              .appendingPathComponent("PremiumCalculator.sqlite")
          
          var tempDarr = [Dictionary<String,Any>]()
          
          do {
              let db = try Connection(fileURL!.absoluteString)
              
              for row in try db.prepare("SELECT * FROM PremiumCoverType") {
                  var tempD = Dictionary<String,Any>()
                  tempD["id"] = row[0]
                  tempD["cover_name"] = row[1]
                  tempD["status"] = row[2]
                  
                  
                  tempDarr.append(tempD)
              }
          } catch {
              print("Error in fetch: ",error)
          }
          //print("vehicleClassList From DB ::: ",tempDarr)
          
          var premiumCoverTypeTable = [PremiumCoverTypeTable]()
          do {
              
              let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
              
              premiumCoverTypeTable = try JSON(data: jsonData).arrayValue.map { PremiumCoverTypeTable($0) }
          } catch {
              print("Error in serialization: ",error.localizedDescription)
          }
          return premiumCoverTypeTable
          
      }
    func fetchAddons() -> [AddonsTable] {
       /*
 {
            "id": 1,
            "addon_name": "Excess Buy Back",
            "description": "10% loading on the OD premium.",
            "addon_value": "10",
            "value_type": "1",
            "addon_value_text": "10 %"
        }
 */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            for row in try db.prepare("SELECT * FROM Addons") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["addon_name"] = row[1]
                tempD["description"] = row[2]
                tempD["addon_value"] = row[3]
                tempD["value_type"] = row[4]
                tempD["addon_value_text"] = row[5]
                
                tempDarr.append(tempD)
            }
        } catch {
            print("Error in fetch: ",error)
        }
        //print("vehicleClassList From DB ::: ",tempDarr)
        
        var addonsTable = [AddonsTable]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            addonsTable = try JSON(data: jsonData).arrayValue.map { AddonsTable($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return addonsTable
        
    }
    
    func fetchPremiumRates() -> [PremiumRates] {
          /*
    {
        "id": 1,
        "vehicle_class": 1,
        "premium_type": 1,
        "vehicle_category": 0,
        "vehicle_type": 0,
        "claim_free_rate": "3.50",
        "claim_free_rate_percent": 1,
        "claim_on_rate": "4.00",
        "claim_on_rate_percent": 1,
        "extra_claim_rate": "0.00",
        "extra_claim_rate_percent": 0,
        "minimum_rate": "250000.00",
        "minimum_rate_percent": 0,
        "pasger_carry_extra": "0.00",
        "pasger_carry_extra_percent": 0,
        "weight_range": 0,
        "above_year_range": 0,
        "per_seat_extra": "0.00",
        "per_seat_extra_percent": 0,
        "status": 1
    }
    */
           fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
               .appendingPathComponent("PremiumCalculator.sqlite")
           
           var tempDarr = [Dictionary<String,Any>]()
           
           do {
               let db = try Connection(fileURL!.absoluteString)
               
            for row in try db.prepare("SELECT * FROM PremiumRates") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["vehicle_class"] = row[1]
                tempD["premium_type"] = row[2]
                tempD["vehicle_category"] = row[3]
                tempD["vehicle_type"] = row[4]
                
                tempD["claim_free_rate"] = row[5]
                tempD["claim_free_rate_percent"] = row[6]
                tempD["claim_on_rate"] = row[7]
                tempD["claim_on_rate_percent"] = row[8]
                tempD["extra_claim_rate"] = row[9]
                
                tempD["extra_claim_rate_percent"] = row[10]
                tempD["minimum_rate"] = row[11]
                tempD["minimum_rate_percent"] = row[12]
                tempD["pasger_carry_extra"] = row[13]
                tempD["pasger_carry_extra_percent"] = row[14]
                
                tempD["weight_range"] = row[15]
                tempD["above_year_range"] = row[16]
                tempD["per_seat_extra"] = row[17]
                tempD["per_seat_extra_percent"] = row[18]
                tempD["status"] = row[19]
                
                tempDarr.append(tempD)
            }
           } catch {
               print("Error in fetch: ",error)
           }
           //print("PremiumRates From DB ::: ",tempDarr)
           
           var premiumRates = [PremiumRates]()
           do {
               
               let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
               
               premiumRates = try JSON(data: jsonData).arrayValue.map { PremiumRates($0) }
           } catch {
               print("Error in serialization: ",error.localizedDescription)
           }
           return premiumRates
           
       }
    
    func fetchExtraFields() -> [ExtraFieldsTable] {
        /*
         {
             "id": 9,
             "field": "vehicle_type",
             "field_type": "dropdown",
             "label": "Type",
             "vehicle_class": 3,
             "vehicle_category": 10,
             "premium_type": 0
         }
         */
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            
            for row in try db.prepare("SELECT * FROM ExtraFields") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["field"] = row[1]
                tempD["field_type"] = row[2]
                tempD["label"] = row[3]
                tempD["vehicle_class"] = row[4]
                tempD["vehicle_category"] = row[5]
                tempD["premium_type"] = row[6]
                
                tempDarr.append(tempD)
            }
        } catch {
            print("Error in fetch: ",error)
        }
        //print("vehicleClassList From DB ::: ",tempDarr)
        
        var extraFieldsTable = [ExtraFieldsTable]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            extraFieldsTable = try JSON(data: jsonData).arrayValue.map { ExtraFieldsTable($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return extraFieldsTable
        
    }
    func fetchPremiumRates(vehicleQuery:String) ->  [PremiumRates] {
        var query:String = vehicleQuery
        print("query ",query)
        fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PremiumCalculator.sqlite")
        
        var tempDarr = [Dictionary<String,Any>]()
        
        do {
            let db = try Connection(fileURL!.absoluteString)
            for row in try db.prepare(query) {
                //for row in try db.prepare("SELECT * FROM VehicleTypes") {
                var tempD = Dictionary<String,Any>()
                tempD["id"] = row[0]
                tempD["vehicle_class"] = row[1]
                tempD["premium_type"] = row[2]
                tempD["vehicle_category"] = row[3]
                tempD["vehicle_type"] = row[4]
                
                tempD["claim_free_rate"] = row[5]
                tempD["claim_free_rate_percent"] = row[6]
                tempD["claim_on_rate"] = row[7]
                tempD["claim_on_rate_percent"] = row[8]
                tempD["extra_claim_rate"] = row[9]
                
                tempD["extra_claim_rate_percent"] = row[10]
                tempD["minimum_rate"] = row[11]
                tempD["minimum_rate_percent"] = row[12]
                tempD["pasger_carry_extra"] = row[13]
                tempD["pasger_carry_extra_percent"] = row[14]
                
                tempD["weight_range"] = row[15]
                tempD["above_year_range"] = row[16]
                tempD["per_seat_extra"] = row[17]
                tempD["per_seat_extra_percent"] = row[18]
                tempD["status"] = row[19]
                
                tempDarr.append(tempD)
            }
        } catch {
            print("Error in fetch: ",error)
        }
        //print("WalletHistory From DB ::: ",tempDarr)
        
        var premiumRates = [PremiumRates]()
        do {
            
            let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            premiumRates = try JSON(data: jsonData).arrayValue.map { PremiumRates($0) }
        } catch {
            print("Error in serialization: ",error.localizedDescription)
        }
        return premiumRates
    }
    /*
     
     
     
     
     
     
     //MARK: - Insertion
     
     func insertUserInfo(customerKey: String, email: String, name: String, mobile: String, token: String, accessToken: String, cityKey: String, areaKey: String, companyCode: String, accountBalance: String, cbBalance: String) {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let user = Table("UserDetails")
     
     let cusKey = Expression<String?>("CustomerKey")
     let mail = Expression<String?>("Email")
     let nam = Expression<String?>("Name")
     let mobil = Expression<String?>("Mobile")
     let toke = Expression<String?>("Token")
     let accessToke = Expression<String?>("AccessToken")
     let cKey = Expression<String?>("CityKey")
     let aKey = Expression<String?>("AreaKey")
     let compCode = Expression<String?>("CompanyCode")
     let accBalance = Expression<String?>("AccountBalance")
     let cashbackBalance = Expression<String?>("CashbackBalance")
     
     /*
     if try db.run(user.delete()) > 0 {
     print("deleted old list of users")
     } else {
     print("not found")
     }
     */
     
     try db.run(user.insert(or: .replace,
     cusKey <- customerKey,
     mail <- email,
     nam <- name,
     mobil <- mobile,
     toke <- token,
     accessToke <- accessToken,
     cKey <- cityKey,
     aKey <- areaKey,
     compCode <- companyCode,
     accBalance <- accountBalance,
     cashbackBalance <- cbBalance))
     
     } catch {
     print("Error in insertion (user): ",error)
     }
     
     }
     
     func insertWalletHistory(array: [WalHistoryData]) {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let wallet = Table("WalletHistory")
     
     let transId = Expression<String?>("TxnId")
     let transType = Expression<String?>("TxnType")
     let transStatus = Expression<String?>("TxnStatus")
     let transDate = Expression<String?>("TxnDate")
     let transComments = Expression<String?>("TxnComments")
     let transAmount = Expression<String?>("TxnAmount")
     let custKey = Expression<String?>("CustKey")
     let payType = Expression<String?>("PaymentType")
     
     if try db.run(wallet.delete()) > 0 {
     print("deleted old list of wallet")
     } else {
     print("not found")
     }
     
     for dat in array {
     try db.run(wallet.insert(or: .replace,
     transId <- dat.txid!,
     transType <- dat.type!,
     transStatus <- dat.status!,
     transDate <- dat.date!,
     transComments <- dat.comments!,
     transAmount <- dat.amt!,
     custKey <- dat.ckey,
     payType <- dat.paymentType!))
     }
     } catch {
     print("Error in insertion (wallet): ",error)
     }
     
     }
     
     func insertAvailableCashbackInfo(array: [CashbackList]) {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let availableCashback = Table("AvailableCashbackDetails")
     
     let amt = Expression<String?>("Amount")
     let logo = Expression<String?>("ShopLogo")
     let name = Expression<String?>("ShopName")
     let key = Expression<String?>("ShopKey")
     
     if try db.run(availableCashback.delete()) > 0 {
     print("deleted old list of availableCashback")
     } else {
     print("not found")
     }
     
     for dat in array {
     try db.run(availableCashback.insert(or: .replace,
     amt <- dat.amount!,
     logo <- dat.shopLogo!,
     name <- dat.shopname!,
     key <- dat.shopKey!))
     }
     } catch {
     print("Error in insertion (availableCashback): ",error)
     }
     
     }
     
     func insertCashbackHistory(array: [HistoryList]) {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let cashbackHistory = Table("CashbackHistory")
     
     let amt = Expression<String?>("Amount")
     let date = Expression<String?>("Date")
     let ordKey = Expression<String?>("OrderKey")
     let transType = Expression<String?>("TxnType")
     
     if try db.run(cashbackHistory.delete()) > 0 {
     print("deleted old list of cashbackHistory")
     } else {
     print("not found")
     }
     
     for dat in array {
     try db.run(cashbackHistory.insert(or: .replace,
     amt <- dat.amount!,
     date <- dat.date!,
     ordKey <- dat.orderKey!,
     transType <- dat.type!))
     }
     } catch {
     print("Error in insertion (cashbackHistory): ",error)
     }
     
     }
     
     func insertNotifications(array: [NotificationList]) {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let notifications = Table("Notifications")
     
     let notifId = Expression<String?>("Id")
     let custKey = Expression<String?>("CustomerKey")
     let delStatus = Expression<String?>("DeliveryStatus")
     let heading = Expression<String?>("Heading")
     let subHeading = Expression<String?>("SubHeading")
     let time = Expression<String?>("Time")
     let orderKey = Expression<String?>("OrderKey")
     let orderRefNo = Expression<String?>("OrderRefNo")
     let shpKey = Expression<String?>("ShopKey")
     let shpName = Expression<String?>("ShopName")
     
     if try db.run(notifications.delete()) > 0 {
     print("deleted old list of notifications")
     } else {
     print("not found")
     }
     
     for dat in array {
     try db.run(notifications.insert(or: .replace,
     notifId <- dat.id!,
     custKey <- dat.customerKey!,
     delStatus <- dat.deliveryStatus!,
     heading <- dat.heading!,
     subHeading <- dat.subHeading!,
     time <- dat.notificationDatetime!,
     orderKey <- dat.orderKey!,
     orderRefNo <- dat.orderRefNumber!,
     shpKey <- dat.shopKey!,
     shpName <- dat.shopName!))
     }
     } catch {
     print("Error in insertion (notifications): ",error)
     }
     
     }
     
     func insertOrders(array: [OrdersData]) {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let order = Table("OrderHistory")
     
     let shpName = Expression<String?>("ShopName")
     let shpKey = Expression<String?>("ShopKey")
     let shpLogo = Expression<String?>("ShopLogo")
     let ordKey = Expression<String?>("OrderKey")
     let ordTime = Expression<String?>("OrderTime")
     let ordTotal = Expression<Double?>("OrderTotal")
     let paystatus = Expression<String?>("PaymentStatus")
     let orderRef = Expression<String?>("OrderRefNo")
     let delStatus = Expression<String?>("DeliveryStatus")
     let products = Expression<Int?>("Products")
     
     /*
     if try db.run(order.delete()) > 0 {
     print("deleted old list of notifications")
     } else {
     print("not found")
     }
     */
     for dat in array {
     try db.run(order.insert(or: .replace,
     shpName <- dat.shopName!,
     shpKey <- dat.shopKey!,
     shpLogo <- dat.shopLogo!,
     ordKey <- dat.orderKey!,
     ordTime <- dat.orderDatetime!,
     ordTotal <- dat.orderTotal!,
     paystatus <- dat.paymentStatus!,
     orderRef <- dat.orderRefNumber!,
     delStatus <- dat.deliveryStatus!,
     products <- dat.products!))
     }
     } catch {
     print("Error in insertion (notifications): ",error)
     }
     
     }
     
     
     
     //MARK: - Updation
     func updateAccountBalance(balance: String) {
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let user = Table("UserDetails")
     
     let accountBalance = Expression<String?>("AccountBalance")
     
     try db.run(user.update(accountBalance <- balance))
     
     } catch {
     print("Error in updation (user): ",error)
     }
     }
     func updateCashbackBalance(balance: String) {
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let user = Table("UserDetails")
     
     let cashbackBalance = Expression<String?>("CashbackBalance")
     
     try db.run(user.update(cashbackBalance <- balance))
     
     } catch {
     print("Error in updation (user): ",error)
     }
     }
     func updateAreaKey(areaKey: String) {
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let user = Table("UserDetails")
     
     let aKey = Expression<String?>("AreaKey")
     
     try db.run(user.update(aKey <- areaKey))
     
     } catch {
     print("Error in updation (user): ",error)
     }
     }
     func updateCityKey(cityKey: String) {
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let user = Table("UserDetails")
     
     let cKey = Expression<String?>("CityKey")
     
     try db.run(user.update(cKey <- cityKey))
     
     } catch {
     print("Error in updation (user): ",error)
     }
     }
     
     //MARK: - Retrieval
     
     func fetchWalletHistory() -> [WalHistoryData] {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     
     var tempDarr = [Dictionary<String,Any>]()
     
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     for row in try db.prepare("SELECT CustKey, TxnId, TxnAmount, TxnStatus, TxnDate, TxnComments, TxnType, PaymentType FROM WalletHistory") {
     var tempD = Dictionary<String,Any>()
     tempD["ckey"] = row[0]
     tempD["txid"] = row[1]
     tempD["amt"] = row[2]
     tempD["status"] = row[3]
     tempD["date"] = row[4]
     tempD["comments"] = row[5]
     tempD["type"] = row[6]
     tempD["payment_type"] = row[7]
     
     tempDarr.append(tempD)
     }
     } catch {
     print("Error in fetch: ",error)
     }
     print("WalletHistory From DB ::: ",tempDarr)
     
     var walletHistoryData = [WalHistoryData]()
     do {
     
     let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
     
     walletHistoryData = try JSON(data: jsonData).arrayValue.map { WalHistoryData($0) }
     } catch {
     print("Error in serialization: ",error.localizedDescription)
     }
     return walletHistoryData
     
     }
     
     func fetchAvailableCashback() -> [CashbackList] {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     
     var tempDarr = [Dictionary<String,Any>]()
     
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     for row in try db.prepare("SELECT Amount, ShopLogo, ShopName, ShopKey FROM AvailableCashbackDetails") {
     var tempD = Dictionary<String,Any>()
     tempD["amount"] = row[0]
     tempD["shop_logo"] = row[1]
     tempD["shopname"] = row[2]
     tempD["shop_key"] = row[3]
     
     tempDarr.append(tempD)
     }
     } catch {
     print("Error in fetch: ",error)
     }
     print("cashbackData From DB ::: ",tempDarr)
     
     var cashbackData = [CashbackList]()
     do {
     
     let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
     
     cashbackData = try JSON(data: jsonData).arrayValue.map { CashbackList($0) }
     } catch {
     print("Error in serialization: ",error.localizedDescription)
     }
     return cashbackData
     
     }
     
     func fetchCashbackHistory() -> [HistoryList] {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     
     var tempDarr = [Dictionary<String,Any>]()
     
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     for row in try db.prepare("SELECT Amount, Date, OrderKey, TxnType FROM AvailableCashbackDetails") {
     var tempD = Dictionary<String,Any>()
     tempD["amount"] = row[0]
     tempD["date"] = row[1]
     tempD["order_key"] = row[2]
     tempD["type"] = row[3]
     
     tempDarr.append(tempD)
     }
     } catch {
     print("Error in fetch: ",error)
     }
     print("cashbackHistoryData From DB ::: ",tempDarr)
     
     var cashbackHistoryData = [HistoryList]()
     do {
     
     let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
     
     cashbackHistoryData = try JSON(data: jsonData).arrayValue.map { HistoryList($0) }
     } catch {
     print("Error in serialization: ",error.localizedDescription)
     }
     return cashbackHistoryData
     
     }
     
     func fetchNotifications() -> [NotificationList] {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     
     var tempDarr = [Dictionary<String,Any>]()
     
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     for row in try db.prepare("SELECT Id, OrderKey, DeliveryStatus, ShopKey, ShopName, CustomerKey, OrderRefNo, Time, Heading, SubHeading FROM Notifications") {
     var tempD = Dictionary<String,Any>()
     tempD["id"] = row[0]
     tempD["order_key"] = row[1]
     tempD["delivery_status"] = row[2]
     tempD["shop_key"] = row[3]
     tempD["shop_name"] = row[4]
     tempD["customer_key"] = row[5]
     tempD["order_ref_number"] = row[6]
     tempD["notification_datetime"] = row[7]
     tempD["heading"] = row[8]
     tempD["sub_heading"] = row[9]
     
     tempDarr.append(tempD)
     }
     } catch {
     print("Error in fetch: ",error)
     }
     print("NotificationList From DB ::: ",tempDarr)
     
     var notificationData = [NotificationList]()
     do {
     
     let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
     
     notificationData = try JSON(data: jsonData).arrayValue.map { NotificationList($0) }
     } catch {
     print("Error in serialization: ",error.localizedDescription)
     }
     return notificationData
     
     }
     
     func fetchOrders() -> [OrdersData] {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     
     var tempDarr = [Dictionary<String,Any>]()
     
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     for row in try db.prepare("SELECT ShopName, ShopKey, ShopLogo, OrderKey, OrderTime, OrderTotal, PaymentStatus, OrderRefNo, DeliveryStatus, Products FROM OrderHistory") {
     var tempD = Dictionary<String,Any>()
     tempD["shop_name"] = row[0]
     tempD["shop_key"] = row[1]
     tempD["shop_logo"] = row[2]
     tempD["order_key"] = row[3]
     tempD["order_datetime"] = row[4]
     tempD["order_total"] = row[5]
     tempD["payment_status"] = row[6]
     tempD["order_ref_number"] = row[7]
     tempD["delivery_status"] = row[8]
     tempD["products"] = row[9]
     
     tempDarr.append(tempD)
     }
     } catch {
     print("Error in fetch: ",error)
     }
     print("OrderHistory From DB ::: ",tempDarr)
     
     var orderData = [OrdersData]()
     do {
     
     let jsonData = try JSONSerialization.data(withJSONObject: tempDarr, options: JSONSerialization.WritingOptions.prettyPrinted)
     
     orderData = try JSON(data: jsonData).arrayValue.map { OrdersData($0) }
     } catch {
     print("Error in serialization: ",error.localizedDescription)
     }
     return orderData
     
     }
     
     func fetchCashbackBalance() -> String {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     
     var balance = String()
     
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let user = Table("UserDetails")
     
     let cashbackBalance = Expression<String?>("CashbackBalance")
     
     for row in try db.prepare(user.select(cashbackBalance)) {
     balance = row[cashbackBalance]!
     }
     } catch {
     print("Error in fetch: ",error)
     }
     return balance
     }
     
     func fetchAccountBalance() -> String {
     
     fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("aiCafe.sqlite")
     
     var balance = String()
     
     do {
     let db = try Connection(fileURL!.absoluteString)
     
     let user = Table("UserDetails")
     
     let accBalance = Expression<String?>("AccountBalance")
     
     for row in try db.prepare(user.select(accBalance)) {
     balance = row[accBalance]!
     }
     } catch {
     print("Error in fetch: ",error)
     }
     return balance
     }
     */
    
    
}



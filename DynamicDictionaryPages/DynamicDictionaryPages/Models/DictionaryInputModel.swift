//
//  DictionaryModel.swift
//  DynamicDictionaryPages
//
//  Created by Dona Thomas on 07/07/20.
//  Copyright © 2020 Dona Thomas. All rights reserved.
//

import Foundation

class DictionaryInputModel {
    static let inputDictionary: [AnyHashable: Any] = [
    "Asia": ["India": ["Karnataka": ["Bangalore","Mangalore","Hubli","Belgaum"],
                       "Maharashtra": ["Mumbai","Nasik","Nagpur"],
                       "Kerala": ["Trivandrum","Kochi","Kozhikode"]],
             "Sri Lanka": [],
             "Malaysia": [],
             "Indonesia": []],
    "Europe": ["United Kingdom":[],"Belgium":[],"Spain":[],"France":[]],
    "North America": ["USA": ["Texas":["Houston","Dallas","Austin"],
                               "Alabama":["Montgomery","Huntsville"]],
                               "Mexico":[],"Canada":[]],
    "Africa": [ "Area": "30,370,000 km2",
                "Population": "1,275,920,972",
                "Largest cities": ["Cairo", "Lagos", "Kano", "Capetown"]],
    "Cold Continent": "Antarctica"
    ]
}

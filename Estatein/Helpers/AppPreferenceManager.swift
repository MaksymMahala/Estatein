//
//  AppPreferenceManager.swift
//  Minus1
//
//  Created by Max on 08.10.2024.
//

import Foundation

class AppPreferenceManager {
    
    public static let shared = AppPreferenceManager()
    let defaults = UserDefaults.standard
    
    // MARK: - Store data in UserDefaults -
    func saveRecentSearchText(value: String, key: String) {
        var array = getRecentSearchResult(key: key)
        
        array.append(value)
        defaults.set(array, forKey: key)
    }
    
    func saveString(value: String, key: String) {
        defaults.set(value, forKey: key)
    }
    
    func saveString(value: [String], key: String) {
        defaults.set(value, forKey: key)
    }
    
    func saveInt(value: Int, key: String) {
        defaults.set(value, forKey: key)
    }
    
    func saveDouble(value: Double, key: String) {
        defaults.set(value, forKey: key)
    }
    
    func saveBool(value: Bool, key: String) {
        defaults.set(value, forKey: key)
    }
    
    // MARK: - Retrieve -
    
    func getString(key: String) -> String {
        if let string = defaults.string(forKey: key) {
            return string
        }
        return "No data for key: \(key)"
    }
    
    func getRecentSearchResult(key: String) -> [String] {
        guard let string = defaults.stringArray(forKey: key) else { return [] }
        return string
    }
    
    func getInt(key: String) -> Int {
        let integer = defaults.integer(forKey: key)
        return integer
    }
    
    func getBool(key: String) -> Bool {
        let boolean = defaults.bool(forKey: key)
        
        return boolean
    }
    
    func getDouble(key: String) -> Double {
        let doubleV = defaults.double(forKey: key)
        return doubleV
    }

    
//    // MARK: - Clear UserDefaults -
//    func clearUserData() {
//        let domain = Bundle.main.bundleIdentifier!
//        defaults.removePersistentDomain(forName: domain)
//        defaults.synchronize()
//        log.debug("User data cleared \(Array(defaults.dictionaryRepresentation().keys).count)")
//    }
//
//    // MARK: - Delete coin from UserDefaults -
//
    func removeRecentSearchResult(value: Int, key: String) {
        var array = getRecentSearchResult(key: key)
        array.remove(at: value)
        defaults.set(array, forKey: key)
    }
    
    func removeAllRecentSearch(key: String) {
        var array = getRecentSearchResult(key: key)
        array.removeAll()
        defaults.set(array, forKey: key)
    }
}

//
//  Date.swift
//  GitHubApp
//
//  Created by Nikola on 13/05/2020.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date!
    }
}

extension Date {
    func toString(withFormat format: String = "dd.MM.yyyy hh:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)
        
        return str
    }
}

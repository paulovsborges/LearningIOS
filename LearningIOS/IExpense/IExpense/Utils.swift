//
//  Utils.swift
//  IExpense
//
//  Created by Borges on 26/06/24.
//

import Foundation

func getCurrencyCode() -> String{
    Locale.current.currency?.identifier ?? "USD"
}

class Constants{
    static let userDefaultKey = "Items"
}

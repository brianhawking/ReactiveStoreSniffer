//
//  DateFormmater.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/3/24.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss.SSS"
    return formatter
}()

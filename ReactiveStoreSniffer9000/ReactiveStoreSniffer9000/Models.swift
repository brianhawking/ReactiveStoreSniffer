//
//  Models.swift
//  ReactiveStoreSniffer9000
//
//  Created by Brian Veitch on 8/2/24.
//

import Foundation
import SwiftUI

struct Entry: Identifiable, Decodable {
    let id: UUID
    let timestamp: Date
    let eventType: String
    let featureName: String
    let summary: String
    let details: EntryDetails
}

enum EntryDetails: Decodable {
    case action(ActionDetails)
    case log(LogDetails)
    case state(StateDetails)
    
    private enum CodingKeys: String, CodingKey {
        case type, data
    }
    
    private enum EntryType: String, Decodable {
        case action, log, state
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(EntryType.self, forKey: .type)
        
        switch type {
        case .action:
            let data = try container.decode(ActionDetails.self, forKey: .data)
            self = .action(data)
        case .log:
            let data = try container.decode(LogDetails.self, forKey: .data)
            self = .log(data)
        case .state:
            let data = try container.decode(StateDetails.self, forKey: .data)
            self = .state(data)
        }
    }
}

struct ActionDetails: Decodable {
    let actionType: String
    let payload: String // JSON string representation of the payload
}

struct LogDetails: Decodable {
    let logLevel: String
    let logMessage: String
}

struct StateDetails: Decodable {
    let stateData: String // JSON string representation of the state data
}


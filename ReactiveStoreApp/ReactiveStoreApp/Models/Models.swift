//
//  Models.swift
//  ReactiveStoreApp
//
//  Created by Brian Veitch on 8/2/24.
//

import Foundation

struct Entry: Identifiable, Codable {
    let id: UUID
    let timestamp: Date
    let eventType: String
    let featureName: String
    let summary: String
    let details: EntryDetails
}

enum EntryDetails: Codable {
    case dispatch(ActionDetails)
    case analytics(LogDetails)
    case state(StateDetails)
    
    private enum CodingKeys: String, CodingKey {
        case type, data
    }
    
    private enum EntryType: String, Codable {
        case action, log, state
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(EntryType.self, forKey: .type)
        
        switch type {
        case .action:
            let data = try container.decode(ActionDetails.self, forKey: .data)
            self = .dispatch(data)
        case .log:
            let data = try container.decode(LogDetails.self, forKey: .data)
            self = .analytics(data)
        case .state:
            let data = try container.decode(StateDetails.self, forKey: .data)
            self = .state(data)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        switch self {
        case .dispatch(let data):
            try container.encode(EntryType.action, forKey: .type)
            try container.encode(data, forKey: .data)
        case .analytics(let data):
            try container.encode(EntryType.log, forKey: .type)
            try container.encode(data, forKey: .data)
        case .state(let data):
            try container.encode(EntryType.state, forKey: .type)
            try container.encode(data, forKey: .data)
        }
    }
}

struct ActionDetails: Codable {
    let action: String
    let payload: String
}

struct LogDetails: Codable {
    let logLevel: String
    let logMessage: String
}

struct StateDetails: Codable {
    let state: String
}


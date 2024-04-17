//
//  TestEventTracker.swift
//
//
//  Created by Vladislav Fitc on 15/10/2020.
//

import AlgoliaSearchClient
import Foundation
@testable import InstantSearchInsights

class TestEventTracker: EventTrackable {

    
  var didViewObjects: ((EventName, IndexName, UserToken?, Date?, [ObjectID]) -> Void)?
  var didViewFilters: ((EventName, IndexName, UserToken?, Date?, [String]) -> Void)?
  var didClickObjects: ((EventName, IndexName, UserToken?, Date?, [ObjectID]) -> Void)?
  var didClickObjectsAfterSearch: ((EventName, IndexName, UserToken?, Date?, [ObjectID], [Int], QueryID) -> Void)?
  var didClickFilters: ((EventName, IndexName, UserToken?, Date?, [String]) -> Void)?
  var didConvertObjects: ((EventName, IndexName, UserToken?, Date?, [ObjectID]) -> Void)?
  var didConvertObjectsAfterSearch: ((EventName, IndexName, UserToken?, Date?, [ObjectID], QueryID) -> Void)?
  var didConvertFilters: ((EventName, IndexName, UserToken?, Date?, [String]) -> Void)?

  func view(eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, objectIDs: [ObjectID]) {
    didViewObjects?(eventName, indexName, userToken, timestamp, objectIDs)
  }

  func view(eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, filters: [String]) {
    didViewFilters?(eventName, indexName, userToken, timestamp, filters)
  }

  func click(eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, objectIDs: [ObjectID], objectData: [ObjectDataEvent]?, value: String?, currency: String?) {
    didClickObjects?(eventName, indexName, userToken, timestamp, objectIDs)
  }

  func click(eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, objectIDs: [ObjectID], positions: [Int], queryID: QueryID, objectData: [ObjectDataEvent]?, value: String?, currency: String?) {
    didClickObjectsAfterSearch?(eventName, indexName, userToken, timestamp, objectIDs, positions, queryID)
  }

  func click(eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, filters: [String]) {
    didClickFilters?(eventName, indexName, userToken, timestamp, filters)
  }
     
    func conversion(subType: InsightsEvent.EventSubType?, eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, objectIDs: [ObjectID], objectData: [ObjectDataEvent]?, value: String?, currency: String?) {
        didConvertObjects?(eventName, indexName, userToken, timestamp, objectIDs)
    }
    
    func conversion(subType: InsightsEvent.EventSubType?, eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, objectIDs: [ObjectID], queryID: QueryID, objectData: [ObjectDataEvent]?, value: String?, currency: String?) {
        didConvertObjectsAfterSearch?(eventName, indexName, userToken, timestamp, objectIDs, queryID)
    }
    
    func conversion(subType: InsightsEvent.EventSubType?, eventName: EventName, indexName: IndexName, userToken: UserToken?, timestamp: Date?, filters: [String]) {
        didConvertFilters?(eventName, indexName, userToken, timestamp, filters)
    }
}

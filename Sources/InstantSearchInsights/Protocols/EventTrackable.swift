//
//  EventTrackable.swift
//  Insights
//
//  Created by Vladislav Fitc on 05/12/2018.
//  Copyright © 2018 Algolia. All rights reserved.
//

import AlgoliaSearchClient
import Foundation
// swiftlint:disable function_parameter_count
protocol EventTrackable {
  func view(eventName: EventName,
            indexName: IndexName,
            userToken: UserToken?,
            timestamp: Date?,
            objectIDs: [ObjectID])

  func view(eventName: EventName,
            indexName: IndexName,
            userToken: UserToken?,
            timestamp: Date?,
            filters: [String])

  func click(eventName: EventName,
             indexName: IndexName,
             userToken: UserToken?,
             timestamp: Date?,
             objectIDs: [ObjectID],
             objectData: [ObjectDataEvent]?,
             currency: String? )

  func click(eventName: EventName,
             indexName: IndexName,
             userToken: UserToken?,
             timestamp: Date?,
             objectIDs: [ObjectID],
             positions: [Int],
             queryID: QueryID,
             objectData: [ObjectDataEvent]?,
             currency: String?)

  func click(eventName: EventName,
             indexName: IndexName,
             userToken: UserToken?,
             timestamp: Date?,
             filters: [String])

  func conversion(subType: InsightsEvent.EventSubType?,
                  eventName: EventName,
                  indexName: IndexName,
                  userToken: UserToken?,
                  timestamp: Date?,
                  objectIDs: [ObjectID],
                  objectData: [ObjectDataEvent]?,
                  currency: String?)

  func conversion(subType: InsightsEvent.EventSubType?,
                  eventName: EventName,
                  indexName: IndexName,
                  userToken: UserToken?,
                  timestamp: Date?,
                  objectIDs: [ObjectID],
                  queryID: QueryID,
                  objectData: [ObjectDataEvent]?,
                  currency: String?)

  func conversion(subType: InsightsEvent.EventSubType?,
                  eventName: EventName,
                  indexName: IndexName,
                  userToken: UserToken?,
                  timestamp: Date?,
                  filters: [String])
}
// swiftlint:enable function_parameter_count

//
//  Insights+SearchEventTracking.swift
//  InstantSearchInsights
//
//  Created by Vladislav Fitc on 20/10/2020.
//

import AlgoliaSearchClient
import Foundation

/// Tracking events tighten to search
public extension Insights {
  /// Track a click related to search
  /// - parameter eventName: A user-defined string used to categorize events
  /// - parameter indexName: Name of the targeted index
  /// - parameter objectIDs: An array of index objectID. Limited to 20 objects.
  /// - parameter positions: Position of the click in the list of Algolia search results. Positions count must be the same as objectID count.
  /// - parameter queryID: Algolia queryID
  /// - parameter timestamp: Event timestamp
  /// - parameter userToken: User identifier. Overrides application's user token if specified. Default value is nil.

  func clickedAfterSearch(eventName: EventName,
                          indexName: IndexName,
                          objectIDs: [ObjectID],
                          positions: [Int],
                          queryID: QueryID,
                          timestamp: Date? = .none,
                          userToken: UserToken? = .none,
                          objectData: [ObjectDataEvent]? = nil,
                          value: String? = nil,
                          currency: String? = nil) {
    eventTracker.click(eventName: eventName,
                       indexName: indexName,
                       userToken: userToken,
                       timestamp: timestamp,
                       objectIDs: objectIDs,
                       positions: positions,
                       queryID: queryID,
                       objectData:objectData,
                       value: value,
                       currency:currency)
  }

  /// Track a click related to search
  /// - parameter eventName: A user-defined string used to categorize events
  /// - parameter indexName: Name of the targeted index
  /// - parameter objectIDsWithPositions: An array of related index objectID and position of the click in the list of Algolia search results. - Warning: Limited to 20 objects.
  /// - parameter queryID: Algolia queryID
  /// - parameter timestamp: Event timestamp
  /// - parameter userToken: User identifier. Overrides application's user token if specified. Default value is nil.

  func clickedAfterSearch(eventName: EventName,
                          indexName: IndexName,
                          objectIDsWithPositions: [(ObjectID, Int)],
                          queryID: QueryID,
                          timestamp: Date? = .none,
                          userToken: UserToken? = .none,
                          objectData: [ObjectDataEvent]? = nil,
                          value: String? = nil,
                          currency: String? = nil)  {
    clickedAfterSearch(eventName: eventName,
                       indexName: indexName,
                       objectIDs: objectIDsWithPositions.map { $0.0 },
                       positions: objectIDsWithPositions.map { $0.1 },
                       queryID: queryID,
                       timestamp: timestamp,
                       userToken: userToken,
                       objectData:objectData,
                       value: value,
                       currency:currency)
  }

  /// Track a click related to search
  /// - parameter eventName: A user-defined string used to categorize events
  /// - parameter indexName: Name of the targeted index
  /// - parameter objectID: Index objectID
  /// - parameter position: Position of the click in the list of Algolia search results
  /// - parameter queryID: Algolia queryID
  /// - parameter timestamp: Event timestamp
  /// - parameter userToken: User identifier. Overrides application's user token if specified. Default value is nil.

  func clickedAfterSearch(eventName: EventName,
                          indexName: IndexName,
                          objectID: ObjectID,
                          position: Int,
                          queryID: QueryID,
                          timestamp: Date? = .none,
                          userToken: UserToken? = .none,
                          objectData: [ObjectDataEvent]? = nil,
                          value: String? = nil,
                          currency: String? = nil)  {
    clickedAfterSearch(eventName: eventName,
                       indexName: indexName,
                       objectIDs: [objectID],
                       positions: [position],
                       queryID: queryID,
                       timestamp: timestamp,
                       userToken: userToken,
                       objectData:objectData,
                       value: value,
                       currency:currency)
  }

  /// Track a conversion related to search
  /// - parameter eventName: A user-defined string used to categorize events
  /// - parameter indexName: Name of the targeted index
  /// - parameter objectIDs: An array of index objectID. Limited to 20 objects.
  /// - parameter queryID: Algolia queryID
  /// - parameter timestamp: Event timestamp
  /// - parameter userToken: User identifier. Overrides application's user token if specified. Default value is nil.

  func convertedAfterSearch(eventName: EventName,
                            indexName: IndexName,
                            objectIDs: [ObjectID],
                            queryID: QueryID,
                            timestamp: Date? = .none,
                            userToken: UserToken? = .none,
                            objectData: [ObjectDataEvent]? = nil,
                            value: String? = nil,
                            currency: String? = nil) {
    eventTracker.conversion(subType: nil,
                            eventName: eventName,
                            indexName: indexName,
                            userToken: userToken,
                            timestamp: timestamp,
                            objectIDs: objectIDs,
                            queryID: queryID,
                            objectData:objectData,
                            value: value,
                            currency:currency)
  }
    
    /// Track a conversion related to search
    func addToCartAfterSearch(eventName: EventName,
                              indexName: IndexName,
                              objectIDs: [ObjectID],
                              queryID: QueryID,
                              timestamp: Date? = .none,
                              userToken: UserToken? = .none,
                              objectData: [ObjectDataEvent]? = nil,
                              value: String? = nil,
                              currency: String? = nil) {
        eventTracker.conversion(
            subType: .addToCart,
            eventName: eventName,
            indexName: indexName,
            userToken: userToken,
            timestamp: timestamp,
            objectIDs: objectIDs,
            queryID: queryID,
            objectData:objectData,
            value: value,
            currency:currency)
    }
    
    /// Track a conversion related to search
    func addToCart(eventName: EventName,
                              indexName: IndexName,
                              objectIDs: [ObjectID],
                              timestamp: Date? = .none,
                              userToken: UserToken? = .none,
                   objectData: [ObjectDataEvent]? = nil,
                   value: String? = nil,
                   currency: String? = nil) {
        eventTracker.conversion(
            subType: .addToCart,
            eventName: eventName,
            indexName: indexName,
            userToken: userToken,
            timestamp: timestamp,
            objectIDs: objectIDs,
            objectData:objectData,
            value: value,
            currency:currency)
    }
    
    /// Track a conversion related to search
    ///
    func purchaseAfterSearch(eventName: EventName,
                             indexName: IndexName,
                             objectIDs: [ObjectID],
                             queryID: QueryID,
                             objectData: [ObjectDataEvent]? = nil,
                             value: String? = nil,
                             currency: String? = nil,
                             timestamp: Date? = .none,
                             userToken: UserToken? = .none) {
        eventTracker.conversion(
            subType: .purchase,
            eventName: eventName,
            indexName: indexName,
            userToken: userToken,
            timestamp: timestamp,
            objectIDs: objectIDs,
            queryID: queryID,
            objectData:objectData,
            value: value,
            currency:currency)
    }
    
    /// Track a conversion related to search
    func purchase(eventName: EventName,
                              indexName: IndexName,
                              objectIDs: [ObjectID],
                  objectData: [ObjectDataEvent]? = nil,
                  value: String? = nil,
                  currency: String? = nil,
                              timestamp: Date? = .none,
                              userToken: UserToken? = .none) {
        eventTracker.conversion(subType: .purchase,
                                eventName: eventName,
                                indexName: indexName,
                                userToken: userToken,
                                timestamp: timestamp,
                                objectIDs: objectIDs,
                                objectData:objectData,
                                value: value,
                                currency:currency)
    }
  /// Track a conversion related to search
  /// - parameter eventName: A user-defined string used to categorize events
  /// - parameter indexName: Name of the targeted index
  /// - parameter objectID: Index objectID
  /// - parameter queryID: Algolia queryID
  /// - parameter timestamp: Event timestamp
  /// - parameter userToken: User identifier. Overrides application's user token if specified. Default value is nil.

  func convertedAfterSearch(eventName: EventName,
                            indexName: IndexName,
                            objectID: ObjectID,
                            queryID: QueryID,
                            timestamp: Date? = .none,
                            userToken: UserToken? = .none,
                            objectData: [ObjectDataEvent]? = nil,
                            value: String? = nil,
                            currency: String? = nil) {
    eventTracker.conversion(subType: nil,
                            eventName: eventName,
                            indexName: indexName,
                            userToken: userToken,
                            timestamp: timestamp,
                            objectIDs: [objectID],
                            queryID: queryID,
                            objectData:objectData,
                            value: value,
                            currency:currency)
  }
}

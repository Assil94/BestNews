//
//  Observer.swift
//  BestNews
//
//  Created by Assil Heddar on 26/09/2022.
//

import Foundation

/**
 A simple callback that can receive from LiveData.
 */
struct Observer<T> {
    /**
     Function called when the value is modified
     */
    var onChanged: (T?) -> Void
    /**
     Unique Id to identify each Observers
     */
    let id = Int.random(in: 0 ... Int.max)

    init(_ onChanged: @escaping (T?) -> Void) {
        self.onChanged = onChanged
    }
}

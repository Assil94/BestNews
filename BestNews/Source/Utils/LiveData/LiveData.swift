//
//  LiveData.swift
//  BestNews
//
//  Created by Assil Heddar on 26/09/2022.
//

import Foundation

/**
 LiveData is a data holder class that can be observed within a given lifecycle

 */
class LiveData<T>: Equatable where T: Equatable {
    static func == (lhs: LiveData<T>, rhs: LiveData<T>) -> Bool {
        lhs.getValue() == rhs.getValue()
    }

    private let thread: DispatchQueue = DispatchQueue.main
    private var property: T? {
        willSet(newValue) {
            if property != newValue {
                thread.async {
                    self.observers.forEach { observer in
                        observer.onChanged(newValue)
                    }
                }
            }
        }
    }

    private var observers: [Observer<T>] = []

    /**
     LiveData constructor
     */
    init(_ value: T? = nil) {
        property = value
    }

    /**
     Sets the value. If there are active observers, the value will be dispatched to them.

     - Important: Need to be called only inside MainThread
     - Parameter value: The new value
     */
    func setValue(value: T?) {
        // Check if the thread is the main thread
        assert(Thread.isMainThread)
        property = value
    }

    /**
     Posts a task to a main thread to set the given value.

     - Parameter value: The new value
     */
    func postValue(value: T?) {
        synced(self) {
            property = value
        }
    }

    /**
     Get the current value

     - Returns: The value
     */
    func getValue() -> T? {
        property
    }

    /**
     Adds the given observer to the observers list within the lifespan of the given owner

     - Important: Need to be called only inside MainThread
     - Parameter observer: Given observer to add
     */
    func addObserver(observer: Observer<T>) {
        // Check if the thread is the main thread
        assert(Thread.isMainThread)
        let index: Int? = observers.firstIndex(where: { obs in observer.id == obs.id })

        // If it is not inside the array, add it
        if index == nil {
            observers.append(observer)
            observer.onChanged(property)
        }
    }

    /**
     Removes the given observer from the observers list

     - Parameter observer: The Observer to remove
     */
    func removeObserver(observer: Observer<T>) {
        let index: Int? = observers.firstIndex(where: { obs in observer.id == obs.id })
        guard let index = index else {
            return
        }
        // If it is inside the array, remove it
        observers.remove(at: index)
    }

    private func synced(_ lock: Any, closure: () -> Void) {
        objc_sync_enter(lock)
        closure()
        objc_sync_exit(lock)
    }
}

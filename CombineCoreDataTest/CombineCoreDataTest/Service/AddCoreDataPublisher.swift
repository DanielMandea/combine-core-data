//
//  AddCoreDataPublisher.swift
//  CombineCoreDataTest
//
//  Created by Sima Vlad Grigore on 22/11/2020.
//  Copyright © 2020 Sima Vlad Grigore. All rights reserved.
//

import Foundation
import Combine

struct AddCoreDataPublisher: Publisher {
    typealias Output = Void
    typealias Failure = Error
    
    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
        // implement this later
    }
}

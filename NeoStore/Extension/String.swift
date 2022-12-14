//
//  String.swift
//  NeoStore
//
//  Created by webwerks1 on 28/03/19.
//  Copyright © 2019 webwerks. All rights reserved.
//

import UIKit

extension String {
    
    func isValidName() -> Bool {
        return self.count > 1 && NSPredicate(format: ".*[^A-Za-z ].*").evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        return self.count > 0 && NSPredicate(format: "self matches %@", "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,64}").evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return self.count > 5 && self.rangeOfCharacter(from: .whitespacesAndNewlines) == nil
    }
   
    func isValidPostalCode() -> Bool {
        return self.count == 6 && self.rangeOfCharacter(from: .whitespacesAndNewlines) == nil
    }
    
    func isValidPhoneNo() -> Bool {
        return self.count == 10 && self.rangeOfCharacter(from: .whitespacesAndNewlines) == nil
    }
}

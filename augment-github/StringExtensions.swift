//
//  StringExtensions.swift
//  augment-github
//
//  Created by Salah on 2017-10-01.
//  Copyright © 2017 DevSK. All rights reserved.
//

import Foundation

extension String {
    
    func findMatch(pattern: String) -> String? {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
            let matches = regex.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
            
            if let match = matches.first {
                let range = match.rangeAt(1)
                if let swiftRange = Range(range, in: self) {
                    return self[swiftRange]
                }
            }
        } catch { }
        return nil
    }
    
}

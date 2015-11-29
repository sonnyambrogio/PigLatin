//
//  PigLatinRules.swift
//  PigLatin
//
//  Created by Sonny Ambrogio on 2015-10-31.
//  Copyright © 2015 Viking Panda. All rights reserved.
//

import Foundation
import UIKit


class PigLatinRules {
    
    /* for words that begin with constanant sounds, 
    all letters before the initial vowel are placed at the end of the word sequence. 
    Then, "ay" is added */

    var hasFirstLetterAsVowel = false
    var workingString = ""
    var tempString = ""
    
}







extension PigLatinRules {
    func determinIfFirstLetterIsVowel(letter: String) -> Bool {
    
        var isVowel = false
        
        let vowels = ["a", "e", "i", "o", "u"]
        
        var tempVowelHolder: String
        
        
        for vowel in vowels {
            // 1.
            tempVowelHolder = vowel
            // 2.
            let lettertoCheck = String(letter.characters.first!)
            
            // 3.
            
            if lettertoCheck == tempVowelHolder {
                
                isVowel = true
                print("Letter to Check for Vowel: \(lettertoCheck) against: \(vowel) = \(isVowel)")
                break
                
                
            } else {
                isVowel = false
                print("Letter to Check for Vowel: \(lettertoCheck) against: \(vowel) = \(isVowel)")
                
            }
        }
            return isVowel
    }
}


extension PigLatinRules {
    func sortInputIntoAnArrayOfWords(input: String) -> Array <String> {
        // 1.
        let input = input
        
        // 2. convert text to array by using the white space as word sepparators
        let inputAsArray = input.componentsSeparatedByString(" ")
        
        return inputAsArray
    }
    
    func separateWordIntoCharacterArray(input: String) -> Array <String> {
        // 1.  
        let input = input
        
        // 2. convert text to an array
        let array = input.characters.map{ String ($0) }
        
        return array
    }
    
    
    
    
    
}
























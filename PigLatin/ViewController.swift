//
//  ViewController.swift
//  PigLatin
//
//  Created by Sonny Ambrogio on 2015-10-31.
//  Copyright © 2015 Viking Panda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK:- Variables and Constants
    let pigLatin = PigLatinRules()
    
    var userInput: String?
    var userHasTypedSomething: Bool?
    var numberTwoTempString = ""
    var numberOneTempString = ""
    var completedWord = ""
    var newTranslatedWords: Array <String> = []
    
    
    

    //MARK- Outlets and Actions
    @IBAction func translateButton(sender: UIButton) {
        if textInputOutlet.text.isEmpty {
        nothingToConvertAlert()
        } else {
            translate()
            translatedTextOutputLabel.text = makeNewString(newTranslatedWords)
        }
    }
    
    @IBOutlet weak var textInputOutlet: UITextView!

    @IBOutlet weak var translatedTextOutputLabel: UILabel!
    
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        translatedTextOutputLabel.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}











//MARK:- Alert Extension
extension ViewController {
    
    func nothingToConvertAlert() {
        let titleString = "Iay amay otnay ableay otay akemay a ilksay ursepay utoay foay a owssay earay."
        let messageString = "Please fill something into the textfield."
        
        // 1. Create the base Alert
        let alert = UIAlertController(title: titleString, message: messageString, preferredStyle: .Alert)
        
        // 2. create the OK button
        let okButton = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        // 3. add the OK button to the alert
        alert.addAction(okButton)
        
        // 4. display the alert
        presentViewController(alert, animated: true, completion: nil)
        
//        // try to customize th fonts and text in the alert - testing!!
//        alert.view.tintColor = UIColor.cyanColor()
//        alert.viewWillTransitionToSize(<#T##size: CGSize##CGSize#>, withTransitionCoordinator: <#T##UIViewControllerTransitionCoordinator#>)
        
        
        
        
        
    }
}

//MARK:- Helper Extensions
extension ViewController {
    
    func setAllTextFieldsToBeNothing() {
        numberTwoTempString = ""
        numberOneTempString = ""
        completedWord = ""
    }
    
    
    func translate() {
        
        // 1. set the variable that hold the user input
        userInput = textInputOutlet.text!
        
        // 2. convert the userInput into an array of individual words
        var inputArray = pigLatin.sortInputIntoAnArrayOfWords(userInput!)
        print("The input array = \(inputArray)")
        
        // 3. Convert the array and build a new one with piglatin words
        // set the word to check as the first word in the array
        while inputArray.isEmpty != true {
            let word = inputArray[0]
            print("the word to convert = \(word)")
            // convert the word into an array of characters
            var letterArray = pigLatin.separateWordIntoCharacterArray(word)
            print("the word as an array = \(letterArray)")
            // get the first letter in the array and check to see if it is a vowel
            while letterArray.isEmpty != true {
                let letterToCheckAgainstVowel = letterArray[0]
                print("The Letter To Check = \(letterToCheckAgainstVowel)")
                let letterCheckResults = pigLatin.determinIfFirstLetterIsVowel(String(letterToCheckAgainstVowel))
                print("The results of the vowel check = \(letterCheckResults)")
                // if the vowel check comes back negative(false)
                if letterCheckResults == false {
                    
                    numberTwoTempString += letterToCheckAgainstVowel
                    letterArray.removeAtIndex(0)
                    print("the new Array is \(letterArray)")
                    print("The number2TempString = \(numberTwoTempString)")
                }
                
                if letterCheckResults == true {
                    var tempArray = letterArray
                    print("the Temp Array is now = \(tempArray)")
                    letterArray.removeAll()
                    print("the orig Array shoule no be empty: Orig Array = \(letterArray)")
                    while tempArray.isEmpty != true {
                        let nextLetter = tempArray[0]
                        numberOneTempString += nextLetter
                        tempArray.removeAtIndex(0)
                        print("The new array is \(tempArray)")
                        print("the numberOneTempString = \(numberOneTempString)")
                    }
                    completedWord = (numberOneTempString + numberTwoTempString) + "ay"
                    print("The completed word is: \(completedWord)")
                    newTranslatedWords.append(completedWord)
                    print("the new word array is: \(newTranslatedWords)")
                    setAllTextFieldsToBeNothing()
                }
                
            }
            inputArray.removeAtIndex(0)
        }
    }

    func makeNewString(array: Array<String>) -> String {
        var outputString = ""
        
        for i in array {
            outputString += " \(i)"
        }
        return outputString
    }
    
    
    
    
    
    
}












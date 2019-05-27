//
//  ViewController.swift
//  Natural Language Processing
//
//  Created by Alex on 5/27/19.
//  Copyright © 2019 Alex. All rights reserved.
//

import UIKit
import NaturalLanguage
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        speech()
        
        let string = "Hello, I am speaking my own lanaguage."//"私はガラスを食べられます。それは私を傷つけません。"
        
        let recognizer = NLLanguageRecognizer()
        recognizer.processString(string)
        recognizer.dominantLanguage // en // ja
        recognizer.languageHypotheses(withMaximum: 2) // how confidence level of recognizer
        print("The langauge being spoken is: ", recognizer.dominantLanguage!, recognizer.languageHypotheses(withMaximum: 2))
        
        UITextChecker.learnWord("Weekend") // add recognized word for the whole device
    }
    
    func speech(){
//       let string = """
//Je m'baladais sur l'avenue le cœur ouvert à l'inconnu
//    J'avais envie de dire bonjour à n'importe qui.
//N'importe qui et ce fut toi, je t'ai dit n'importe quoi
//    Il suffisait de te parler, pour t'apprivoiser.
//"""
        let string = "This is my text. I speak like an American."
        
        let languageRecognizer = NLLanguageRecognizer()
        languageRecognizer.processString(string)
        let language = languageRecognizer.dominantLanguage!.rawValue // fr
        
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: string)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        speechSynthesizer.speak(utterance)
    }


}


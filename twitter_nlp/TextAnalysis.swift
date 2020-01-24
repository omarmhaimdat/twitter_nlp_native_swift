//
//  TextAnalysis.swift
//  twitter_nlp
//
//  Created by M'haimdat omar on 21-01-2020.
//  Copyright © 2020 M'haimdat omar. All rights reserved.
//

import UIKit
import NaturalLanguage

class TextAnalysis {
    
    
    static func WordTagging(text: String, completion: @escaping ([String]?) -> ()) {
        
        var words = [String]()

        let tagger = NSLinguisticTagger(tagSchemes: [.tokenType], options: 0)
        tagger.string = text

        let range = NSRange(location: 0, length: text.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.enumerateTags(in: range, unit: .word, scheme: .tokenType, options: options) { _, tokenRange, _ in
            let word = (text as NSString).substring(with: tokenRange)
            words.append(word)
        }
        completion(words)
    }
    
    static func EntityTagging(text: String, completion: @escaping ([Dictionary<String, String>]?) -> ()) {
        
        var words = [Dictionary<String, String>]()
        
        let tagger = NSLinguisticTagger(tagSchemes: [.nameType], options: 0)
        tagger.string = text
        let range = NSRange(location:0, length: text.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace, .joinNames]
        let tags: [NSLinguisticTag] = [.personalName, .placeName, .organizationName]
        tagger.enumerateTags(in: range, unit: .word, scheme: .nameType, options: options) { tag, tokenRange, stop in
            if let tag = tag, tags.contains(tag) {
                let name = (text as NSString).substring(with: tokenRange)
                var entity = Dictionary<String, String>()
                entity.updateValue(name, forKey: tag.rawValue)
                words.append(entity)
            }
        }
        completion(words)
    }
    
    static func LexicalTagging(text: String, completion: @escaping ([Dictionary<String, String>]?) -> ()) {
        
        var words = [Dictionary<String, String>]()
        
        let tagger = NSLinguisticTagger(tagSchemes: [.lexicalClass], options: 0)
        tagger.string = text
        
        let range = NSRange(location: 0, length: text.utf16.count)
        let options: NSLinguisticTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.enumerateTags(in: range, unit: .word, scheme: .lexicalClass, options: options) { tag, tokenRange, _ in
            if let tag = tag {
                let word = (text as NSString).substring(with: tokenRange)
                var entity = Dictionary<String, String>()
                entity.updateValue(word, forKey: tag.rawValue)
                words.append(entity)
            }
        }
        completion(words)
    }
    
    static func getSentimentFromBuildInAPI(text: String) -> String {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        let (sentiment, _) = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore)
        
        if Double(sentiment!.rawValue)! < 0 {
            return "Negative"
        } else if Double(sentiment!.rawValue)! > 0 {
            return "Positve"
        } else {
            return "Neutral"
        }
    }
    
    static func getSentiment(text: String) -> String {
        let model = SentimentClassifier()
        do {
            let prediction = try model.prediction(text: text)
            return prediction.label
        } catch {
             print(error)
            return error as! String
        }
    }
    
}

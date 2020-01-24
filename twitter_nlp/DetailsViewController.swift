//
//  DetailsViewController.swift
//  twitter_nlp
//
//  Created by M'haimdat omar on 22-01-2020.
//  Copyright © 2020 M'haimdat omar. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var query = ""
    
    let tweet: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont(name: "Avenir", size: 16)
        text.textColor = .label
        return text
        
    }()
    
    let sentiment: BtnPleinLarge = {
        let button = BtnPleinLarge()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonToSentiment(_:)), for: .touchUpInside)
        button.setTitle("Sentiment - CreateML", for: .normal)
        let icon = UIImage(systemName: "eye")?.resized(newSize: CGSize(width: 50, height: 30))
        button.addRightImage(image: icon!, offset: 30)
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 5)
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.contentHorizontalAlignment = .left
        button.layoutIfNeeded()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.titleEdgeInsets.left = 0
        
        return button
    }()
    
    let sentimentFromBuiltInApi: BtnPleinLarge = {
        let button = BtnPleinLarge()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonToSentimentBuiltInApi(_:)), for: .touchUpInside)
        button.setTitle("Sentiment Built-in", for: .normal)
        let icon = UIImage(systemName: "eye")?.resized(newSize: CGSize(width: 50, height: 30))
        button.addRightImage(image: icon!, offset: 30)
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 5)
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.contentHorizontalAlignment = .left
        button.layoutIfNeeded()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.titleEdgeInsets.left = 0
        
        return button
    }()
    
    let wordTagging: BtnPleinLarge = {
        let button = BtnPleinLarge()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonToWordTagging(_:)), for: .touchUpInside)
        button.setTitle("Word tagging", for: .normal)
        let icon = UIImage(systemName: "text.bubble")?.resized(newSize: CGSize(width: 50, height: 40))
        button.addRightImage(image: icon!, offset: 30)
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 5)
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.contentHorizontalAlignment = .left
        button.layoutIfNeeded()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.titleEdgeInsets.left = 0
        
        return button
    }()
    
    let entityTagging: BtnPleinLarge = {
        let button = BtnPleinLarge()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonToEntityTagging(_:)), for: .touchUpInside)
        button.setTitle("Entity tagging", for: .normal)
        let icon = UIImage(systemName: "quote.bubble")?.resized(newSize: CGSize(width: 50, height: 40))
        button.addRightImage(image: icon!, offset: 30)
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 5)
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.contentHorizontalAlignment = .left
        button.layoutIfNeeded()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.titleEdgeInsets.left = 0
        
        return button
    }()
    
    let lexicalTagging: BtnPleinLarge = {
        let button = BtnPleinLarge()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonToLexicalTagging(_:)), for: .touchUpInside)
        button.setTitle("Lexical Tagging", for: .normal)
        let icon = UIImage(systemName: "eye")?.resized(newSize: CGSize(width: 50, height: 40))
        button.addRightImage(image: icon!, offset: 30)
        button.backgroundColor = .systemBlue
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowColor = UIColor.systemBlue.cgColor
        button.layer.shadowOffset = CGSize(width: 1, height: 5)
        button.layer.cornerRadius = 20
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = true
        button.clipsToBounds = false
        button.contentHorizontalAlignment = .left
        button.layoutIfNeeded()
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        button.titleEdgeInsets.left = 0
        
        return button
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        setupTabBar()
        setupLabel()
        setupButtons()
    }
    
    func setupTabBar() {
           navigationController?.navigationBar.prefersLargeTitles = true
           self.navigationItem.title = query
           if #available(iOS 13.0, *) {
               self.navigationController?.navigationBar.barTintColor = .systemBackground
                navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.label]
           } else {
               // Fallback on earlier versions
               self.navigationController?.navigationBar.barTintColor = .lightText
               navigationController?.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.black]
           }
           self.navigationController?.navigationBar.isHidden = false
           self.setNeedsStatusBarAppearanceUpdate()
           self.navigationItem.largeTitleDisplayMode = .automatic
           self.navigationController?.navigationBar.barStyle = .default
           if #available(iOS 13.0, *) {
               navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.label]
           } else {
               navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor : UIColor.black]
           }
           if #available(iOS 13.0, *) {
               navigationController?.navigationBar.backgroundColor = .systemBackground
           } else {
               // Fallback on earlier versions
               navigationController?.navigationBar.backgroundColor = .white
           }
           self.tabBarController?.tabBar.isHidden = false
       }
    
    private func setupLabel() {
        view.addSubview(tweet)
        tweet.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tweet.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        tweet.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        tweet.heightAnchor.constraint(equalToConstant: 200).isActive = true
        tweet.numberOfLines = 5
    }
    
    
    private func setupButtons() {
        
        view.addSubview(sentiment)
        view.addSubview(sentimentFromBuiltInApi)
        view.addSubview(wordTagging)
        view.addSubview(entityTagging)
        view.addSubview(lexicalTagging)
        
        sentiment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sentiment.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        sentiment.heightAnchor.constraint(equalToConstant: 70).isActive = true
        sentiment.topAnchor.constraint(equalTo: tweet.bottomAnchor, constant: 0).isActive = true
        
        sentimentFromBuiltInApi.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sentimentFromBuiltInApi.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        sentimentFromBuiltInApi.heightAnchor.constraint(equalToConstant: 70).isActive = true
        sentimentFromBuiltInApi.topAnchor.constraint(equalTo: sentiment.bottomAnchor, constant: 30).isActive = true
        
        wordTagging.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        wordTagging.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        wordTagging.heightAnchor.constraint(equalToConstant: 70).isActive = true
        wordTagging.topAnchor.constraint(equalTo: sentimentFromBuiltInApi.bottomAnchor, constant: 30).isActive = true
        
        entityTagging.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        entityTagging.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        entityTagging.heightAnchor.constraint(equalToConstant: 70).isActive = true
        entityTagging.topAnchor.constraint(equalTo: wordTagging.bottomAnchor, constant: 30).isActive = true
        
        lexicalTagging.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        lexicalTagging.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        lexicalTagging.heightAnchor.constraint(equalToConstant: 70).isActive = true
        lexicalTagging.topAnchor.constraint(equalTo: entityTagging.bottomAnchor, constant: 30).isActive = true
    }
    
    
    
    @objc func buttonToSentiment(_ sender: BtnPleinLarge) {
        let sentiment = TextAnalysis.getSentiment(text: tweet.text!)
        let alert = UIAlertController(title: "Sentiment", message: "\(sentiment)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func buttonToSentimentBuiltInApi(_ sender: BtnPleinLarge) {
        let sentiment = TextAnalysis.getSentimentFromBuildInAPI(text: tweet.text!)
        let alert = UIAlertController(title: "Sentiment", message: "\(sentiment)", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func buttonToWordTagging(_ sender: BtnPleinLarge) {
        TextAnalysis.WordTagging(text: tweet.text!) { (words) in
            if let words = words {
                let alert = UIAlertController(title: "Word Tagging", message: "\(words)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func buttonToEntityTagging(_ sender: BtnPleinLarge) {
        TextAnalysis.EntityTagging(text: tweet.text!) { (words) in
            if let words = words {
                let alert = UIAlertController(title: "Entity Tagging", message: "\(words)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func buttonToLexicalTagging(_ sender: BtnPleinLarge) {
        TextAnalysis.LexicalTagging(text: tweet.text!) { (words) in
            if let words = words {
                let alert = UIAlertController(title: "Lexical Tagging", message: "\(words)", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
}

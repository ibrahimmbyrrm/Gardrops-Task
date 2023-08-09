//
//  ViewController.swift
//  GardropsTask1
//
//  Created by İbrahim Bayram on 8.08.2023.
//

import UIKit

final class ViewController: UIViewController {
    //MARK: - UI Objects
    private let backgroundImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noti.png")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let nextButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("İleri", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(nextButtonTapped), for: .touchUpInside)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        return button
    }()
    private let advantagesStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }()
    private let titleStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        return stackView
    }()
    private let preferenceLabel : UILabel = {
        let label = UILabel()
        label.text = "Tercihini telefon ayarladından dilediğin\nzaman değiştirebilirsin."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        execute()
    }
    
    private func execute() {
        //Setup objects and add it on view
        setSubviews()
        //Setup stackview componenets
        setupAdvantagesStackViewSubviews()
        
        setupTitleStackViewSubviews()
        //Setup layout and constraints
        setupBackgroundImageViewConstraints()
        
        setupNextButtonConstraints()
        
        setupTitleStackViewConstraints()
        
        setupAdvantagesStackViewConstraints()
        
        setupPreferenceLabelConstraints()
        //Setup button's gradient background.
        nextButton.applyGradient(colors: [UIColor.red.cgColor,UIColor.purple.cgColor])
    }
    
    @objc func nextButtonTapped() {
        print("İleri butonuna basıldı")
    }
    
    //Set all objects to view.
    private func setSubviews() {
        [backgroundImage,nextButton,titleStackView,advantagesStackView,preferenceLabel].forEach { v in
            v.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(v)
        }
    }
    //MARK: - StackView ArrangedSubviews Functions
    private func setupTitleStackViewSubviews() {
        let titles = ["Bildirimlere",
                      "izin ver",
                      "yenilikleri kaçırma!"]
        
        titles.forEach { title in
            let label = UILabel()
            
            label.text = title
            label.textColor = (title == "yenilikleri kaçırma!") ? UIColor.darkGray : UIColor.black
            label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            label.textAlignment = .left
            
            titleStackView.addArrangedSubview(label)
        }
    }
    
    private func setupAdvantagesStackViewSubviews() {
        let advantages = [
            "İzin verirsen;",
            "Satış yapma şansın %80 artar!",
            "Sipariş durumunu anlık takip edebilirsin.",
            "Sana özel ayrıcalıkları kaçırmazsın.",
            "Kampanyalardan anında haberdar olursun."
        ]
        
        advantages.forEach { advantage in
            let label = UILabel()
            
            label.text = advantage == advantages.first ? advantage : "✓ " + advantage
            label.textColor = .black
            label.font = advantage == advantages.first ? UIFont.systemFont(ofSize: 20, weight: .bold) : UIFont.systemFont(ofSize: 15, weight: .regular)
            label.textAlignment = .left
            
            advantagesStackView.addArrangedSubview(label)
        }
    }
    //MARK: - Layout Functions
    private func setupTitleStackViewConstraints() {
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            titleStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            titleStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            titleStackView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupAdvantagesStackViewConstraints() {
        NSLayoutConstraint.activate([
            advantagesStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            advantagesStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 30),
            advantagesStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            advantagesStackView.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    private func setupPreferenceLabelConstraints() {
        NSLayoutConstraint.activate([
            preferenceLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            preferenceLabel.bottomAnchor.constraint(equalTo: self.nextButton.topAnchor, constant: -10),
            preferenceLabel.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    private func setupNextButtonConstraints() {
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            nextButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupBackgroundImageViewConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            backgroundImage.heightAnchor.constraint(equalToConstant: 220),
            backgroundImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        ])
    }
}


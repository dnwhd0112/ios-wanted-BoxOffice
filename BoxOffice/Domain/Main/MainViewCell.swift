//
//  MainViewCell.swift
//  BoxOffice
//
//  Created by Ellen J on 2023/01/03.
//

import UIKit

final class MainViewCell: UICollectionViewCell {
    static let identifier = "\(MainViewCell.self)"
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "dummyPoster"))
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var numberBoxView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(r: 76, g: 52, b: 145)
        return view
    }()
    
    private lazy var rankNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .headline)
        label.textAlignment = .center
        return label
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    private lazy var rankRateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private lazy var audienceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .preferredFont(forTextStyle: .caption1)
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .preferredFont(forTextStyle: .caption2)
        return label
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.masksToBounds = true
        
        addSubviews(
            posterImageView,
            numberBoxView,
            rankNumberLabel,
            titleLabel,
            rankRateLabel,
            audienceLabel,
            dateLabel
        )
    }
    
    private func setupUI() {
        // MARK: - posterImageView
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 30)
        ])
        
        // MARK: - numberBoxView
        numberBoxView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            numberBoxView.topAnchor.constraint(equalTo: topAnchor),
            numberBoxView.leadingAnchor.constraint(equalTo: leadingAnchor),
            numberBoxView.widthAnchor.constraint(equalToConstant: 40),
            numberBoxView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // MARK: - rankNumberLabel
        rankNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rankNumberLabel.centerYAnchor.constraint(equalTo: numberBoxView.centerYAnchor),
            rankNumberLabel.centerXAnchor.constraint(equalTo: numberBoxView.centerXAnchor)
        ])
        
        // MARK: - titleLabel
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
        
        // MARK: - rankRateLabel
        rankRateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            rankRateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            rankRateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            rankRateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
        
        // MARK: - audienceLabel
        audienceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            audienceLabel.topAnchor.constraint(equalTo: rankRateLabel.bottomAnchor, constant: 5),
            audienceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            audienceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
        
        // MARK: - dateLabel
        dateLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: audienceLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func configureCell(_ model: DailyBoxOffice) {
        rankNumberLabel.text = model.rank
        titleLabel.text = model.title
        rankRateLabel.text = "순위증감분: \(model.rankInTen)"
        audienceLabel.text = "관객수: \(model.audienceCount)"
        dateLabel.text = "개봉일: \(model.openDate)"
        
        if model.isNewRank == "N" {
            
        } else if model.isNewRank == "Y" {
            
        }
    }
}
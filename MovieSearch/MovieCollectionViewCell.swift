import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    private let shadowContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(shadowContainerView)
        shadowContainerView.addSubview(imageView)
        imageView.addSubview(titleBackgroundView)
        titleBackgroundView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            shadowContainerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            shadowContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            shadowContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: shadowContainerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: shadowContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: shadowContainerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: shadowContainerView.bottomAnchor),

            titleBackgroundView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleBackgroundView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleBackgroundView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: titleBackgroundView.leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: titleBackgroundView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: titleBackgroundView.topAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: titleBackgroundView.bottomAnchor, constant: -4)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

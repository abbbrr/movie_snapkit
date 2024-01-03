import UIKit
import SnapKit
import Kingfisher

class DetailViewController: UIViewController {
    var movie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        if let movie = movie {
        
            if let imageURL = URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path)") {
                let imageView = UIImageView()
                imageView.kf.setImage(with: imageURL)
                imageView.contentMode = .scaleAspectFit
                view.addSubview(imageView)

                imageView.snp.makeConstraints { make in
                    make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
                    make.centerX.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(0.8)
                    make.height.equalTo(200)
                }
            }

            let nameLabel = UILabel()
            nameLabel.text = movie.title
            nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            view.addSubview(nameLabel)
            
            let starImage = UIImage(systemName: "star.fill")
            let attachment = NSTextAttachment()
            attachment.image = starImage
            attachment.bounds = CGRect(x: 0, y: -0.5, width: 17, height: 17)
            
            let attributedText = NSMutableAttributedString(attachment: attachment)
            let formatRaiting = String(format: "%.1f", movie.vote_average)
            attributedText.append(NSAttributedString(string: "\(formatRaiting)"))
            
            let raitingLabel = UILabel()
            raitingLabel.attributedText = attributedText
            raitingLabel.textAlignment = .center
            view.addSubview(raitingLabel)

            let dateLabel = UILabel()
            dateLabel.text = movie.releaseDate
            dateLabel.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            view.addSubview(dateLabel)

            let overiveLabel = UILabel()
            overiveLabel.text = movie.overview
            overiveLabel.font = UIFont.systemFont(ofSize: 15)
            overiveLabel.numberOfLines = 0
            overiveLabel.textAlignment = .center
            view.addSubview(overiveLabel)
            

            nameLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            
            raitingLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(nameLabel.snp.bottom).offset(20)
            }

            dateLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.equalTo(raitingLabel.snp.bottom).offset(20)
            }

            overiveLabel.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(20)
                make.trailing.equalToSuperview().offset(-20)
                make.top.equalTo(dateLabel.snp.bottom).offset(20)
            }
            
        }
    }
}

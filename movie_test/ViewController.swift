import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var films: [Movie] = []
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "movie")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
    
    private func setupUI(){
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        constraintTableView()
    }

    private func loadData(){
        API.shared.fetchData(complection:  { [weak self] movies in
            self?.films = movies
            self?.tableView.reloadData()
        })
    }

    private func constraintTableView() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }

    private func navigationMovie(movie: Movie) {
        let detailViewController = DetailViewController()
        detailViewController.movie = movie
        
        navigationController?.pushViewController(detailViewController, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "movie")
        let filmsItem = films[indexPath.row]

        cell.textLabel?.text = filmsItem.title
        cell.detailTextLabel?.text = filmsItem.releaseDate

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedMovie = films[indexPath.row]
        navigationMovie(movie: selectedMovie)
    }
}

//
//  TableView.swift
//  movie_test
//
//  Created by Рауан Аблайхан on 29.12.2023.
//

import Foundation

class TableView{
    
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

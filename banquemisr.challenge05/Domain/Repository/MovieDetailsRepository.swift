//
//  MovieDetailsRepository.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import UIKit

protocol MovieDetailsRepository {
    func movieDetails(with movieID: Int) async -> Result<MovieDataModel, HttpClientError>
}


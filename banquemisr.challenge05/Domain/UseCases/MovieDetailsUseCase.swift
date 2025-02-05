//
//  MovieDetailsUseCase.swift
//  banquemisr.challenge05
//
//  Created by Mahmoud Abd ElAziz on 01/02/2025.
//

import Foundation

protocol MovieDetailsUseCase {
    func execute(with movieID:Int) async -> Result<MovieDataModel, HttpClientError>
}


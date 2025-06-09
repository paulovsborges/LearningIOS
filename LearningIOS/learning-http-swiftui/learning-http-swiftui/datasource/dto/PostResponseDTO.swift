//
//  PostResponseDTO.swift
//  learning-http-swiftui
//
//  Created by Premiersoft on 06/06/25.
//

struct PostResponse: Codable, Identifiable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

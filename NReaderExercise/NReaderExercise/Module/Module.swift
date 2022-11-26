//
//  Module.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 23/11/2022.
//

import Foundation

// constructed from sample data at https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full

// Only need to read it in this exercise, so Decodable instead of Codable
struct RepresentedObject: Decodable {
    let id: Int
    let categories: [category] // type is my guess, since it is empty in the sample data
    let authors: [author] // type is my guess, since it is empty in the sample data
    let url: String
    let lastModified: Double
    let onTime: Double
    let sponsored: Bool
    let displayName: String

    let assets: [asset]
    
    let relatedAssets: [asset] // type is my guess, since it is empty in the sample data
    let relatedImages: [image] // type is my guess, since it is empty in the sample data
    let assetType: String
    let timeStamp: Double
}

struct asset: Decodable {
    let id: Int
    let categories: [category]
    let authors: [author]
    
    let url: String
    let lastModified: Double
    let sponsored: Bool
    let headline: String
    let indexHeadline: String
}

struct category: Decodable {
    let name: String
    let sectionPath: String
    let orderNum: Int
}

struct author: Decodable {
    let name: String
    let title: String
    let email: String
    let relatedAssets: [String]
    let relatedImages: [image]
}

struct image: Decodable {
    let id: Int
    let categories: [category]
    let brands: [String]
    let authors: [String]
    let url: String
    let lastModified: Double
    let sponsored: Bool
    let description: String
    let photographer: String
    let type: String
    let width: Int
    let height: Int
    let assetType: String
    let timeStamp: Double
}

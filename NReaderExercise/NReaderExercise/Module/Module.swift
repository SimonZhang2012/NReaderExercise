//
//  Module.swift
//  NReaderExercise
//
//  Created by Yixiang Zhang on 23/11/2022.
//

import Foundation

// Represent the data feteched from server, ideally we should get a spec from API developer
// Here we simply constructed from sample data at https://bruce-v2-mob.fairfaxmedia.com.au/1/coding_test/13ZZQX/full
// Only need to read it in this exercise, so Decodable instead of Codable
struct RepresentedObject: Decodable {
    let id: Int
    let categories: [category] // type is a guess, since it is empty in the sample data
    let authors: [author] // type is a guess, same as above and some in other places in this file
    let url: String
    let lastModified: Double
    let onTime: Double
    let sponsored: Bool
    let displayName: String

    let assets: [asset]
    
    let relatedAssets: [asset]
    let relatedImages: [image] 
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
    let tabletHeadline: String
    let theAbstract: String
    let byLine: String
    let acceptComments: Bool
    let numberOfComments: Int
    let relatedImages:[image]
    
    let timeStamp: Double
    
    // There are a few more properties, for the ease of this test, omit them for now.
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

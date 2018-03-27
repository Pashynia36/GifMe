//
//  GifModel.swift
//  GifMe
//
//  Created by Pavlo Novak on 3/27/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

import Foundation

struct GifModel: Decodable {
    
    let data: [DatumModel]
    let pagination: PaginationModel
    let meta: MetaModel
}

struct MetaModel: Decodable {
    
    let status: Int
    let msg: String
    let responseId: String
    
    enum CodingKeys: String, CodingKey {
        
        case status
        case msg
        case responseId = "response_id"
    }
}

struct PaginationModel: Decodable {
    
    let totalCount: Int
    let count: Int
    let offset: Int
    
    enum CodingKeys: String, CodingKey {
        
        case totalCount = "total_count"
        case count
        case offset
    }
}

struct DatumModel: Decodable {
    
    let type: String
    let id: String
    let slug: String
    let url: String
    let bitlyGifUrl: String
    let bitlyUrl: String
    let embedUrl: String
    let username: String
    let source: String
    let rating: String
    let contentUrl: String
    let sourceTld: String
    let sourcePostUrl: String
    let isIndexable: Int
    let isSticker: Int
    let importDatetime: String
    let trendingDatetime: String
    let images: ImagesModel
    let title: String
    let user: UserModel?
    
    enum CodingKeys: String, CodingKey {
        
        case type
        case id
        case slug
        case url
        case bitlyGifUrl = "bitly_gif_url"
        case bitlyUrl = "bitly_url"
        case embedUrl = "embed_url"
        case username
        case source
        case rating
        case contentUrl = "content_url"
        case sourceTld = "source_tld"
        case sourcePostUrl = "source_post_url"
        case isIndexable = "is_indexable"
        case isSticker = "is_sticker"
        case importDatetime = "import_datetime"
        case trendingDatetime = "trending_datetime"
        case images
        case title
        case user
    }
}

struct ImagesModel: Decodable {
    
    let fixedHeightStill: FixedHeightStillModel
    let originalStill: OriginalStillModel
    let fixedWidth: FixedWidthModel
    let fixedHeightSmallStill: FixedHeightSmallStillModel
    let fixedHeightDownsampled: FixedHeightDownsampledModel
    let preview: PreviewModel?
    let fixedHeightSmall: FixedHeightSmallModel
    let downsizedStill: DownsizedStillModel
    let downsized: DownsizedModel
    let downsizedLarge : DownsizedLargeModel
    let fixedWidthSmallStill: FixedWidthSmallStillModel
    let previewWebp: PreviewWebpModel?
    let fixedWidthStill: FixedWidthStillModel
    let fixedWidthSmall: FixedWidthSmallModel
    let downsizedSmall: DownsizedSmallModel?
    let fixedWidthDownsampled: FixedWidthDownsampledModel
    let downsizedMedium: DownsizedMediumModel
    let original: OriginalModel
    let fixedHeight: FixedHeightModel
    let looping: LoopingModel
    let originalMp4: OriginalMp4Model
    let previewGif: PreviewGifModel?
    let fourEightyWStill: FourEightyWStillModel
    let fourK: FourKModel?
    let hd: HdModel?
    
    enum CodingKeys: String, CodingKey {
        
        case fixedHeightStill = "fixed_height_still"
        case originalStill = "original_still"
        case fixedWidth = "fixed_width"
        case fixedHeightSmallStill = "fixed_height_small_still"
        case fixedHeightDownsampled = "fixed_height_downsampled"
        case preview
        case fixedHeightSmall = "fixed_height_small"
        case downsizedStill = "downsized_still"
        case downsized
        case downsizedLarge = "downsized_large"
        case fixedWidthSmallStill = "fixed_width_small_still"
        case previewWebp = "preview_webp"
        case fixedWidthStill = "fixed_width_still"
        case fixedWidthSmall = "fixed_width_small"
        case downsizedSmall = "downsized_small"
        case fixedWidthDownsampled = "fixed_width_downsampled"
        case downsizedMedium = "downsized_medium"
        case original
        case fixedHeight = "fixed_height"
        case looping
        case originalMp4 = "original_mp4"
        case previewGif = "preview_gif"
        case fourEightyWStill = "480w_still"
        case fourK = "4k"
        case hd
    }
}

struct UserModel: Decodable {
    
    let avatarUrl: String
    let bannerUrl: String
    let profileUrl: String
    let username: String
    let displayName: String
    let twitter: String
    let isVerified: Bool
    
    enum CodingKeys: String, CodingKey {
        
        case avatarUrl = "avatar_url"
        case bannerUrl = "banner_url"
        case profileUrl = "profile_url"
        case username
        case displayName = "display_name"
        case twitter
        case isVerified = "is_verified"
    }
}

struct HdModel: Decodable {
    
    let width: String
    let height: String
    let mp4: String
    let mp4Size: String?
    
    enum CodingKeys: String, CodingKey {
        
        case width
        case height
        case mp4
        case mp4Size = "mp4_size"
    }
}

struct FourKModel: Decodable {
    
    let width: String
    let height: String
    let mp4: String
    let mp4Size: String?
    
    enum CodingKeys: String, CodingKey {
        
        case width
        case height
        case mp4
        case mp4Size = "mp4_size"
    }
}

struct FourEightyWStillModel: Decodable {
    
    let url: String
    let width: String
    let height: String
}

struct PreviewGifModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct OriginalMp4Model: Decodable {
    
    let width: String
    let height: String
    let mp4: String
    let mp4Size: String?
    
    enum CodingKeys: String, CodingKey {
        
        case width
        case height
        case mp4
        case mp4Size = "mp4_size"
    }
}

struct LoopingModel: Decodable {
    
    let mp4: String
    let mp4Size: String?
    
    enum CodingKeys: String, CodingKey {
        
        case mp4
        case mp4Size = "mp4_size"
    }
}

struct FixedHeightModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
    let mp4: String
    let mp4Size: String?
    let webp: String
    let webpSize: String
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        case size
        case mp4
        case mp4Size = "mp4_size"
        case webp
        case webpSize = "webp_size"
    }
}

struct OriginalModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
    let frames: String
    let mp4: String
    let mp4Size: String?
    let webp: String
    let webpSize: String
    let hash: String?
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        case size
        case frames
        case mp4
        case mp4Size = "mp4_size"
        case webp
        case webpSize = "webp_size"
        case hash
    }
}

struct DownsizedMediumModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct FixedWidthDownsampledModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
    let webp: String
    let webpSize: String
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        case size
        case webp
        case webpSize = "webp_size"
    }
}

struct DownsizedSmallModel: Decodable {
    
    let width: String
    let height: String
    let mp4: String
    let mp4Size: String?
    
    enum CodingKeys: String, CodingKey {
        
        case width
        case height
        case mp4
        case mp4Size = "mp4_size"
    }
}

struct FixedWidthSmallModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
    let mp4: String
    let mp4Size: String?
    let webp: String
    let webpSize: String
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        case size
        case mp4
        case mp4Size = "mp4_size"
        case webp
        case webpSize = "webp_size"
    }
}

struct FixedWidthStillModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct PreviewWebpModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct FixedWidthSmallStillModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct DownsizedLargeModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct DownsizedModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct DownsizedStillModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct FixedHeightSmallModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
    let mp4: String
    let mp4Size: String?
    let webp: String
    let webpSize: String
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        case size
        case mp4
        case mp4Size = "mp4_size"
        case webp
        case webpSize = "webp_size"
    }
}

struct PreviewModel: Decodable {
    
    let width: String
    let height: String
    let mp4: String
    let mp4Size: String?
    
    enum CodingKeys: String, CodingKey {
        
        case width
        case height
        case mp4
        case mp4Size = "mp4_size"
    }
}

struct FixedHeightDownsampledModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
    let webp: String
    let webpSize: String
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        case size
        case webp
        case webpSize = "webp_size"
    }
}

struct FixedHeightSmallStillModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct FixedWidthModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
    let mp4: String
    let mp4Size: String?
    let webp: String
    let webpSize: String
    
    enum CodingKeys: String, CodingKey {
        
        case url
        case width
        case height
        case size
        case mp4
        case mp4Size = "mp4_size"
        case webp
        case webpSize = "webp_size"
    }
}

struct OriginalStillModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}

struct FixedHeightStillModel: Decodable {
    
    let url: String
    let width: String
    let height: String
    let size: String?
}




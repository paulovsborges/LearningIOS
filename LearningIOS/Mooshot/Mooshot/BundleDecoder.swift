//
//  BundleDecoder.swift
//  Mooshot
//
//  Created by Borges on 27/06/24.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String) -> T{
        guard let url = self.url(forResource: file, withExtension: nil)else {
            fatalError("Could not locate file \(file)")
        }
        
        guard let data = try? Data(contentsOf: url)else {
            fatalError("Could not load file \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard (try? decoder.decode(T.self, from: data)) != nil else{
            fatalError("Could not decode file \(file)")
        }
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(file) due to missing key \(key.stringValue) -\(context.debugDescription)")
        }catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) due to type mismatch - \(context.debugDescription)")
        }catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) due to missing \(type) value -\(context.debugDescription)")
        }catch DecodingError.dataCorrupted (_) {
            fatalError("Failed to decode \(file) because it appears to be invalid JSON.")
        }catch {
            fatalError("Failed")
        }
    }
}

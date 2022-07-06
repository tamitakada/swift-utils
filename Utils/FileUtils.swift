import UIKit


struct FileUtils {
    
    static let fileManager = FileManager.default
    
    static func getDocumentsDirectory() -> URL {
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    static func readBundleFile(name: String) -> String? {
        if let file = Bundle.main.url(forResource: name, withExtension: "txt") {
            do {
                return try String(contentsOf: file)
            } catch {
                return nil
            }
        }
        return nil
    }
    
    static func readBoxFile(name: String) -> String? {
        do {
            let url = getDocumentsDirectory().appendingPathComponent(name).appendingPathExtension("txt")
            return try String(contentsOf: url)
        } catch {
            return nil
        }
        return nil
    }
    
    // Returns true if file write was a success
    static func writeFile(name: String, content: String) -> Bool {
        let url = getDocumentsDirectory().appendingPathComponent(name).appendingPathExtension("txt")
        
        do {
            try content.write(to: url, atomically: true, encoding: .utf8)
            return true
        } catch {
            return false
        }
    }

}

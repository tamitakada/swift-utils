import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


struct FirebaseUtils {
    
    static let db = Firestore.firestore()
    
    static func signInAnonymously(completion: ((Bool) -> Void)?) {
        Auth.auth().signInAnonymously { authResult, error in
            completion?(error == nil && authResult?.user != nil)
        }
    }
    
    static func fetchData(collection: String, completion: (([Dictionary<String, Any>]) -> Void)?) {
        var data: [Dictionary<String, Any>] = []
        
        let group = DispatchGroup()
        group.enter()
        
        DispatchQueue.main.async {
            db.collection(collection).getDocuments() { (querySnapshot, err) in
                if let _ = err { data = [] }
                else {
                    for document in querySnapshot!.documents {
                        var documentData = document.data()
                        documentData["id"] = document.documentID
                        data.append(documentData)
                    }
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            completion?(data)
        }
    }

}

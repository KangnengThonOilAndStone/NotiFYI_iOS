import Foundation
import Combine

final class AppState {
    static let shared = AppState()
    
    var cancellables = Set<AnyCancellable>()
    let urlSession = URLSession.shared
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    var notices: CurrentValueSubject<[NoticeEntity], Never> = .init([])
    var customizedNotices: [CustomizedNoticeEntity] = []
    
    var selectedKeywords: [String] = ["행사", "동아리", "장학금"]
    
    private init() {
//        fetchNoticeList()
//        fetchCustomizedNoticeList(keywords: selectedKeywords)
        
        fetchDummyNoticeList(0)
        fetchDummyCustomizedNoticeList()
    }
    
    func updateKeywords(keywords: [String]) {
        selectedKeywords = keywords
    }
    
    func fetchNoticeList() {
        Task {
            let request = API.fetchNoticeList.request()

            let (data, response) = try await URLSession.shared.data(for: request)
            
            let noticeResponse = try decoder.decode(NoticeResponse.self, from: data)
            let noticeEntitys = noticeResponse.response.map { $0.metadata }
            self.notices.value = noticeEntitys
        }
    }
    
    func fetchCustomizedNoticeList(keywords: [String]) {
        Task {
            let request = API.fetchCustomNoticeList(keywords: keywords).request()

            let (data, response) = try await URLSession.shared.data(for: request)
            
            let customizedNoticeResponse = try decoder.decode(CustomizedNoticeResponse.self, from: data)
                        
            let customizedNoticeEntitys = customizedNoticeResponse.responses.map { $0.customizedNoticeEntity }
            self.customizedNotices = customizedNoticeEntitys
        }
    }
    
    func fetchDummyNoticeList(_ index: Int) {
        var dummyData: Data? {
            switch index {
            case 0: return dummyNoticesData
            case 1: return dummyNoticesData1
            case 2: return dummyNoticesData2
            case 3: return dummyNoticesData3
            case 4: return dummyNoticesData4
            default: return nil
            }
        }
        guard let data = dummyData else { return }
        
        let noticeResponse = try! decoder.decode(NoticeResponse.self, from: data)
            let noticeEntitys = noticeResponse.response.map { $0.metadata }
        self.notices.value = noticeEntitys
    }
    
    func fetchDummyCustomizedNoticeList() {
        let customizedNoticeResponse = try! decoder.decode(CustomizedNoticeResponse.self, from: dummyCustomizedNoticesData)
        
        let customizedNoticeEntitys = customizedNoticeResponse.responses.map { $0.customizedNoticeEntity }
        self.customizedNotices = customizedNoticeEntitys
    }
    
}

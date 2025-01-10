import UIKit
import SnapKit
import Then
import WebKit
import Combine

protocol OnBoardingDelegate: AnyObject {
    func onBoardingDidFinish()
}

final class OnBoardingViewController: UIViewController, WKScriptMessageHandler {
    private var webView: WKWebView!
    private var progressView = UIProgressView(progressViewStyle: .default)
    private var cancellables = Set<AnyCancellable>() // Combine에서 취소를 관리하는 Set

    //let homeViewController = HomeViewController()
    
    weak var delegate: OnBoardingDelegate?
    
    var urlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupUI()
        setupCombineObservers()
        urlString = "https://6781a5e0c4a422854e287e1c--dapper-monstera-aabb21.netlify.app"
        loadURL()
    }

    // JavaScript에서 보내는 메시지 수신
    func userContentController(
        _ userContentController: WKUserContentController,
        didReceive message: WKScriptMessage
    ) {
        guard message.name == "keywordHandler", let body = message.body as? String else { return }
        print("Received event: \(body)")
        // body 데이터를 바탕으로 원하는 작업 수행
        
        let keywords = body.components(separatedBy: " ")
        AppState.shared.updateKeywords(keywords: keywords)
        
        webView.configuration.userContentController.removeScriptMessageHandler(forName: "keywordHandler")
        
        delegate?.onBoardingDidFinish()
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // 일이 주어지면 완수하기 위해 최선을 다하는 사람이구나 라는 걸 느꼈습니다.
    // 모든 기능을 완성하고 싶어 밤새 쉬지도 않고 코딩하는 스스로를 보며, 끈기는 있으나 몸을 혹사시키는 것 같단 생각이 함께 들었습니다.
    
    private func setupWebView() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "keywordHandler") // JavaScript 메시지를 받을 핸들러 등록
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        webView = WKWebView(frame: .zero, configuration: config)
        webView.navigationDelegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(webView)
        view.addSubview(progressView)

        // SnapKit 레이아웃
        progressView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }

        webView.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    private func loadURL() {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        webView.load(URLRequest(url: url))
    }

    private func setupCombineObservers() {
        // Combine을 통해 estimatedProgress를 관찰
        webView.publisher(for: \.estimatedProgress)
            .receive(on: DispatchQueue.main) // UI 업데이트는 메인 스레드에서 처리
            .sink { [weak self] progress in
                self?.progressView.progress = Float(progress)
            }
            .store(in: &cancellables)
    }

    deinit {
        print("WKWebViewController deinitialized")
        webView.configuration.userContentController.removeScriptMessageHandler(forName: "keywordHandler")
    }
}

// MARK: - WKNavigationDelegate
extension OnBoardingViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("웹 페이지 로드 실패: \(error.localizedDescription)")
    }
}


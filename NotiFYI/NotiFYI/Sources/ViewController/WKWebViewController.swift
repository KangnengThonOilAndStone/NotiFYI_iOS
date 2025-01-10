import UIKit
import WebKit
import Combine

final class WKWebViewController: UIViewController, WKScriptMessageHandler, UIGestureRecognizerDelegate {
    private var webView: WKWebView!
    private var progressView = UIProgressView(progressViewStyle: .default)
    private var cancellables = Set<AnyCancellable>() // Combine에서 취소를 관리하는 Set

    var urlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupUI()
        setupCombineObservers()
        loadURL()
    }

    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    // JavaScript에서 보내는 메시지 수신
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard message.name == "eventHandler", let body = message.body as? String else { return }
        print("Received event: \(body)")
        // body 데이터를 바탕으로 원하는 작업 수행
    }
    
    private func setupWebView() {
        let contentController = WKUserContentController()
        contentController.add(self, name: "eventHandler") // JavaScript 메시지를 받을 핸들러 등록
        
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
        //webView.configuration.userContentController.removeScriptMessageHandler(forName: "eventHandler")
    }
}

// MARK: - WKNavigationDelegate
extension WKWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("웹 페이지 로드 실패: \(error.localizedDescription)")
    }
}

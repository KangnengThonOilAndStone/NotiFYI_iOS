import Foundation

let dummyJson = """
[
    {
        "title": "선배업고, 취업잡고! 참여자 모집!",
        "target": "강남대학교 재학생 및 졸업생 (각 직무별 8명 선착순)",
        "application": "2025.01.08(수)~2025.01.16(목)",
        "summary": "졸업생 멘토링 프로그램 참여자를 모집합니다.",
        "content": "강남대학교에서 진행하는 '선배업고, 취업잡고!' 프로그램 참여자를 모집합니다. 모집 기간은 2025년 1월 8일부터 1월 16일까지입니다. 모집 직무는 영업관리, SW개발, 마케팅, 재무회계, 반도체로 각각 8명을 선착순으로 모집하며, 참여자는 온라인 및 오프라인 활동에 필수로 참여해야 합니다. 과제 수행 우수자를 대상으로 각 직무별 2명을 선정하여 발표 후 15만 원의 시상금을 지급합니다. 신청은 네이버폼을 통해 가능합니다.",
        "contact": "강남대학교 대학일자리플러스센터 (031-280-3433)",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=946acb233372946a1326dc9186f08109"
    },
    {
        "title": "취업준비의 기초 경험사전 만들기 참여자 모집 안내",
        "target": "강남대학교 재학생 및 졸업생 누구나 가능",
        "application": "2025년 1월 17일까지",
        "summary": "취업준비를 위한 경험사전 정리 프로그램 참여자 모집",
        "content": "강남대학교에서는 재학생 및 졸업생을 대상으로 취업준비를 위한 경험사전 만들기 프로그램을 진행합니다. 프로그램은 2025년 1월 21일 화요일 10시부터 12시까지 비대면으로 Zoom을 통해 진행되며, 중점 활동으로는 대학생활 경험 정리, 지원 직무에 필요한 역량 분석, 자기소개서 및 면접 준비 자료 작성을 포함합니다. 신청은 1월 17일까지 가능합니다.",
        "contact": "강남대학교 일자리플러스센터, 이메일 및 연락처는 추가 제공되지 않음",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=b748812b99f8b2c509b65befc5ceefaf"
    },
    {
        "title": "CST성격강점검사를 활용한 진로탐색 참여자 모집 안내",
        "target": "강남대학교 재학생 및 졸업생 등 누구나",
        "application": "2025.01.07 ~ 01.14",
        "summary": "CST성격강점검사를 통한 진로탐색 프로그램 참여자를 모집합니다.",
        "content": "강남대학교에서 CST성격강점검사를 활용한 진로탐색 프로그램을 운영합니다. 참여자는 자아 탐색을 통해 자신의 성격 강점을 이해하고, 향후 직업 선택에 도움을 받을 수 있습니다. 프로그램은 2025년 1월 20일 월요일 10:00부터 12:00까지 온라인으로 진행됩니다. 참여신청은 2025년 1월 7일부터 1월 14일까지 가능하며, 누구나 신청할 수 있습니다.",
        "contact": "대한일자리플러스센터, 강남대학교",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=f0d8ad04ba0354194e74398c1cd0ebe1"
    },
    {
        "title": "NCS 합격 단기 완성반 모집!! 특강",
        "target": "총 20명",
        "application": "2025.12.16(월)~12.26(목)",
        "summary": "NCS 합격을 위한 단기 완성반 교육과정 모집 안내",
        "content": "2025년 1월 6일부터 10일까지 NCS 합격 단기 완성반이 운영됩니다. 교육은 샬롬관 204호에서 이루어지며, 모집인원은 총 20명입니다. 교육 방식은 대면 특강 5일과 사후관리(온라인강의 및 모의시험 제공)으로 구성됩니다. 신청은 참여재시스템 내 비교과프로그램을 통해 가능하고, 모집기간은 2025년 12월 16일부터 26일까지입니다. 추가로, 사전 온라인 모의시험과 공기업 NCS 출제경향 및 대비전략 교육도 제공됩니다.",
        "contact": "대학일자리플러스센터 카톡채널 / 031-280-3432",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=4421be95cd22126b36154e4557a2f62b"
    },
    {
        "title": "GSAT & NCS 합격 단기 완성반 (운영시간 수정)",
        "target": "GSAT반: 지원자격 없음, NCS반: 지원자격 없음, 총 40명 (각 반 20명씩)",
        "application": "GSAT반: 2024.11.29~12.05, NCS반: 2024.12.16~12.26",
        "summary": "GSAT 및 NCS 준비를 위한 단기 완성반 운영 안내",
        "content": "2024년 12월 16일부터 20일까지 GSAT반, 2025년 1월 6일부터 10일까지 NCS반을 위한 단기 완성반이 운영됩니다. 각 반별로 20명씩 총 40명을 모집하며, 대면 특강과 사전 모의고사가 포함되어 있습니다. 신청은 참여재신청 시스템을 통해 가능합니다. GSAT반 신청기간은 11월 29일부터 12월 5일이며, NCS반은 12월 16일부터 26일입니다. 자세한 안내는 문의처로 확인 바랍니다.",
        "contact": "문의처: 대학일자리플러스센터, 전화번호: 031-280-3432",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=19fd3f2e63fc41e5826a2e5317b06969"
    },
    {
        "title": "2024학년도 KNU 커리어 로드맵(포트폴리오) 경진대회 선발자 안내",
        "target": "KNU 재학생",
        "application": "2023년 1월 1일부터 2023년 12월 31일까지",
        "summary": "KNU 커리어 로드맵 경진대회에서 25명의 수상자를 선정하여 장학금을 지급합니다.",
        "content": "KNU 커리어 로드맵 경진대회에 참여해주신 모든 분들께 감사드립니다. 총 50명의 신청자 중 25명이 심사를 통해 수상자로 선정되었습니다. 수상자는 최우수, 우수, 장려상을 수상하며, 각각의 장학금이 지급될 예정입니다. 다시 한 번 참여 및 성원을 보내주신 모든 분들께 감사의 말씀을 전합니다.",
        "contact": "강남대학교 대학일자리플러스센터, 연락처: 031-1234-5678, 이메일: career@knu.ac.kr",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=16333b84d1ba3f916010e5bc221069e7"
    },
    {
        "title": "2025학년도 첨단산업 아카데미 학습근로자 추가모집 안내",
        "target": "ICT 관련 전공 학생(소프트웨어/가상현실/인공지능/데이터사이언스전공)",
        "application": "2024년 11월 28일 ~ 2025년 01월 13일, 접수처: 첨단산업아카데미 운영센터 (hera25@kangnam.ac.kr)",
        "summary": "2025학년도 일학습병행제 첨단산업 아카데미 학습근로자를 모집합니다.",
        "content": "2025학년도 일학습병행제 첨단산업 아카데미에서 ICT 전공 학생을 추가 모집합니다. 참여자는 기업 맞춤형 실무 교육을 받고, 인턴십을 통해 실제 기업에서 경험을 쌓습니다. 4-1학기 장학금과 함께, 특별한 실습실에서 교육받고 마이크로전공을 부여받게 됩니다. 모집기간은 2024년 11월 28일부터 2025년 01월 13일이며, 지원자는 신청서와 성적증명서를 제출해야 합니다.",
        "contact": "첨단산업아카데미 운영센터, 전화: 031-899-7090, 이메일: hera25@kangnam.ac.kr, 총괄책임자: 강현우, 전화: 010-6224-3842",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=2ad9554b3cd01d498e496574e858cbc2"
    },
    {
        "title": "2024 동계방학 현장실습학기제 학생 모집",
        "target": "졸업예정자 및 연계취업을 고려한 학생",
        "application": "2024.11.18.(월) ~ 2024.11.29.(금)",
        "summary": "2024 동계방학 현장실습학기제 학생을 모집합니다.",
        "content": "2024 동계방학 현장실습학기제에 참여할 학생을 모집합니다. 지원자는 졸업예정자 및 연계취업을 고려하는 학생이며, 모집 일정은 2024년 11월 18일부터 11월 29일까지입니다. 자세한 내용은 학교의 현장실습지원센터를 통해 확인할 수 있습니다.",
        "contact": "문의처: 현장실습지원센터, 전화번호: 031-280-3139, 이메일: 없음",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=3df9ca5d4971f9c7c552e794809fc01a"
    },
    {
        "title": "점프업 프로젝트 수당 신청 방법 안내",
        "target": "본교 재학생 중 점프업 프로젝트 참여자 및 IAP 이행 완료자",
        "application": "신청 마감일: 매월 5일, 15일 (공휴일 전일 마감); 신청 장소: 강남대학교 인문사회관 1층 학생성공센터 102호, 운영시간: 평일 9:00~17:30",
        "summary": "점프업 프로젝트 수당 신청을 위한 세부 방법과 주의사항에 대한 안내입니다.",
        "content": "이번 점프업 프로젝트 수당 신청은 본교 재학생 중 IAP 이행을 완료한 참여자에 한해 가능합니다. 신청은 강남대학교 인문사회관 1층 대학일자리플러스센터를 직접 방문해야 하며, 온라인 신청은 불가능합니다. 모든 서류는 마감일 기준 20일 이내에 지급되며, 신청 시 신분증과 통장 사본, 개인정보 동의서 등을 제출해야 합니다. 특히, 여름방학기간에는 온라인 신청이 종료되어 주의해야 합니다.",
        "contact": "문의처: 대학일자리플러스센터, 강남대학교 인문사회관 1층, 전화번호: [상세 연락처 없음]",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=c104ee262cb8c8260938bee0be347c00"
    },
    {
        "title": "재학생 맞춤형 고용서비스사업",
        "target": "대학 재학생",
        "application": "상시 접수(상담 후 신청)",
        "summary": "대학생을 위한 맞춤형 고용 서비스 제공 안내입니다.",
        "content": "강남대학교 대학일자리플러스센터는 재학생들을 위해 1:1 상담과 직업 탐색, 취업 활동 지원을 포함한 맞춤형 고용서비스를 제공합니다. 신청은 상시 가능하며, 상담 후 구체적인 직업 포트폴리오 설정 및 취업 목표 설정을 도와드립니다. 이러한 프로그램은 재학 중의 직업 탐색부터 취업 성공까지의 과정을 지원합니다.",
        "contact": "전화: 031-280-3431~4, 3557, 3430 / 카톡 채널: https://pf.kakao.com/_IzWdxj",
        "category": "취창업",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=44d5b5475e42a8519613512575bf7007"
    }
]
""".data(using: .utf8)!

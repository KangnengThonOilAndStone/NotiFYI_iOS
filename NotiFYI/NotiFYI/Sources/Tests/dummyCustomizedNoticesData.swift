import Foundation

let dummyCustomizedNoticesData = """
{
    "status": "success",
    "results": [
        {
            "metadata": {
                "category": "장학",
                "title": "2024학년도 하반기 우원기념사업회 장학사업 및 우원사상 콘텐츠 공모전 안내",
                "target": "강남대학교 학부에 재학 중인 자, 봉사정신이 투철한 자, 기독교 신앙인",
                "application": "2024.12.04 (수) 16:00",
                "summary": "강남대학교 재학생을 위한 우원기념사업회 장학금 및 콘텐츠 공모전 안내입니다.",
                "contact": "우원기념사업회 (우201), 곽형신 간사, 전화: 031-282-7166, 이메일: woowonmf@gmail.com",
                "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=946acb233372946a1326dc9186f08109"
            },
            "distance": 0.39131486415863037
        },
        {
            "metadata": {
                "category": "학습/상담",
                "title": "2024-2 겨울방학 일본어 스터디팀 모집(간바레)",
                "target": "일본취업 희망자, 2025년 4학년 학생, K-MOVE 12기 예비 연수생",
                "application": "모집기한: 2024.12.27",
                "summary": "2024 겨울방학 동안 일본어 스터디팀을 모집합니다.",
                "contact": "이정연 교수 | bijou1224@hanmail.net",
                "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=946acb233372946a1326dc9186f08109"
            },
            "distance": 0.3968542218208313
        },
        {
            "metadata": {
                "category": "학사",
                "title": "기상 악화(폭설)에 따른 금일(11월 28일) 전임교원 초빙 방문접수 중단 안내",
                "target": "전임교원 초빙 지원자",
                "application": "접수 중단 (11월 28일)",
                "summary": "폭설로 인해 11월 28일 전임교원 초빙 방문접수가 중단됨.",
                "contact": "강남대학교 인사처, 전화문의 및 이메일 여부는 명시되지 않음",
                "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=946acb233372946a1326dc9186f08109"
            },
            "distance": 0.40070316195487976
        },
        {
            "metadata": {
                "category": "학습/상담",
                "title": "2024-1학기 또래상담 내담자 모집",
                "target": "사이즈: 본교 재학생, 대인관계 및 심리적 어려움을 나누고 싶은 학생",
                "application": "구체적 모집기간은 명시되어 있지 않으나, 신청 링크에서 신청 가능",
                "summary": "2024-1학기 또래상담 내담자를 모집합니다.",
                "contact": "문의처: 031-899-7202",
                "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=946acb233372946a1326dc9186f08109"
            },
            "distance": 0.42984727025032043
        },
        {
            "metadata": {
                "category": "학습/상담",
                "title": "건강한 관계 맺기",
                "target": "3, 4학년 재학생",
                "application": "2024.09.30 - 10.11",
                "summary": "건강한 관계를 맺기 위한 특강 교육 안내입니다.",
                "contact": "문의처: 마음나눔센터, 이메일: info@mindcenter.kr, 전화번호: 02-1234-5678",
                "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=946acb233372946a1326dc9186f08109"
            },
            "distance": 0.4149004817008972
        },
        {
            "metadata": {
                "category": "장학",
                "title": "2024학년도 대학생 청소년교육지원장학금 멘토 모집 안내",
                "target": "대학생, 특수교육학 관련 전공자, 청소년교육에 관심 있는 자",
                "application": "2024학년도, 세부 일정은 공지 예정",
                "summary": "2024학년도 대학생 청소년교육지원장학금 멘토를 모집합니다.",
                "contact": "박승호(구성초등학교) 010-3716-2953, 수원매화초등학교 010-2517-4402, 구립공릉행복지역아동센터 010-2382-2713, 용인시 다함께돌봄센터 031-262-2515, 031-335-2518, 031-284-2514",
                "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=ea2c9f2a785ae43e520c322896013dfe&encMenuBoardSeq=946acb233372946a1326dc9186f08109"
            },
            "distance": 0.43035292625427246
        }
    ]
}
""".data(using: .utf8)!

import Foundation

let dummyNoticesData = """
{
  "response": "다음 두 가지 게시물이 장학금에 관한 내용을 담고 있습니다. [장학제도 활성화를 위한「장학금 FAQ」시행 안내](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067)   - 장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.. [2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c)   - 2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
  "faiss_results": [
    {
      "id": "85582ada-bf06-4aa3-a9a8-2869f6f93858",
      "metadata": {
        "category": "전체",
        "title": "장학제도 활성화를 위한「장학금 FAQ」시행 안내",
        "target": "교내장학금 지원자: 성적우수, 동문자격, 장애학생, 목회자 자녀; 교외장학금 지원자: 국가 I/II, 보훈, 다문화가정, 학자금대출제한",
        "application": "확정된 모집기간 없음, FAQ는 상시 운영",
        "summary": "장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.",
        "contact": "장학복지팀 | 전화: 031-280-3553",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067"
      },
      "page_content": "장학복지팀에서는 장학제도의 효율성 향상과 안정화된 시스템 구축을 위한 장학금 FAQ를 실시합니다. FAQ에는 교내외 및 기타 장학금에 대한 지원 기준과 절차가 포함됩니다. 이를 통해 장학금 지급률을 개선하고, 학생들이 더 나은 정보를 받을 수 있도록 노력할 것입니다.",
      "type": "Document"
    },
    {
      "id": "dbef0b85-f9ca-4f21-80fc-330bca9068ed",
      "metadata": {
        "category": "전체",
        "title": "2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)",
        "target": "공로장학생, 한국 학부생",
        "application": "2024-12-30까지",
        "summary": "2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
        "contact": "장학복지팀, 전화: 000-0000, 이메일: scholarship@email.com",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c"
      },
      "page_content": "2024-2학기 공로장학생 선발 및 장학금 지급 안내로, 각종 공모전에 참가한 우수한 성적을 가진 학생들을 대상으로 공로장학금을 지급합니다. 지원자격은 재학생이며, 장학금은 2024-12-30까지 신청할 수 있습니다. 선발된 학생은 개인별 통장 정보 입력이 필요하며, 자세한 사항은 통합정보시스템에서 확인 가능합니다.",
      "type": "Document"
    }
  ],
  "recommended_posts": []
}
""".data(using: .utf8)!

let dummyNoticesData1 = """
{
  "response": "다음 두 가지 게시물이 장학금에 관한 내용을 담고 있습니다. [장학제도 활성화를 위한「장학금 FAQ」시행 안내](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067)   - 장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.. [2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c)   - 2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
  "faiss_results": [
    {
      "id": "85582ada-bf06-4aa3-a9a8-2869f6f93858",
      "metadata": {
        "category": "학사",
        "title": "장학제도 활성화를 위한「장학금 FAQ」시행 안내",
        "target": "교내장학금 지원자: 성적우수, 동문자격, 장애학생, 목회자 자녀; 교외장학금 지원자: 국가 I/II, 보훈, 다문화가정, 학자금대출제한",
        "application": "확정된 모집기간 없음, FAQ는 상시 운영",
        "summary": "장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.",
        "contact": "장학복지팀 | 전화: 031-280-3553",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067"
      },
      "page_content": "장학복지팀에서는 장학제도의 효율성 향상과 안정화된 시스템 구축을 위한 장학금 FAQ를 실시합니다. FAQ에는 교내외 및 기타 장학금에 대한 지원 기준과 절차가 포함됩니다. 이를 통해 장학금 지급률을 개선하고, 학생들이 더 나은 정보를 받을 수 있도록 노력할 것입니다.",
      "type": "Document"
    },
    {
      "id": "dbef0b85-f9ca-4f21-80fc-330bca9068ed",
      "metadata": {
        "category": "학사",
        "title": "2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)",
        "target": "공로장학생, 한국 학부생",
        "application": "2024-12-30까지",
        "summary": "2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
        "contact": "장학복지팀, 전화: 000-0000, 이메일: scholarship@email.com",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c"
      },
      "page_content": "2024-2학기 공로장학생 선발 및 장학금 지급 안내로, 각종 공모전에 참가한 우수한 성적을 가진 학생들을 대상으로 공로장학금을 지급합니다. 지원자격은 재학생이며, 장학금은 2024-12-30까지 신청할 수 있습니다. 선발된 학생은 개인별 통장 정보 입력이 필요하며, 자세한 사항은 통합정보시스템에서 확인 가능합니다.",
      "type": "Document"
    }
  ],
  "recommended_posts": []
}
""".data(using: .utf8)!

let dummyNoticesData2 = """
{
  "response": "다음 두 가지 게시물이 장학금에 관한 내용을 담고 있습니다. [장학제도 활성화를 위한「장학금 FAQ」시행 안내](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067)   - 장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.. [2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c)   - 2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
  "faiss_results": [
    {
      "id": "85582ada-bf06-4aa3-a9a8-2869f6f93858",
      "metadata": {
        "category": "장학",
        "title": "장학제도 활성화를 위한「장학금 FAQ」시행 안내",
        "target": "교내장학금 지원자: 성적우수, 동문자격, 장애학생, 목회자 자녀; 교외장학금 지원자: 국가 I/II, 보훈, 다문화가정, 학자금대출제한",
        "application": "확정된 모집기간 없음, FAQ는 상시 운영",
        "summary": "장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.",
        "contact": "장학복지팀 | 전화: 031-280-3553",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067"
      },
      "page_content": "장학복지팀에서는 장학제도의 효율성 향상과 안정화된 시스템 구축을 위한 장학금 FAQ를 실시합니다. FAQ에는 교내외 및 기타 장학금에 대한 지원 기준과 절차가 포함됩니다. 이를 통해 장학금 지급률을 개선하고, 학생들이 더 나은 정보를 받을 수 있도록 노력할 것입니다.",
      "type": "Document"
    },
    {
      "id": "dbef0b85-f9ca-4f21-80fc-330bca9068ed",
      "metadata": {
        "category": "장학",
        "title": "2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)",
        "target": "공로장학생, 한국 학부생",
        "application": "2024-12-30까지",
        "summary": "2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
        "contact": "장학복지팀, 전화: 000-0000, 이메일: scholarship@email.com",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c"
      },
      "page_content": "2024-2학기 공로장학생 선발 및 장학금 지급 안내로, 각종 공모전에 참가한 우수한 성적을 가진 학생들을 대상으로 공로장학금을 지급합니다. 지원자격은 재학생이며, 장학금은 2024-12-30까지 신청할 수 있습니다. 선발된 학생은 개인별 통장 정보 입력이 필요하며, 자세한 사항은 통합정보시스템에서 확인 가능합니다.",
      "type": "Document"
    }
  ],
  "recommended_posts": []
}
""".data(using: .utf8)!

let dummyNoticesData3 = """
{
  "response": "다음 두 가지 게시물이 장학금에 관한 내용을 담고 있습니다. [장학제도 활성화를 위한「장학금 FAQ」시행 안내](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067)   - 장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.. [2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c)   - 2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
  "faiss_results": [
    {
      "id": "85582ada-bf06-4aa3-a9a8-2869f6f93858",
      "metadata": {
        "category": "학습/상담",
        "title": "장학제도 활성화를 위한「장학금 FAQ」시행 안내",
        "target": "교내장학금 지원자: 성적우수, 동문자격, 장애학생, 목회자 자녀; 교외장학금 지원자: 국가 I/II, 보훈, 다문화가정, 학자금대출제한",
        "application": "확정된 모집기간 없음, FAQ는 상시 운영",
        "summary": "장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.",
        "contact": "장학복지팀 | 전화: 031-280-3553",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067"
      },
      "page_content": "장학복지팀에서는 장학제도의 효율성 향상과 안정화된 시스템 구축을 위한 장학금 FAQ를 실시합니다. FAQ에는 교내외 및 기타 장학금에 대한 지원 기준과 절차가 포함됩니다. 이를 통해 장학금 지급률을 개선하고, 학생들이 더 나은 정보를 받을 수 있도록 노력할 것입니다.",
      "type": "Document"
    },
    {
      "id": "dbef0b85-f9ca-4f21-80fc-330bca9068ed",
      "metadata": {
        "category": "학습/상담",
        "title": "2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)",
        "target": "공로장학생, 한국 학부생",
        "application": "2024-12-30까지",
        "summary": "2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
        "contact": "장학복지팀, 전화: 000-0000, 이메일: scholarship@email.com",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c"
      },
      "page_content": "2024-2학기 공로장학생 선발 및 장학금 지급 안내로, 각종 공모전에 참가한 우수한 성적을 가진 학생들을 대상으로 공로장학금을 지급합니다. 지원자격은 재학생이며, 장학금은 2024-12-30까지 신청할 수 있습니다. 선발된 학생은 개인별 통장 정보 입력이 필요하며, 자세한 사항은 통합정보시스템에서 확인 가능합니다.",
      "type": "Document"
    }
  ],
  "recommended_posts": []
}
""".data(using: .utf8)!

let dummyNoticesData4 = """
{
  "response": "다음 두 가지 게시물이 장학금에 관한 내용을 담고 있습니다. [장학제도 활성화를 위한「장학금 FAQ」시행 안내](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067)   - 장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.. [2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)](https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c)   - 2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
  "faiss_results": [
    {
      "id": "85582ada-bf06-4aa3-a9a8-2869f6f93858",
      "metadata": {
        "category": "취창업",
        "title": "장학제도 활성화를 위한「장학금 FAQ」시행 안내",
        "target": "교내장학금 지원자: 성적우수, 동문자격, 장애학생, 목회자 자녀; 교외장학금 지원자: 국가 I/II, 보훈, 다문화가정, 학자금대출제한",
        "application": "확정된 모집기간 없음, FAQ는 상시 운영",
        "summary": "장학금에 대한 자주 묻는 질문을 통해 학생들에게 보다 나은 지원을 제공하기 위한 안내입니다.",
        "contact": "장학복지팀 | 전화: 031-280-3553",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=be219e8e8c708f75cd6d53afae5a3067"
      },
      "page_content": "장학복지팀에서는 장학제도의 효율성 향상과 안정화된 시스템 구축을 위한 장학금 FAQ를 실시합니다. FAQ에는 교내외 및 기타 장학금에 대한 지원 기준과 절차가 포함됩니다. 이를 통해 장학금 지급률을 개선하고, 학생들이 더 나은 정보를 받을 수 있도록 노력할 것입니다.",
      "type": "Document"
    },
    {
      "id": "dbef0b85-f9ca-4f21-80fc-330bca9068ed",
      "metadata": {
        "category": "취창업",
        "title": "2024-2학기 공로장학생 선발 및 장학금 지급 안내 (5차)",
        "target": "공로장학생, 한국 학부생",
        "application": "2024-12-30까지",
        "summary": "2024-2학기 공로장학생 선발 공지가 포함된 안내문입니다.",
        "contact": "장학복지팀, 전화: 000-0000, 이메일: scholarship@email.com",
        "url": "https://web.kangnam.ac.kr/menu/board/info/f19069e6134f8f8aa7f689a4a675e66f.do?scrtWrtiYn=false&encMenuSeq=41c4ba211ab06cbc003455e07441b4f8&encMenuBoardSeq=457d8193839f27ba1f56f3dc48304d5c"
      },
      "page_content": "2024-2학기 공로장학생 선발 및 장학금 지급 안내로, 각종 공모전에 참가한 우수한 성적을 가진 학생들을 대상으로 공로장학금을 지급합니다. 지원자격은 재학생이며, 장학금은 2024-12-30까지 신청할 수 있습니다. 선발된 학생은 개인별 통장 정보 입력이 필요하며, 자세한 사항은 통합정보시스템에서 확인 가능합니다.",
      "type": "Document"
    }
  ],
  "recommended_posts": []
}
""".data(using: .utf8)!

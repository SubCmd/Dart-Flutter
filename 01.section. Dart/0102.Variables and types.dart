// 예시 1: 키워드별 적절한 선택

void main() {
  // 1) 앱 전체에서 고정인 값 → const
  const int maxDailyReview = 50;
  const String appName = 'AnkiPro';
  const double defaultEaseFactor = 2.5;

  // 2) 한 번 정해지면 안 바뀌지만, 런타임에 결정 → final
  final DateTime appLaunchedAt = DateTime.now();
  final List<String> defaultTags = ['englsih', 'beginner'];

  // 3) 변경 가능한 상태 → var (타입 명시 가능)
  var reviewCount = 0;
  String currentDeck = '영단어 Day 1';
  bool isLearning = false;

  // 사용
  reviewCount++;
  reviewCount++;                  // ✅
  currentDeck = '영단어 Day 2';   // ✅
  // maxDailyReview = 100;        // ❌ const는 재할당 불가
  // appLaunchedAt = DateTime.now();  // ❌ final도 재할당 불가

  print('$appName - 오늘 학습: $reviewCount/$maxDailyReview');
}

/*
* AnkiPro - 오늘 학습: 2/50
*/


// ===========================================================================================
// 예시 2: 첫 변수 사용


// ===========================================================================================
// 예시 3: 함수 호출


// ===========================================================================================
// 예시 4. 주석 작성법






// ===========================================================================================
// Lv.1 (기본 문법)



// ===========================================================================================
// 문제 2: square 함수를 작성해 5의 제곱을 출력하시오.


// ===========================================================================================
// Lv.2 (응용)

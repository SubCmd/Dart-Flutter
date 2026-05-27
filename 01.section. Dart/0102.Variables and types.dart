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
// 예시 2: 타입 추론의 함정

void main() {
  var nums = [1, 2, 3];           // List<int>로 추론
  // nums.add('hello');           // ❌ 컴파일 에러: int만 들어갈 수 있음

  // 빈 리스트의 경우 타입을 명시해야 함
  var empty1 = [];                // List<dynamic> (위험!)
  List<int> empty2 = [];          // ✅ 명확
  var empty3 = <int>[];           // ✅ 명확

  empty1.add('anything');         // OK (dynamic이라 가능)
  empty2.add(1);                  // OK
  // empty2.add('hi');            // ❌
}


// ===========================================================================================
// 예시 3: 형 변환 패턴

void main() {
  // 1) 사용자 입력 (항상 String) → 숫자 변환
  String userInput = '7';
  int reviewCount = int.parse(userInput);
  print(reviewCount + 1);                // 8

  // 2) 안전한 파싱 (실패 가능성 있을 때)
  String maybeNumber = 'abc';
  int? parsed = int.tryParse(maybeNumber);   // null 반환
  print(parsed ?? 0);                          // 0 (기본값)

  // 3) 정답률 → 백분율 문자열
  double accuracy = 0.857;
  String pct = '${(accuracy * 100).toStringAsFixed(1)}%';
  print(pct);                            // 85.7%

  // 4) 시간을 분으로 변환
  int totalSeconds = 1845;
  int minutes = totalSeconds ~/ 60;      // 정수 나눗셈
  int seconds = totalSeconds % 60;
  print('$minutes분 $seconds초');         // 30분 45초
}

/*
8
0
85.7%
30분 45초
*/


// ===========================================================================================
// 예시 4. 문자열 활용

void main() {
    // Anki 카드 정보를 문자열로 포매팅
    final word = 'perseverance';
    final meaning = '인내, 끈기';
    final reviewCount = 7;
    final accuracy = 0.857;

    // 멀티라인 + 보간 + 표현식
    final cardInfo = '''
    ┌─────────────────────────────┐
    │ 단어: $word
    │ 뜻:   $meaning
    │ 복습: $reviewCount회
    │ 정답률: ${(accuracy * 100).toStringAsFixed(1)}%
    └─────────────────────────────┘
    ''';
    print(cardInfo);

    // 문자열 메서드
    print(word.length);              // 12
    print(word.toUpperCase());       // PERSEVERANCE
    print(word.contains('vere'));    // true
    print(word.startsWith('per'));   // true
    print(word.split('e'));          // [p, rs, v, ranc, ]
    print(word.replaceAll('e', 'E')); // pErsEvErancE
}

/*
    ┌─────────────────────────────┐
    │ 단어: perseverance
    │ 뜻:   인내, 끈기
    │ 복습: 7회
    │ 정답률: 85.7%
    └─────────────────────────────┘

12
PERSEVERANCE
false
true
[p, rs, v, ranc, ]
pErsEvErancE
*/


// ===========================================================================================
// Lv.1 (기본 문법)
// 문제 1: 다음 변수를 적절한 키워드와 타입으로 선언하시오.
// 사용자의 닉네임 (변경 가능, 문자열)
// 앱의 버전 '1.0.0' (앱 전체 고정)
// 사용자 가입일 (런타임에 결정, 변경 불가)
// 현재까지 학습한 카드 수 0 (학습 진행에 따라 증가)

void main() {
    String nickname = 'Ted';
    const String appVersion = '1.0.0';
    final DateTime joinedAt = DateTime.now();
    int studiedCount = 0;

    // 변경 가능 확인
    nickname = 'Julia';
    studiedCount++;

    print('$nickname (가입: $joinedAt, 학습: $studiedCount장)');
}

// Julia (가입: 2026-05-27 15:33:05.839296, 학습: 1장)


// ===========================================================================================
// 문제 2: '42', '3.14', 'abc'를 각각 숫자로 변환 시도해 결과를 출력하시오. 
// (tryParse 사용)

void main() {
    int? a = int.tryParse(('42'));          // 42
    double? b = double.tryParse('3.14');    // 3.14
    int? c = int.tryParse('abc');           // null

    print(a);
    print(b);
    print(c);

    // nul일 때 기본값
    print(c ?? 0);
}

/*
42
3.14
null
0
*/


// ===========================================================================================
// 문제 3: 정답률 0.7234를 백분율 문자열 '72.3%'로 변환하시오.
// (toStringAsFixed 사용)

void main() {
    double accuracy = 0.7234;
    String formatted = '${(accuracy * 100).toStringAsFixed(1)}%';
    // toStringAsFixed : 실수 타입 숫자를 지정된 소수점 자리수까지 반올림
    print(formatted);   // 72.3%
}
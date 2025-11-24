<div align="center">
  <!-- <img src="https://audion.magovoice.com/static/media/logo.10d2cf1b78c4088112afa09c702c5c2d.svg" width="200">
  <h1>Audion Python SDK</h1> -->

  <p>
    <strong>음성 AI 구현의 복잡함을 없애고, 비즈니스 가능성을 확장하세요.</strong>
  </p>

  <p>
    <a href="https://github.com/magovoice/audion-python-sdk/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License"></a>
    <a href="https://python.org"><img src="https://img.shields.io/badge/python-3.10+-blue.svg" alt="Python version"></a>
  </p>
</div>

# Audion Python SDK

> Repository: https://github.com/holamago/audion-python-sdk

## 목차

- [특징](#특징)
- [요구사항](#요구사항)
- [설치](#설치)
- [빠른 시작](#빠른-시작)
- [API 문서](#api-문서)
- [사용 예제](#-사용-예제)
- [지원 파일 형식](#-지원-파일-형식)
- [프로젝트 구조](#-프로젝트-구조)
- [문서](#-문서)
- [라이선스](#-라이선스)
- [지원](#-지원)
- [버전 히스토리](#-버전-히스토리)

## 특징

- **간편한 음성 AI 통합**: 몇 줄의 코드로 강력한 음성 AI 기능을 애플리케이션에 추가
- **다양한 입력 지원**: 로컬 파일 및 URL을 통한 음성/비디오 처리
- **광범위한 파일 형식**: 주요 오디오 및 비디오 형식 지원
- **유연한 Flow 시스템**: 다양한 음성 AI 워크플로우 지원
- **간단한 API**: 직관적이고 사용하기 쉬운 Python 인터페이스

## 요구사항

- Python 3.10+
- API 키 ([Audion 서비스 등록](https://audion.magovoice.com/signup) 필요)
  - 회원가입 후 API Key 발급 받아야 합니다.

## 설치

pip을 사용하여 설치 (PyPI 패키지 이름: `audionlib`):

```bash
pip install audionlib
```

또는 requirements.txt에서 의존성과 함께 설치:

```bash
git clone https://github.com/holamago/audion-python-sdk.git
cd audion-python-sdk
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

의존성:

- `pydantic`: 데이터 유효성 검사 및 설정 관리
- `requests`: HTTP 요청 처리

### 스크립트를 이용한 개발 환경 설정

저장소를 클론한 경우, 제공된 스크립트로 쉽게 환경을 설정할 수 있습니다:

```bash
# 가상환경 생성, 의존성 설치 및 자동 활성화
./scripts/setup.sh
```

스크립트가 완료되면 가상환경이 자동으로 활성화된 새 셸이 시작됩니다.

환경 정리가 필요한 경우:

```bash
# 캐시 및 빌드 파일 정리
./scripts/clean.sh
```

## 빠른 시작

### 1. 클라이언트 초기화

```python
from audion import AudionClient

# API 키로 클라이언트 초기화
client = AudionClient(api_key="your-api-key-here")
```

### 2. 로컬 파일 처리

- 오디오/비디오 업로드

```python
# 로컬 오디오/비디오 파일 처리
result = client.flow(
    flow="audion_vu",
    input_type="file",
    input="path/to/your/audio.wav"
)
print(result)
```

### 3. URL 처리

```python
# YouTube URL 처리
result = client.flow(
    flow="audion_vu",
    input_type="url",
    input="<https://youtu.be/your-video-id>"
)
print(result)
```

## API 문서

### AudionClient

Audion 서비스의 메인 클라이언트 클래스입니다.

#### 초기화

```python
AudionClient(
    api_key: str,           # 필수: API 인증 키
    base_url: str = None,   # 선택: 서버 기본 URL
    timeout: float = 300    # 선택: 요청 타임아웃 (초)
)
```

**매개변수:**

- `api_key` (str, 필수): Audion 서비스 인증을 위한 API 키
- `base_url` (str, 선택): 서버의 기본 URL. 기본값은 프로덕션 서버
- `timeout` (float, 선택): HTTP 요청 타임아웃. 기본값은 300초

**예외:**

- `ValueError`: api_key가 제공되지 않은 경우

#### 메서드

##### `flow(flow, input_type, input)`

지정된 플로우로 음성/비디오 처리를 실행합니다.

```python
client.flow(
    flow: str,        # 실행할 플로우 이름
    input_type: str,  # 입력 타입: "file" 또는 "url"
    input: str        # 파일 경로 또는 URL
)
```

**매개변수:**

- `flow` (str): 실행할 플로우의 이름
  - 현재 지원하는 플로우:
    - `audion_vu`: Voice Understanding
    - `audion_vh`: Voice Highlight
  - Custom Flow 지원 가능 (email:contact@holamago.com)
- `input_type` (str): 입력 타입. `"file"` 또는 `"url"`
- `input` (str): 처리할 파일의 경로 또는 URL

**반환값:**

- `dict`: 처리 결과를 포함하는 JSON 응답

**예외:**

- `ValueError`: 지원하지 않는 input_type인 경우
- `Exception`: API 호출 실패 시

## 지원 파일 형식

### 오디오 형식

- `.wav` - WAV (Waveform Audio File Format)
- `.mp3` - MP3 (MPEG-1 Audio Layer III)
- `.m4a` - M4A (MPEG-4 Audio)
- `.ogg` - OGG (Ogg Vorbis)
- `.flac` - FLAC (Free Lossless Audio Codec)
- `.aac` - AAC (Advanced Audio Coding)
- `.wma` - WMA (Windows Media Audio)
- `.m4b`, `.m4p`, `.m4r`, `.m4v` - 기타 MPEG-4 오디오 형식

### 비디오 형식

- `.mp4` - MP4 (MPEG-4 Part 14)
- `.mov` - MOV (QuickTime File Format)
- `.avi` - AVI (Audio Video Interleave)
- `.mkv` - MKV (Matroska Video)
- `.webm` - WebM
- `.wmv` - WMV (Windows Media Video)
- `.flv` - FLV (Flash Video)
- `.mpeg`, `.mpg` - MPEG (Moving Picture Experts Group)

## 사용 예제

이 섹션은 `examples/README.md`의 내용을 포함하며, SDK를 실제로 어떻게 사용하는지 예제 중심으로 설명합니다.

### 사용 준비

#### 1. API 키 설정

환경 변수로 API 키를 설정해주세요:

```bash
export AUDION_API_KEY='your-api-key-here'
```

또는 스크립트를 사용하여 실행:

```bash
AUDION_API_KEY='your-api-key-here' python examples/example_file.py
```

#### 2. 가상환경 활성화

프로젝트 루트에서:

```bash
source venv/bin/activate
```

### 예제 목록

#### `example_file.py`

로컬 오디오/비디오 파일을 처리하는 예제입니다.

**실행 방법:**

```bash
python examples/example_file.py <file_path>

# 예시
python examples/example_file.py samples/audio.wav
python examples/example_file.py /path/to/video.mp4
```

#### `example_url.py`

YouTube 등의 URL을 처리하는 예제입니다.

**실행 방법:**

```bash
python examples/example_url.py <url>

# 예시
python examples/example_url.py https://youtu.be/abc123
python examples/example_url.py https://www.youtube.com/watch?v=abc123
```

### 빠른 예제 실행

```bash
# API 키 설정
export AUDION_API_KEY='your-api-key-here'

# 파일 처리
python examples/example_file.py samples/audio.wav

# URL 처리
python examples/example_url.py https://youtu.be/abc123
```

### 지원하는 Flow

- `audion_vu`: Voice Understanding - 음성 인식 및 분석
- `audion_vh`: Voice Highlight - 주요 음성 구간 추출
- Custom Flow도 지원 가능합니다 (contact@holamago.com)

## 프로젝트 구조

```
audion-python-sdk/
├── README.md            # 메인 문서 (이 파일)
├── audion/              # 메인 패키지
│   ├── client.py        # AudionClient 클래스
│   ├── base.py          # 기본 클라이언트 구현
│   ├── config.py        # 설정
│   ├── core/            # 핵심 기능
│   └── helper/          # 유틸리티
├── examples/            # 사용 예제
│   ├── README.md
│   ├── example_file.py
│   └── example_url.py
├── scripts/             # 환경 설정 스크립트
│   ├── setup.sh
│   └── clean.sh
└── requirements.txt     # 의존성
```

## 문서

- **GitHub**: [github.com/holamago/audion-python-sdk](https://github.com/holamago/audion-python-sdk)
- **예제**: [examples/](examples/) 디렉토리

## 라이선스

이 프로젝트는 [Apache License 2.0](LICENSE) 하에 라이선스됩니다.

## 지원

- **문서**: [Audion 공식 문서](https://audion.magovoice.com)
- **이슈**: [GitHub Issues](https://github.com/holamago/audion-python-sdk/issues)
- **이메일**: contact@holamago.com

## 버전 히스토리

- **v0.1.0**: 초기 릴리스
  - 기본 flow API 지원
  - 파일 및 URL 입력 지원
  - 다중 오디오/비디오 형식 지원

<div align="center">
  <p>Made with ❤️ by <a href="https://magovoice.com">MAGO</a></p>
</div>

# Audion Python SDK

**음성 AI 구현의 복잡함을 없애고, 비즈니스 가능성을 확장하세요.**

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/magovoice/audion-python-sdk/blob/main/LICENSE) [![Python version](https://img.shields.io/badge/python-3.10+-blue.svg)](https://python.org)

## Audion Python SDK

### 🌟 특징

* **간편한 음성 AI 통합**: 몇 줄의 코드로 강력한 음성 AI 기능을 애플리케이션에 추가
* **다양한 입력 지원**: 로컬 파일 및 URL을 통한 음성/비디오 처리
* **광범위한 파일 형식**: 주요 오디오 및 비디오 형식 지원
* **유연한 Flow 시스템**: 다양한 음성 AI 워크플로우 지원
* **간단한 API**: 직관적이고 사용하기 쉬운 Python 인터페이스

### 📋 요구사항

* Python 3.10+
* API 키 ([Audion 서비스 등록](https://audion.magovoice.com/signup) 필요)
  * 회원가입 후 API Key 발급 받아야 합니다.

### 🚀 설치

pip을 사용하여 설치:

```bash
pip install audion
```

또는 requirements.txt에서 의존성과 함께 설치:

```bash
git clone https://github.com/magovoice/audion-python-sdk.git
cd audion-python-sdk
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

의존성:

* `pydantic`: 데이터 유효성 검사 및 설정 관리
* `requests`: HTTP 요청 처리

### ⚡ 빠른 시작

#### 1. 클라이언트 초기화

```python
from audion import AudionClient

# API 키로 클라이언트 초기화
client = AudionClient(api_key="your-api-key-here")
```

#### 2. 로컬 파일 처리

* 오디오/비디오 업로드

```python
# 로컬 오디오/비디오 파일 처리
result = client.flow(
    flow="audion_vu",
    input_type="file",
    input="path/to/your/audio.wav"
)
print(result)
```

#### 3. URL 처리

```python
# YouTube URL 처리
result = client.flow(
    flow="audion_vu",
    input_type="url",
    input="<https://youtu.be/your-video-id>"
)
print(result)
```

### 📖 API 문서

#### AudionClient

Audion 서비스의 메인 클라이언트 클래스입니다.

**초기화**

```python
AudionClient(
    api_key: str,           # 필수: API 인증 키
    base_url: str = None,   # 선택: 서버 기본 URL
    timeout: float = 300    # 선택: 요청 타임아웃 (초)
)
```

**매개변수:**

* `api_key` (str, 필수): Audion 서비스 인증을 위한 API 키
* `base_url` (str, 선택): 서버의 기본 URL. 기본값은 프로덕션 서버
* `timeout` (float, 선택): HTTP 요청 타임아웃. 기본값은 300초

**예외:**

* `ValueError`: api\_key가 제공되지 않은 경우

**메서드**

**`flow(flow, input_type, input)`**

지정된 플로우로 음성/비디오 처리를 실행합니다.

```python
client.flow(
    flow: str,        # 실행할 플로우 이름
    input_type: str,  # 입력 타입: "file" 또는 "url"
    input: str        # 파일 경로 또는 URL
)
```

**매개변수:**

* `flow` (str): 실행할 플로우의 이름
  * 현재 지원하는 플로우:
    * `audion_vu`: Voice Understanding
    * `audion_vh`: Voice Highlight
  * Custom Flow 지원 가능 (email:contact@holamago.com)
* `input_type` (str): 입력 타입. `"file"` 또는 `"url"`
* `input` (str): 처리할 파일의 경로 또는 URL

**반환값:**

* `dict`: 처리 결과를 포함하는 JSON 응답

**예외:**

* `ValueError`: 지원하지 않는 input\_type인 경우
* `Exception`: API 호출 실패 시

### 🎵 지원 파일 형식

#### 오디오 형식

* `.wav` - WAV (Waveform Audio File Format)
* `.mp3` - MP3 (MPEG-1 Audio Layer III)
* `.m4a` - M4A (MPEG-4 Audio)
* `.ogg` - OGG (Ogg Vorbis)
* `.flac` - FLAC (Free Lossless Audio Codec)
* `.aac` - AAC (Advanced Audio Coding)
* `.wma` - WMA (Windows Media Audio)
* `.m4b`, `.m4p`, `.m4r`, `.m4v` - 기타 MPEG-4 오디오 형식

#### 비디오 형식

* `.mp4` - MP4 (MPEG-4 Part 14)
* `.mov` - MOV (QuickTime File Format)
* `.avi` - AVI (Audio Video Interleave)
* `.mkv` - MKV (Matroska Video)
* `.webm` - WebM
* `.wmv` - WMV (Windows Media Video)
* `.flv` - FLV (Flash Video)
* `.mpeg`, `.mpg` - MPEG (Moving Picture Experts Group)

### 💡 사용 예제

#### 완전한 예제

```python
from audion import AudionClient

def main():
    # 클라이언트 초기화
    client = AudionClient(api_key="your-api-key-here")

    try:
        # 로컬 파일 처리
        result = client.flow(
            flow="audion_vu",
            input_type="file",
            input="samples/audio.wav"
        )

        print("처리 결과:", result)

    except ValueError as e:
        print(f"입력 오류: {e}")
    except Exception as e:
        print(f"처리 오류: {e}")

if __name__ == "__main__":
    main()
```

### 📄 라이선스

이 프로젝트는 Apache License 2.0 하에 라이선스됩니다.

### 📞 지원

* **문서**: [Audion 공식 문서](https://audion.magovoice.com)
* **이슈**: [GitHub Issues](https://github.com/magovoice/audion-python-sdk/issues)
* **이메일**: contact@holamago.com

### 📈 버전 히스토리

* **v0.1.0**: 초기 릴리스
  * 기본 flow API 지원
  * 파일 및 URL 입력 지원
  * 다중 오디오/비디오 형식 지원

***

## Audion Realtime SDK

### 📋 요구사항

* python 3.10 이상 설치되어 있어야 합니다.

### Mago

pip을 사용하여 설치:

Made with ❤️ by [MAGO](https://magovoice.com)

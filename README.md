<div align="center">
  <img src="https://audion.magovoice.com/static/media/logo.10d2cf1b78c4088112afa09c702c5c2d.svg" width="200">
  <h1>Audion Python SDK</h1>

  <p>
    <strong>음성 AI 구현의 복잡함을 없애고, 비즈니스 가능성을 확장하세요.</strong>
  </p>

  <p>
    <a href="https://badge.fury.io/py/audion"><img src="https://badge.fury.io/py/audion.svg" alt="PyPI version"></a>
    <a href="https://github.com/magovoice/audion-python-sdk/blob/main/LICENSE"><img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" alt="License"></a>
    <a href="https://python.org"><img src="https://img.shields.io/badge/python-3.7+-blue.svg" alt="Python version"></a>
  </p>
</div>

## 🌟 특징

- **간편한 음성 AI 통합**: 몇 줄의 코드로 강력한 음성 AI 기능을 애플리케이션에 추가
- **다양한 입력 지원**: 로컬 파일 및 URL을 통한 음성/비디오 처리
- **광범위한 파일 형식**: 주요 오디오 및 비디오 형식 지원
- **유연한 Flow 시스템**: 다양한 음성 AI 워크플로우 지원
- **간단한 API**: 직관적이고 사용하기 쉬운 Python 인터페이스

## 📋 요구사항

- Python 3.7+
- API 키 (Audion 서비스 등록 필요)

## 🚀 설치

pip을 사용하여 설치:

```bash
pip install audion
```

또는 requirements.txt에서 의존성과 함께 설치:

```bash
pip install -r requirements.txt
```

의존성:
- `pydantic`: 데이터 유효성 검사 및 설정 관리
- `requests`: HTTP 요청 처리

## ⚡ 빠른 시작

### 1. 클라이언트 초기화

```python
from audion import AudionClient

# API 키로 클라이언트 초기화
client = AudionClient(api_key="your-api-key-here")
```

### 2. 로컬 파일 처리

```python
# 로컬 오디오 파일 처리
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
    input="https://youtu.be/your-video-id"
)
print(result)
```

## 📖 API 문서

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
- `flow` (str): 실행할 플로우의 이름 (예: "audion_vu")
- `input_type` (str): 입력 타입. `"file"` 또는 `"url"`
- `input` (str): 처리할 파일의 경로 또는 URL

**반환값:**
- `dict`: 처리 결과를 포함하는 JSON 응답

**예외:**
- `ValueError`: 지원하지 않는 input_type인 경우
- `Exception`: API 호출 실패 시

##### `get_flows()`

사용 가능한 플로우 목록을 가져옵니다.

```python
flows = client.get_flows()
```

**반환값:**
- `dict`: 사용 가능한 플로우 목록

## 🎵 지원 파일 형식

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

## 💡 사용 예제

### 완전한 예제

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

        # 사용 가능한 플로우 확인
        flows = client.get_flows()
        print("사용 가능한 플로우:", flows)

    except ValueError as e:
        print(f"입력 오류: {e}")
    except Exception as e:
        print(f"처리 오류: {e}")

if __name__ == "__main__":
    main()
```

### 배치 처리 예제

```python
import os
from audion import AudionClient

def process_audio_files(directory, flow_name):
    """디렉토리의 모든 오디오 파일을 처리"""
    client = AudionClient(api_key="your-api-key-here")

    # 지원하는 오디오 확장자
    audio_extensions = ['.wav', '.mp3', '.m4a', '.ogg', '.flac']

    for filename in os.listdir(directory):
        if any(filename.lower().endswith(ext) for ext in audio_extensions):
            file_path = os.path.join(directory, filename)

            try:
                result = client.flow(
                    flow=flow_name,
                    input_type="file",
                    input=file_path
                )
                print(f"✅ {filename}: 처리 완료")
                # 결과 저장 또는 추가 처리

            except Exception as e:
                print(f"❌ {filename}: 처리 실패 - {e}")

# 사용
process_audio_files("./audio_samples", "audion_vu")
```

## 🔧 설정

### 환경 변수

API 키를 환경 변수로 설정할 수 있습니다:

```bash
export AUDION_API_KEY="your-api-key-here"
```

```python
import os
from audion import AudionClient

api_key = os.getenv("AUDION_API_KEY")
client = AudionClient(api_key=api_key)
```

### 커스텀 서버 URL

프라이빗 인스턴스나 개발 서버를 사용하는 경우:

```python
client = AudionClient(
    api_key="your-api-key",
    base_url="https://your-custom-server.com",
    timeout=600  # 10분 타임아웃
)
```

## 🐛 오류 처리

```python
from audion import AudionClient

client = AudionClient(api_key="your-api-key")

try:
    result = client.flow(
        flow="audion_vu",
        input_type="file",
        input="nonexistent.wav"
    )
except ValueError as e:
    print(f"입력 값 오류: {e}")
except FileNotFoundError as e:
    print(f"파일을 찾을 수 없음: {e}")
except Exception as e:
    print(f"알 수 없는 오류: {e}")
```

## 📄 라이선스

이 프로젝트는 [Apache License 2.0](LICENSE) 하에 라이선스됩니다.

## 🤝 기여

기여를 환영합니다! 다음과 같이 참여할 수 있습니다:

1. 이 저장소를 포크합니다
2. 기능 브랜치를 생성합니다 (`git checkout -b feature/amazing-feature`)
3. 변경사항을 커밋합니다 (`git commit -m 'Add some amazing feature'`)
4. 브랜치에 푸시합니다 (`git push origin feature/amazing-feature`)
5. Pull Request를 생성합니다

## 📞 지원

- **문서**: [Audion 공식 문서](https://audion.magovoice.com)
- **이슈**: [GitHub Issues](https://github.com/magovoice/audion-python-sdk/issues)
- **이메일**: support@magovoice.com

## 📈 버전 히스토리

- **v0.1.0**: 초기 릴리스
  - 기본 flow API 지원
  - 파일 및 URL 입력 지원
  - 다중 오디오/비디오 형식 지원

---

<div align="center">
  <p>Made with ❤️ by <a href="https://magovoice.com">MAGO</a></p>
</div>


# Audion Python SDK - 예제

이 디렉토리에는 Audion Python SDK 사용 예제가 포함되어 있습니다.

## 사용 준비

### 1. API 키 설정

환경 변수로 API 키를 설정해주세요:

```bash
export AUDION_API_KEY='your-api-key-here'
```

또는 스크립트를 사용하여 실행:

```bash
AUDION_API_KEY='your-api-key-here' python examples/example_file.py
```

### 2. 가상환경 활성화

프로젝트 루트에서:

```bash
source venv/bin/activate
```

## 예제 목록

### 📁 `example_file.py`

로컬 오디오/비디오 파일을 처리하는 예제입니다.

**실행 방법:**

```bash
python examples/example_file.py <file_path>

# 예시
python examples/example_file.py samples/audio.wav
python examples/example_file.py /path/to/video.mp4
```

### 🌐 `example_url.py`

YouTube 등의 URL을 처리하는 예제입니다.

**실행 방법:**

```bash
python examples/example_url.py <url>

# 예시
python examples/example_url.py https://youtu.be/abc123
python examples/example_url.py https://www.youtube.com/watch?v=abc123
```

## 빠른 시작

```bash
# API 키 설정
export AUDION_API_KEY='your-api-key-here'

# 파일 처리
python examples/example_file.py samples/audio.wav

# URL 처리
python examples/example_url.py https://youtu.be/abc123
```

## 지원하는 Flow

- `audion_vu`: Voice Understanding - 음성 인식 및 분석
- `audion_vh`: Voice Highlight - 주요 음성 구간 추출
- Custom Flow도 지원 가능합니다 (contact@holamago.com)

## 지원하는 파일 형식

### 오디오
`.wav`, `.mp3`, `.m4a`, `.ogg`, `.flac`, `.aac`, `.wma` 등

### 비디오
`.mp4`, `.mov`, `.avi`, `.mkv`, `.webm`, `.wmv`, `.flv` 등

자세한 내용은 [메인 README](../README.md)를 참조하세요.


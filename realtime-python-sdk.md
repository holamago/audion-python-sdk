# Realtime Python SDK

실시간 음성 인식 클라이언트입니다. 마이크를 통해 음성을 실시간으로 인식하고 텍스트로 변환합니다.

## 🚀 주요 기능

* **실시간 음성 인식**: 마이크 입력을 실시간으로 텍스트로 변환
* **WebSocket 통신**: 서버와의 안정적인 양방향 통신
* **macOS 최적화**: macOS에서의 오디오 처리 최적화
* **자동 VAD (Voice Activity Detection)**: 음성 구간 자동 감지

## 📋 시스템 요구사항

* Python 3.10 이상
* 마이크 장치
* 인터넷 연결
* macOS, Linux, Windows 지원

## 🔧 설치 방법

### 1. 저장소 클론

```bash
git clone https://github.com/holamago/mago-client.git
cd mago-client
```

### 2. 자동 설치 (권장)

```bash
chmod +x scripts/install.sh
./scripts/install.sh
```

### 3. 수동 설치

#### Python 가상환경 생성

```bash
python -m venv venv
source venv/bin/activate  # macOS/Linux
# 또는
venv\Scripts\activate     # Windows
```

#### 의존성 설치

```bash
pip install -r requirements.txt
```

### 4. macOS 사용자를 위한 추가 설정

macOS에서 PyAudio 설치 시 문제가 발생할 수 있습니다. 다음 명령어로 해결할 수 있습니다:

```bash
# Homebrew를 사용하여 portaudio 설치
brew install portaudio

# PyAudio 재설치
pip uninstall pyaudio
pip install pyaudio
```

## 🎯 사용 방법

### 1. 기본 실행

```bash
python client/realtime.py
```

### 2. 서버 주소 변경

기본 서버 주소는 `wss://api.magovoice.com/epd/`입니다. 다른 서버를 사용하려면 `client/realtime.py` 파일의 다음 부분을 수정하세요:

```python
uri = "wss://api.magovoice.com/epd/"
```

### 3. 오디오 설정 조정

필요에 따라 다음 설정을 조정할 수 있습니다:

* `CHUNK_DURATION`: 오디오 청크 길이 (기본값: 0.1초)
* `SAMPLE_RATE`: 샘플링 레이트 (기본값: 16000Hz)
* `SCALING_FACTOR`: macOS에서의 오디오 증폭 조정 (기본값: 0.5)

## 📱 사용 예시

1. **실행**: `python client/realtime.py`
2. **음성 입력**: 마이크에 말하기
3. **실시간 출력**: 인식된 텍스트가 터미널에 실시간으로 표시
4. **종료**: `Ctrl+C`로 프로그램 종료

```bash
$ python client/realtime.py
안녕하세요 반갑습니다
오늘 날씨가 좋네요
```

## ⚙️ 고급 설정

### 오디오 장치 변경

기본 마이크 외에 다른 오디오 장치를 사용하려면 PyAudio 설정을 수정하세요:

```python
# client/realtime.py에서
stream = p.open(
    format=FORMAT,
    channels=CHANNELS,
    rate=SAMPLE_RATE,
    input=True,
    input_device_index=YOUR_DEVICE_INDEX,  # 장치 인덱스 추가
    frames_per_buffer=CHUNK_SIZE
)
```

### 사용 가능한 오디오 장치 확인

```python
import pyaudio

p = pyaudio.PyAudio()
for i in range(p.get_device_count()):
    info = p.get_device_info_by_index(i)
    if info['maxInputChannels'] > 0:
        print(f"Input Device {i}: {info['name']}")
```

## 🔍 문제 해결

### 일반적인 문제들

1.  **PyAudio 설치 오류**

    ```bash
    # macOS
    brew install portaudio
    pip install pyaudio

    # Ubuntu/Debian
    sudo apt-get install python3-pyaudio

    # Windows
    pip install pipwin
    pipwin install pyaudio
    ```
2. **마이크 권한 문제**
   * macOS: 시스템 환경설정 > 보안 및 개인 정보 보호 > 마이크 권한 확인
   * Windows: 설정 > 개인 정보 > 마이크 권한 확인
3. **연결 오류**
   * 인터넷 연결 확인
   * 서버 주소 및 포트 확인
   * 방화벽 설정 확인

### 로그 확인

문제 발생 시 다음 정보를 확인하세요:

* Python 버전: `python --version`
* PyAudio 버전: `pip show pyaudio`
* 오디오 장치: 위의 "사용 가능한 오디오 장치 확인" 스크립트 실행

## 📄 라이선스

Copyright (c) 2025- SATURN

## 📞 지원

문제가 발생하거나 질문이 있으시면 이곳으로 문의해주세요. -> contact@holamago.com

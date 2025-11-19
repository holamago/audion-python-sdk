#!/bin/bash

# Audion Python SDK - 프로젝트 설정 스크립트
# 가상환경이 없으면 생성하고, 있으면 재사용합니다.
# 정리가 필요하면 ./scripts/clean.sh를 사용하세요.

set -e  # 에러 발생 시 스크립트 중단

echo "======================================"
echo "Audion Python SDK 환경 설정 시작"
echo "======================================"
echo ""

# 현재 디렉토리를 프로젝트 루트로 변경
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
cd "$PROJECT_ROOT"

echo "프로젝트 디렉토리: $PROJECT_ROOT"
echo ""

# Python 설치 확인
echo "[1/4] Python 설치 확인 중..."
if ! command -v python3 &> /dev/null; then
    echo "❌ 에러: Python 3가 설치되어 있지 않습니다."
    echo "Python 3.7 이상을 설치해주세요: https://www.python.org/downloads/"
    exit 1
fi

PYTHON_VERSION=$(python3 --version)
echo "✓ $PYTHON_VERSION 감지됨"
echo ""

# 가상환경 생성
if [ ! -d "venv" ]; then
    echo "[2/4] 가상환경 생성 중..."
    python3 -m venv venv
    echo "✓ 가상환경 생성 완료"
else
    echo "[2/4] 기존 가상환경 사용"
fi
echo ""

# 가상환경 활성화
echo "[3/4] 가상환경 활성화 중..."
source venv/bin/activate
echo "✓ 가상환경 활성화 완료"
echo ""

# pip 업그레이드
echo "[4/4] 의존성 설치 중..."
echo "pip 업그레이드 중..."
pip install --upgrade pip --quiet

# requirements.txt가 있는 경우 의존성 설치
if [ -f "requirements.txt" ]; then
    echo "requirements.txt에서 의존성 설치 중..."
    pip install -r requirements.txt
    echo "✓ 의존성 설치 완료"
else
    echo "⚠ requirements.txt 파일을 찾을 수 없습니다."
fi
echo ""

# 개발 모드로 패키지 설치 (선택사항)
if [ -f "setup.py" ] || [ -f "pyproject.toml" ]; then
    echo "개발 모드로 패키지 설치 중..."
    pip install -e .
    echo "✓ 패키지 설치 완료"
fi
echo ""

echo "======================================"
echo "✓ 환경 설정이 완료되었습니다!"
echo "======================================"
echo ""
echo "가상환경이 활성화된 새 셸을 시작합니다..."
echo "셸을 종료하려면 'exit'를 입력하세요."
echo ""

# 가상환경이 활성화된 새 bash 셸 시작
cd "$PROJECT_ROOT"
exec bash --init-file <(echo "source venv/bin/activate; echo ''; echo '✓ 가상환경이 활성화되었습니다 ($(python --version))'; echo '  종료하려면: exit'; echo ''")


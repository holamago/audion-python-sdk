#!/bin/bash

# Audion Python SDK - 정리 스크립트
# 캐시, 빌드 파일, 가상환경 등을 삭제합니다.

echo "======================================"
echo "프로젝트 정리 시작"
echo "======================================"
echo ""

# 현재 디렉토리를 프로젝트 루트로 변경
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$SCRIPT_DIR/.." && pwd )"
cd "$PROJECT_ROOT"

# Python 캐시 삭제
echo "Python 캐시 파일 삭제 중..."
find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
find . -type f -name "*.pyc" -delete 2>/dev/null || true
find . -type f -name "*.pyo" -delete 2>/dev/null || true
find . -type f -name "*.pyd" -delete 2>/dev/null || true
echo "✓ Python 캐시 삭제 완료"

# 빌드 파일 삭제
echo "빌드 파일 삭제 중..."
rm -rf build/ 2>/dev/null || true
rm -rf dist/ 2>/dev/null || true
rm -rf *.egg-info 2>/dev/null || true
rm -rf .eggs/ 2>/dev/null || true
echo "✓ 빌드 파일 삭제 완료"

# pytest 캐시 삭제
echo "테스트 캐시 삭제 중..."
rm -rf .pytest_cache/ 2>/dev/null || true
rm -rf .coverage 2>/dev/null || true
rm -rf htmlcov/ 2>/dev/null || true
echo "✓ 테스트 캐시 삭제 완료"

# 가상환경 삭제 확인
if [ -d "venv" ]; then
    read -p "가상환경(venv)도 삭제하시겠습니까? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "가상환경 삭제 중..."
        rm -rf venv
        echo "✓ 가상환경 삭제 완료"
    else
        echo "가상환경을 유지합니다."
    fi
fi

echo ""
echo "======================================"
echo "✓ 정리가 완료되었습니다!"
echo "======================================"
echo ""


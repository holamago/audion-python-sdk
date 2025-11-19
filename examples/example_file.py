#!/usr/bin/env python
# encoding: utf-8
# Copyright (c) 2025- MAGO

"""
로컬 오디오/비디오 파일 처리 예제

이 예제는 로컬 파일을 Audion API로 업로드하고 처리하는 방법을 보여줍니다.
"""

import os
import sys

# 프로젝트 루트를 Python 경로에 추가
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from audion import AudionClient


def main():
    # 환경 변수에서 API 키 가져오기
    api_key = os.getenv("AUDION_API_KEY")
    
    if not api_key:
        print("에러: AUDION_API_KEY 환경 변수를 설정해주세요.")
        print("\n사용법:")
        print("  export AUDION_API_KEY='your-api-key-here'")
        print("  python examples/example_file.py <file_path>")
        return
    
    # 커맨드라인 인자로 파일 경로 받기
    if len(sys.argv) < 2:
        print("에러: 파일 경로를 지정해주세요.")
        print("\n사용법:")
        print("  python examples/example_file.py <file_path>")
        print("\n예시:")
        print("  python examples/example_file.py samples/audio.wav")
        return
    
    file_path = sys.argv[1]
    
    # 파일 존재 확인
    if not os.path.exists(file_path):
        print(f"에러: 파일을 찾을 수 없습니다: {file_path}")
        print("\n실제 오디오/비디오 파일 경로를 지정해주세요.")
        return
    
    # 클라이언트 초기화
    print("✓ AudionClient 초기화 중...")
    client = AudionClient(api_key=api_key)
    
    print(f"✓ 파일 발견: {file_path}")
    print(f"✓ 파일 크기: {os.path.getsize(file_path) / 1024 / 1024:.2f} MB")
    
    try:
        # Flow 실행
        print("\nAudion API 호출 중...")
        result = client.flow(
            flow="audion_vu",        # Voice Understanding 플로우
            input_type="file",        # 파일 타입
            input=file_path,          # 파일 경로
        )
        
        print("\n처리 완료!")
        print("\n결과:")
        print(result)
        
    except ValueError as e:
        print(f"\n입력 오류: {e}")
    except Exception as e:
        print(f"\n처리 오류: {e}")


if __name__ == "__main__":
    main()


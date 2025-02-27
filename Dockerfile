# 1️⃣ Python 3.10 기반 이미지 사용
FROM python:3.10-bullseye

# 2️⃣ 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# 3️⃣ 작업 디렉토리 설정
WORKDIR /app

# 4️⃣ Python 패키지 설치
RUN pip install --upgrade pip
RUN pip install jupyter numpy pandas matplotlib opencv-python

# 5️⃣ Jupyter Notebook 실행 설정
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]

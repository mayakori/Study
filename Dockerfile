FROM pytorch/pytorch:2.6.0-cuda12.6-cudnn9-devel

# Set working directory
WORKDIR /app

# Install Git , opengl
RUN apt-get update && apt-get install -y \
    git libgl1-mesa-glx libglib2.0-0

# .gitconfig 파일을 컨테이너 내부로 복사
COPY .gitconfig /root/.gitconfig
# requirements.txt 파일을 컨테이너 내부로 복사
COPY requirements.txt .

# # pip 사용 버전
# # requirements.txt 사용, -r 옵션 통해 파일에서 목록 불러옴
# RUN pip3 install --upgrade pip
# RUN pip3 install --no-cache-dir -r requirements.txt

# uv 사용해서 패키지 설치시
# distroless uv 이미지로부터 필요 파일 복사해옴
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
# uv 설치 명령, 컨테이너 내부이므로 env 설정같은건 할 필요없음
RUN uv pip install --system -r requirements.txt

# Set environment variables for CUDA
# 현재는 쿠다 cudnn 설치된 파이토치 이미지에 엔비디아 환경변수 넣고 여기다 텐서플로우 설치해서 gpu 활성화함
# 파이토치는 cuda 12.6, 텐서플로우는 12.5 를 사용하는 상황이라 경고 메세지 뜨는상황임
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

# Default command to run Jupyter Notebook
CMD []

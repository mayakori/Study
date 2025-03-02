FROM pytorch/pytorch

# Set working directory
WORKDIR /app

# Install Git , opengl
RUN apt-get update && apt-get install -y \
    git libgl1-mesa-glx libglib2.0-0


# .gitconfig 파일을 컨테이너 내부로 복사
COPY .gitconfig /root/.gitconfig

# Install Python dependencies (PyTorch, Jupyter, and necessary dependencies)
# 현재 하드코딩되어있지만 추후 버전관리시 requirements.txt 파일에 버전 명시해서 분리할것
RUN pip3 install --upgrade pip
RUN pip3 install jupyter notebook ipykernel\    
    torch torchvision\
    matplotlib opencv-python

# Default command to run Jupyter Notebook
CMD []

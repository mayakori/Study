FROM pytorch/pytorch

# Set working directory
WORKDIR /app

# Install Git
RUN apt-get update && apt-get install -y git

# Install Python dependencies (PyTorch, Jupyter, and necessary dependencies)
RUN pip3 install --upgrade pip
RUN pip3 install jupyter notebook ipykernel\    
    torch torchvision
# Default command to run Jupyter Notebook
CMD []

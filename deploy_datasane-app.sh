echo "[Starting deploy setup]"

# Atualiza e faz upgrade do sistema
echo "Updating and upgrading Linux system..."
sudo apt update && sudo apt upgrade -y

# Instala o Docker e o plugin do Docker Compose V2
echo "Installing Docker and Docker Compose V2..."
sudo apt install -y docker.io docker-compose-plugin

# Verifica as versões instaladas
docker --version

# Inicia e habilita o serviço Docker
# Verifica as versões instaladas
docker --version
docker-compose --version
docker compose version

# Inicia e habilita o serviço Docker
echo "Starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

# Clona o projeto
echo "Cloning the project..."
git clone https://www.github.com/datasane/datasane-app.git
cd datasane-app

# Lê as credenciais da AWS
read -p "Enter AWS Access Key ID: " AWS_ACCESS_KEY_ID
read -p "Enter AWS Secret Access Key: " AWS_SECRET_ACCESS_KEY
read -p "Enter AWS Session Token: " AWS_SESSION_TOKEN

echo "Starting Docker Compose..."
# Define as variáveis de ambiente para as credenciais da AWS
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_SESSION_TOKEN=$AWS_SESSION_TOKEN

# Inicia o Docker Compose
echo "Starting Docker Compose..."
docker-compose up --build

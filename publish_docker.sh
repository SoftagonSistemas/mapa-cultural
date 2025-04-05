#!/bin/bash

# Nome dos repositórios Docker no Docker Hub
DOCKER_REPO_APP="softagon/mapasculturais"
DOCKER_REPO_DB="softagon/mapasculturais-db"

# Função para exibir mensagens de erro e sair
function error_exit {
    echo "ERRO: $1" 1>&2
    exit 1
}

# Função para exibir ajuda
function show_help {
    echo "Uso: $0 [opções]"
    echo ""
    echo "Opções:"
    echo "  -h, --help          Mostra esta ajuda"
    echo "  -a, --app           Constrói e envia a imagem da aplicação"
    echo "  -d, --db            Constrói e envia a imagem do banco de dados"
    echo "  --all               Constrói e envia ambas as imagens"
    echo ""
    echo "Se nenhuma opção for fornecida, será mostrada esta ajuda."
    exit 0
}

# Função para gerar a tag baseada na data atual
function generate_date_tag {
    echo $(date +"%Y-%m-%d")
}

# Função para construir e enviar uma imagem Docker
function build_and_push_image {
    local dockerfile=$1
    local repository=$2
    local image_name=$3
    local tag=$4

    echo "========================================="
    echo "Construindo imagem $image_name com tag '$tag'..."
    echo "========================================="
    docker build -t $image_name:$tag -f $dockerfile . || error_exit "Falha ao construir a imagem $image_name."

    echo "Tagueando a imagem com a tag: $tag"
    docker tag $image_name:$tag $repository:$tag || error_exit "Falha ao taguear a imagem $image_name."

    echo "Enviando a imagem para o Docker Hub..."
    docker push $repository:$tag || error_exit "Falha ao enviar a imagem para o Docker Hub."
    
    echo "✅ Imagem enviada com sucesso para $repository:$tag"
    echo ""
}

# Verifica se o Docker está instalado
command -v docker > /dev/null 2>&1 || error_exit "Docker não está instalado. Por favor, instale o Docker e tente novamente."

# Verifica se o Git está instalado
command -v git > /dev/null 2>&1 || error_exit "Git não está instalado. Por favor, instale o Git e tente novamente."

# Obtém o nome da branch atual do Git (apenas para informação)
BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
if [ -z "$BRANCH_NAME" ]; then
    error_exit "Não foi possível obter o nome da branch atual. Certifique-se de estar dentro de um repositório Git."
fi

# Exibe o nome da branch atual
echo "Branch atual: $BRANCH_NAME"

# Gera a tag baseada na data atual
DATE_TAG=$(generate_date_tag)
echo "Tag a ser utilizada: $DATE_TAG"

# Processa os argumentos da linha de comando
BUILD_APP=false
BUILD_DB=false

# Se não tiver argumentos, mostra ajuda
if [ $# -eq 0 ]; then
    show_help
fi

# Processa os argumentos
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -h|--help)
            show_help
            ;;
        -a|--app)
            BUILD_APP=true
            shift
            ;;
        -d|--db)
            BUILD_DB=true
            shift
            ;;
        --all)
            BUILD_APP=true
            BUILD_DB=true
            shift
            ;;
        *)
            echo "Opção desconhecida: $1"
            show_help
            ;;
    esac
done

# Faz login no Docker Hub (antes de iniciar qualquer build)
echo "Fazendo login no Docker Hub..."
docker login || error_exit "Falha ao fazer login no Docker Hub."

# Constrói e envia a imagem da aplicação se solicitado
if [ "$BUILD_APP" = true ]; then
    build_and_push_image "docker/Dockerfile" "$DOCKER_REPO_APP" "mapacultural" "$DATE_TAG"
fi

# Constrói e envia a imagem do banco de dados se solicitado
if [ "$BUILD_DB" = true ]; then
    build_and_push_image "docker/Dockerfile-db" "$DOCKER_REPO_DB" "mapacultural-db" "$DATE_TAG"
fi

echo "Processo concluído com sucesso! 🚀"

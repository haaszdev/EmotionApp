# Detector de Emoções com Flutter

Este é um aplicativo Flutter que utiliza a biblioteca **Google ML Kit** para detectar rostos e classificar emoções com base na expressão facial do usuário.

## 📸 Funcionalidades
- Detecta rostos a partir de uma foto tirada pela câmera ou escolhida da galeria.
- Analisa a expressão facial e exibe um emoji correspondente.
- Emoções suportadas:
  - 😀 **Feliz** (Sorriso detectado)
  - 🙂 **Neutro** (Pequeno sorriso detectado)
  - 😢 **Triste** (Sem sorriso detectado)
  - 😴 **Sonolento** (Olhos fechados detectados)

## 🛠️ Tecnologias Utilizadas
- **Flutter** (SDK para desenvolvimento mobile)
- **Dart** (Linguagem de programação)
- **Google ML Kit** (Reconhecimento facial e classificação de emoções)
- **Image Picker** (Captura de imagem da câmera ou galeria)

## 📦 Instalação
### 1️⃣ Clone o repositório
```sh
 git clone https://github.com/seu-usuario/detector-emocoes-flutter.git
 cd detector-emocoes-flutter
```

### 2️⃣ Instale as dependências
```sh
 flutter pub get
```

### 3️⃣ Execute o projeto
```sh
 flutter run
```

## 📄 Como Usar
1. Abra o aplicativo.
2. Tire uma foto ou escolha uma da galeria.
3. O app irá analisar a imagem e exibir um emoji correspondente à sua emoção.

## 📷 Exemplo de Uso

<img width="404" alt="image" src="https://github.com/user-attachments/assets/59e518c3-0200-479b-9c69-6c8a208bd47a" alt="Exemplo de tela do aplicativo" width="300" />

## 📌 Requisitos
- Flutter 3.0+
- Android SDK / Xcode (para compilar no iOS)
- Permissões para acesso à câmera e galeria

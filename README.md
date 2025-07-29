# 📡 Flutter Realtime MQTT

Aplicativo Flutter para conexão em tempo real com brokers MQTT como o Mosquitto. Ideal para IoT,
notificações em tempo real, automação residencial, entre outros.

## 🔧 Tecnologias

- 🐦 Flutter
- 📡 MQTT (via [mqtt_client](https://pub.dev/packages/mqtt_client))
- 💡 Suporte a tópicos de publicação e assinatura
- ⚙️ Estrutura inicial para expansão modular

## 🚀 Funcionalidades

- Conexão com servidor MQTT via IP/hostname e porta
- Publicação em tópico (em breve)
- Assinatura de tópicos (em breve)
- Exibição em tempo real das mensagens recebidas (em breve)

## 🛠️ Instalação

```bash
git clone https://github.com/Mardem/flutter_realtime.git
cd flutter_realtime
flutter pub get
flutter run
```

## 📍 Exemplo de broker Mosquitto local

```bash
# Inicie um broker Mosquitto em Docker
docker run -it -p 1883:1883 eclipse-mosquitto
```

## 📌 Estrutura inicial do projeto

```
lib/
├── main.dart             # Entry point
├── app.dart              # Widget raiz da aplicação
├── startup/              # Inicialização do app (injeção de dependência, configurações iniciais)
│   ├── di.dart           # Setup de dependências iniciais
├── core/                 # Camada de recursos compartilhados
│   ├── core.dart         # Exports principais da camada core
│   ├── di/               # Injeção de dependência para core
│   └── remote/           # Fontes de dados remotas (ex: APIs, MQTT)
├── modules/              # Módulos da aplicação
│   └── home/             # Módulo home
│       ├── di/           # Injeção de dependência do módulo home
│       └── presentation/ # Tela e lógica para apresentação

```

## 🗺️ Roadmap

- [x] Estrutura inicial do app
- [x] Publicação e assinatura de tópicos
- [x] Interface para visualização de mensagens em tempo real
- [x] Histórico de mensagens
- [x] Reconexão automática

## 🤝 Contribuindo

Pull requests são bem-vindos! Para grandes mudanças, por favor abra uma issue antes para discutir o
que deseja modificar.
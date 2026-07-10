# 📱 Pokédex Flutter Application

Una aplicación móvil moderna de Pokédex construida en Flutter utilizando **Clean Architecture (Layer-First)**, gestión de estado reactiva y las mejores prácticas de la industria para desarrollo de software.

---

## 🏗️ Arquitectura y Flujo de Datos

El proyecto sigue una estructura limpia dividida en capas desacopladas, lo que permite una mantenibilidad, escalabilidad y testeabilidad óptimas.

```text
lib/
├── config/           # Configuración global (Rutas, Temas, Cliente API)
├── domain/           # Reglas de negocio puras (Entidades, Interfaces de Repositorios)
├── infrastructure/   # Implementación técnica (Modelos DTO, Mappers, Repositorios, Datasources)
└── presentation/     # Capa de UI (Pantallas, Widgets, Providers de Riverpod)
```

### 🔄 Flujo de Datos (Data Flow)

1.  **UI (Widgets/Screens):** El usuario interactúa con la interfaz reactiva (ej. selecciona un Pokémon o busca).
2.  **Providers (Riverpod):** Capturan el evento, gestionan el estado inmutable (`StateNotifier`/`Notifier`) y delegan llamadas a los contratos de repositorio.
3.  **Repository (Domain Interface):** Define las operaciones necesarias sin acoplarse a tecnologías de persistencia o red.
4.  **Repository Implementation (Infrastructure):** Implementa el contrato del repositorio, orquestando datos de red (`Dio`) y locales (`SharedPreferences`).
5.  **Datasource (Infrastructure):** Realiza la petición técnica externa (API remota o almacenamiento local).
6.  **Models (Infrastructure):** Mapean y validan la estructura cruda del JSON.
7.  **Mappers (Infrastructure):** Traducen los modelos DTO a Entidades puras de dominio.
8.  **Entities (Domain):** Modelos de negocio puros de Dart que viajan de regreso hasta la UI a través del Provider.

---

## 🚀 Características Clave

### 1. 🔐 Flujo de Autenticación Mock & Guarda de Rutas
*   **Formulario Reactivo:** Pantalla de Login construida con validaciones reactivas en tiempo real mediante la librería **Formz**.
*   **Protección de Navegación (Router Guards):** Integración reactiva de `GoRouter` con `Riverpod`. Rutas como `/favorites` o `/profile` están protegidas y redirigen automáticamente al `/login` si el usuario no ha iniciado sesión.
*   **Perfil de Entrenador:** Sección personalizada que muestra estadísticas de favoritos y un avatar de Pokémon inicial asignado dinámicamente según las iniciales del entrenador.
*   **Persistencia:** La sesión del entrenador se guarda de forma persistente en local.

### 2. 💾 Persistencia de Favoritos y Caché Offline
*   **Caché en Disco:** Favoritos guardados localmente a través de `SharedPreferences`.
*   **Imágenes Locales:** Integración de `cached_network_image` para almacenar localmente en disco las ilustraciones oficiales de los Pokémon tras la primera descarga, acelerando la navegación offline y reduciendo el consumo de datos.

### 3. 🔄 Cadena Evolutiva Interactiva (Evolution Chain)
*   Consumo y procesamiento recursivo del árbol evolutivo de PokeAPI. Soporta tanto cadenas lineales simples (ej. Bulbasaur) como ramificadas (ej. Eevee).
*   Muestra un recorrido visual por las fases evolutivas en los detalles del Pokémon, permitiendo al usuario saltar directamente al detalle de cualquier miembro de la cadena al tocar su miniatura.

---

## 🛠️ Tecnologías Utilizadas

*   **State Management:** `flutter_riverpod` (Notifier y StateNotifier)
*   **Navegación:** `go_router`
*   **Cliente HTTP:** `dio` (con interceptores de logging de peticiones y respuestas)
*   **Almacenamiento Local:** `shared_preferences`
*   **Validación de Formularios:** `formz`
*   **Imágenes en Caché:** `cached_network_image`

---

## 💻 Configuración e Instalación

1.  **Clonar el repositorio e instalar dependencias:**
    ```bash
    flutter pub get
    ```

2.  **Ejecutar el análisis estático de código para comprobar integridad:**
    ```bash
    flutter analyze
    ```

3.  **Ejecutar la aplicación en modo debug:**
    ```bash
    flutter run
    ```

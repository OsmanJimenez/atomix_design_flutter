# Firebase Hosting - Widgetbook Documentation

## Pasos para desplegar en Firebase Hosting

### 1. Instalar Firebase CLI

```bash
npm install -g firebase-tools
```

### 2. Login a Firebase

```bash
firebase login
```

### 3. Inicializar Firebase en el proyecto

```bash
cd apps/atomix_docs
firebase init hosting
```

Selecciona:
- Crear nuevo proyecto o usar existente
- Public directory: `build/web`
- Configure as single-page app: `Yes`
- Set up automatic builds: `No`

### 4. Build de la aplicación web

```bash
flutter build web --release
```

### 5. Desplegar a Firebase

```bash
firebase deploy --only hosting
```

### 6. URL de la documentación

Después del deploy, Firebase te dará una URL como:
`https://[tu-proyecto].web.app`

## Comandos rápidos

```bash
# Build y deploy en un solo paso
cd apps/atomix_docs
flutter build web --release && firebase deploy --only hosting
```

## Actualizar documentación

Cada vez que actualices componentes:

```bash
# Regenerar Widgetbook
flutter pub run build_runner build --delete-conflicting-outputs

# Build web
flutter build web --release

# Deploy
firebase deploy --only hosting
```

# Automatización de SQL Server con Docker y GitHub Actions

## Descripción
Proyecto de automatización de una base de datos SQL Server utilizando Docker y GitHub Actions. Permite ejecutar scripts SQL automáticamente, registrar información de prueba, generar reportes CSV y ejecutar procesos de despliegue.

## Tecnologías utilizadas
- SQL Server 2022
- Docker
- Git y GitHub
- GitHub Actions
- SQL
- PowerShell / Bash
- CSV

## Estructura del proyecto
```text
proyecto-sqlserver-actions/
├── .github/
│   └── workflows/
│       ├── deploy.yml
│       └── report.yml
├── sql/
│   ├── create_database.sql
│   ├── create_tables.sql
│   ├── create_procedure.sql
│   ├── create_trigger.sql
│   └── test_data.sql
└── README.md
```

## Automatizaciones

### 1. Deploy SQL Server
Workflow encargado de ejecutar los procesos de despliegue de SQL Server mediante Docker y GitHub Actions.

### 2. Generate SQL Report
Workflow que:
1. Inicia un contenedor de SQL Server.
2. Crea la base de datos.
3. Ejecuta los scripts para crear tablas, procedimientos y triggers.
4. Inserta datos de prueba.
5. Genera un reporte CSV de inventario.
6. Guarda el reporte como artefacto descargable en GitHub Actions.

El reporte también está configurado para ejecutarse automáticamente mediante programación y manualmente.

## Resultado
Se verificó la ejecución satisfactoria de los workflows en GitHub Actions. El reporte CSV de inventario fue generado y descargado correctamente.

## Repositorio
GitHub: https://github.com/GaelVC04/proyecto-sqlserver-actions

# Endterm_project_Kapizova_Gulsezim_SE_2517
Music Library REST API
A professional Spring Boot RESTful API for managing a digital music library with support for songs, podcasts, and playlists.
This project demonstrates advanced software architecture concepts including Design Patterns (Singleton, Factory, Builder), Component Principles (REP, CCP, CRP), SOLID principles, PostgreSQL integration, global exception handling, and a clean layered architecture.

Project Overview
This project evolves the Assignment 4 Music Library API (SOLID + Advanced OOP) into a fully-fledged Spring Boot REST API with a PostgreSQL database. The system manages media items (Song, Podcast) and Playlist entities, exposing CRUD operations via well-designed REST endpoints. The architecture is organized according to Component Principles (REP, CCP, CRP) and integrates three creational design patterns:

Singleton – for configuration and logging services

Factory – for polymorphic creation of Media subclasses

Builder – for constructing complex Playlist objects
REST API Documentation
🔗 Base URL
http://localhost:8080/api
POST /api/media
{
  "title": "Bohemian Rhapsody",
  "artist": "Queen",
  "duration": 354,
  "type": "SONG"
}

{
  "id": 1,
  "title": "Bohemian Rhapsody",
  "artist": "Queen",
  "duration": 354,
  "type": "SONG"
}
1. Singleton Pattern
Used for:

DatabaseConfig – centralised database configuration.

LoggingConfig – application‑wide logger.

Implementation: Spring @Component (singleton scope by default).
Benefit: Single, shared instance prevents resource duplication and ensures consistent logging/configuration across the application.

2. Factory Pattern
Used for:

Creating Song or Podcast objects based on MediaType.

Implementation: MediaFactory with a createMedia method.
Benefit: Encapsulates instantiation logic; adding new media types (e.g., Audiobook) requires no changes in controllers or services (OCP).
3. Builder Pattern
Used for:

Constructing Playlist objects with multiple optional fields (description, isPublic, items).

Implementation: Static inner class PlaylistBuilder inside Playlist entity.
Benefit: Improves readability and flexibility; allows fluent method chaining.
src/main/java/org/example/
├── MusicLibraryApplication.java
├── config/          # REP: Reusable configuration (Singleton)
├── model/           # REP: Domain entities – reusable across projects
├── repository/      # CCP: Data access – changes with DB schema
├── service/         # CCP: Business logic – changes with requirements
├── controller/      # CCP: API layer – changes with endpoints
├── factory/         # REP: Reusable factory pattern
├── exception/       # CRP: Global error handling – depends on nothing else
└── util/            # CRP: Small utilities (Sorting, Reflection)
Annotations:

Singleton → config, logging packages

Factory → factory.MediaFactory (used in MediaController)

Builder → model.Playlist.PlaylistBuilder

REP → model, factory packages

CCP → controller, service, repository

CRP → exception, util


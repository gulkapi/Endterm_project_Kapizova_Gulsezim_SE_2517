-- PostgreSQL schema for Music Library API
DROP TABLE IF EXISTS playlist_media;
DROP TABLE IF EXISTS playlist;
DROP TABLE IF EXISTS media;

-- Media table (stores both Songs and Podcasts)
CREATE TABLE media (
                       id          SERIAL PRIMARY KEY,
                       title       VARCHAR(255) NOT NULL,
                       artist      VARCHAR(255),
                       duration    INT NOT NULL,
                       type        VARCHAR(50) NOT NULL,   -- 'SONG' or 'PODCAST'
                       created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Playlist table
CREATE TABLE playlist (
                          id          SERIAL PRIMARY KEY,
                          name        VARCHAR(255) NOT NULL,
                          description TEXT,
                          is_public   BOOLEAN DEFAULT TRUE,
                          created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE playlist_media (
                                playlist_id INT NOT NULL,
                                media_id    INT NOT NULL,
                                position    INT,
                                added_at    TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                PRIMARY KEY (playlist_id, media_id),
                                FOREIGN KEY (playlist_id) REFERENCES playlist(id) ON DELETE CASCADE,
                                FOREIGN KEY (media_id)    REFERENCES media(id)    ON DELETE CASCADE
);

CREATE INDEX idx_media_artist ON media(artist);
CREATE INDEX idx_playlist_name ON playlist(name);
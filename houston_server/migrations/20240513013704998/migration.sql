BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "movie" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "food" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "game" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "game" (
    "id" serial PRIMARY KEY,
    "uid" text NOT NULL,
    "gameSystemId" integer NOT NULL,
    "name" text NOT NULL,
    "price" double precision NOT NULL,
    "description" text NOT NULL,
    "players" integer NOT NULL,
    "imageUrl" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "game"
    ADD CONSTRAINT "game_fk_0"
    FOREIGN KEY("gameSystemId")
    REFERENCES "game_system"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR houston
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('houston', '20240513013704998', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240513013704998', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240115074239642', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074239642', "timestamp" = now();


COMMIT;

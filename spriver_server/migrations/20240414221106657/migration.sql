BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "movie" (
    "id" serial PRIMARY KEY,
    "title" text NOT NULL,
    "year" integer NOT NULL,
    "imageUrl" text NOT NULL
);


--
-- MIGRATION VERSION FOR spriver
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spriver', '20240414221106657', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240414221106657', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240115074235544', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240115074235544', "timestamp" = now();


COMMIT;

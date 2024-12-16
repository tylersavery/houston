BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "movie" (
    "id" serial PRIMARY KEY,
    "uid" text NOT NULL,
    "title" text NOT NULL,
    "year" integer NOT NULL,
    "imageUrl" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR houston
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('houston', '20240521201200016', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240521201200016', "timestamp" = now();

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

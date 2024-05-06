BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "food" (
    "id" serial PRIMARY KEY,
    "name" text NOT NULL,
    "price" double precision NOT NULL,
    "description" text NOT NULL,
    "calories" integer NOT NULL,
    "imageUrl" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR spriver
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('spriver', '20240506014850652', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240506014850652', "timestamp" = now();

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

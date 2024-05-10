BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "profile" (
    "id" serial PRIMARY KEY,
    "uid" text NOT NULL,
    "username" text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "avatar" text NOT NULL,
    "bio" text NOT NULL,
    "createdAt" timestamp without time zone NOT NULL
);


--
-- MIGRATION VERSION FOR houston
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('houston', '20240510164139180', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240510164139180', "timestamp" = now();

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

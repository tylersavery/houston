BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "profile" ALTER COLUMN "bio" DROP NOT NULL;

--
-- MIGRATION VERSION FOR houston
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('houston', '20240510202940765', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240510202940765', "timestamp" = now();

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

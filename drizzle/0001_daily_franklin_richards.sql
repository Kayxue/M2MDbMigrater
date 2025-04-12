ALTER TABLE "application" ALTER COLUMN "id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "application" ALTER COLUMN "home_id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "data_container" ALTER COLUMN "id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "data_container" ALTER COLUMN "sensor_id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "home" ALTER COLUMN "id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "sensor" ALTER COLUMN "id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "sensor" ALTER COLUMN "application_id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "sensor_data" ALTER COLUMN "container_id" SET DATA TYPE varchar(10);--> statement-breakpoint
ALTER TABLE "subscribers" ALTER COLUMN "container_id" SET DATA TYPE varchar(10);
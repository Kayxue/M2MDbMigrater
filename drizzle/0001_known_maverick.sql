ALTER TABLE "sensor_data" DROP CONSTRAINT "sensor_data_container_id_timestamp_pk";--> statement-breakpoint
ALTER TABLE "sensor_data" ADD COLUMN "id" varchar(10) PRIMARY KEY NOT NULL;--> statement-breakpoint
ALTER TABLE "sensor_data" ADD COLUMN "created_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "sensor_data" DROP COLUMN "timestamp";
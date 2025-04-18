ALTER TABLE "sensor_data" DROP CONSTRAINT "sensor_data_id_container_id_pk";--> statement-breakpoint
ALTER TABLE "sensor_data" ADD PRIMARY KEY ("id");--> statement-breakpoint
ALTER TABLE "sensor_data" ALTER COLUMN "id" SET DATA TYPE varchar(21);
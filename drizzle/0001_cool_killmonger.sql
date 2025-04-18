ALTER TABLE "sensor_data"
DROP CONSTRAINT "sensor_data_container_id_created_at_pk";

--> statement-breakpoint
ALTER TABLE "sensor_data"
ADD COLUMN "id" varchar(10) NOT NULL;

ALTER TABLE "sensor_data" ADD CONSTRAINT "sensor_data_id_container_id_pk" PRIMARY KEY ("id", "container_id");

--> statement-breakpoint

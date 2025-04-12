CREATE TABLE "application" (
	"id" varchar(21) PRIMARY KEY NOT NULL,
	"home_id" varchar(21) NOT NULL,
	"name" text NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "data_container" (
	"id" varchar(21) PRIMARY KEY NOT NULL,
	"sensor_id" varchar(21) NOT NULL
);
--> statement-breakpoint
CREATE TABLE "home" (
	"id" varchar(21) PRIMARY KEY NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "sensor" (
	"id" varchar(21) PRIMARY KEY NOT NULL,
	"application_id" varchar(21) NOT NULL,
	"created_at" timestamp DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "sensor_data" (
	"container_id" varchar(21) NOT NULL,
	"timestamp" timestamp DEFAULT now() NOT NULL,
	"data" json,
	CONSTRAINT "sensor_data_container_id_timestamp_pk" PRIMARY KEY("container_id","timestamp")
);
--> statement-breakpoint
CREATE TABLE "subscribers" (
	"container_id" varchar(21) NOT NULL,
	"notification_url" text NOT NULL,
	CONSTRAINT "subscribers_container_id_notification_url_pk" PRIMARY KEY("container_id","notification_url")
);
--> statement-breakpoint
ALTER TABLE "application" ADD CONSTRAINT "application_home_id_home_id_fk" FOREIGN KEY ("home_id") REFERENCES "public"."home"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "data_container" ADD CONSTRAINT "data_container_sensor_id_sensor_id_fk" FOREIGN KEY ("sensor_id") REFERENCES "public"."sensor"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "sensor" ADD CONSTRAINT "sensor_application_id_application_id_fk" FOREIGN KEY ("application_id") REFERENCES "public"."application"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "sensor_data" ADD CONSTRAINT "sensor_data_container_id_data_container_id_fk" FOREIGN KEY ("container_id") REFERENCES "public"."data_container"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "subscribers" ADD CONSTRAINT "subscribers_container_id_data_container_id_fk" FOREIGN KEY ("container_id") REFERENCES "public"."data_container"("id") ON DELETE cascade ON UPDATE no action;
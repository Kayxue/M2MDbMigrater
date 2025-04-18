ALTER TABLE "subscribers" DROP CONSTRAINT "subscribers_id_container_id_pk";--> statement-breakpoint
ALTER TABLE "subscribers" ADD PRIMARY KEY ("id");
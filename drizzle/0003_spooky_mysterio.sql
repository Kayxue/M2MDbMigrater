ALTER TABLE "data_container" ADD COLUMN "create_at" timestamp DEFAULT now() NOT NULL;--> statement-breakpoint
ALTER TABLE "subscribers" ADD COLUMN "create_at" timestamp DEFAULT now() NOT NULL;
import { relations } from "drizzle-orm";
import {
  json,
  pgTable,
  primaryKey,
  text,
  timestamp,
  varchar,
} from "drizzle-orm/pg-core";
import { createDocumentRegistry } from "typescript";

export const home = pgTable("home", {
  id: varchar("id", { length: 10 }).primaryKey().notNull(),
  name: text("name").notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});

export const application = pgTable("application", {
  id: varchar("id", { length: 10 }).primaryKey().notNull(),
  homeId: varchar("home_id", { length: 10 })
    .references(() => home.id, { onDelete: "cascade" })
    .notNull(),
  name: text("name").notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});

export const sensor = pgTable("sensor", {
  id: varchar("id", { length: 10 }).primaryKey().notNull(),
  applicationId: varchar("application_id", { length: 10 })
    .references(() => application.id, { onDelete: "cascade" })
    .notNull(),
  name: text("name").notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
});

export const dataContainer = pgTable("data_container", {
  id: varchar("id", { length: 10 }).primaryKey().notNull(),
  sensorId: varchar("sensor_id", { length: 10 })
    .references(() => sensor.id, { onDelete: "cascade" })
    .notNull(),
  createAt: timestamp("create_at").defaultNow().notNull(),
});

export const sensorData = pgTable("sensor_data", {
  id: varchar("id", { length: 10 }).primaryKey().notNull(),
  containerId: varchar("container_id", { length: 10 })
    .references(() => dataContainer.id, { onDelete: "cascade" })
    .notNull(),
  createdAt: timestamp("created_at").defaultNow().notNull(),
  data: json("data"),
});

export const subscriber = pgTable("subscribers", {
  id: varchar("id", { length: 10 }).primaryKey().notNull(),
  containerId: varchar("container_id", { length: 10 })
    .references(() => dataContainer.id, { onDelete: "cascade" })
    .notNull(),
  notificationUrl: text("notification_url").notNull(),
  createAt: timestamp("create_at").defaultNow().notNull(),
});

export const homeToAppRelation = relations(home, ({ many }) => ({
  application: many(application),
}));

export const appToHomeRelation = relations(application, ({ one }) => ({
  home: one(home, {
    fields: [application.homeId],
    references: [home.id],
  }),
}));

export const appToSensorRelation = relations(application, ({ many }) => ({
  sensor: many(sensor),
}));

export const sensorToAppRelation = relations(sensor, ({ one }) => ({
  app: one(application, {
    fields: [sensor.applicationId],
    references: [application.id],
  }),
}));

export const sensorToDataContainerRelation = relations(sensor, ({ many }) => ({
  dataContainer: many(dataContainer),
}));

export const dataContainerToSensorRelation = relations(
  dataContainer,
  ({ one }) => ({
    sensor: one(sensor, {
      fields: [dataContainer.sensorId],
      references: [sensor.id],
    }),
  }),
);

export const dataContainerToSubscriberRelation = relations(
  dataContainer,
  ({ many }) => ({
    subscriber: many(subscriber),
  }),
);

export const subscriberToDataContainerRelation = relations(
  subscriber,
  ({ one }) => ({
    dataContainer: one(dataContainer, {
      fields: [subscriber.containerId],
      references: [dataContainer.id],
    }),
  }),
);

export const dataContainerToSensorDataRelation = relations(
  dataContainer,
  ({ many }) => ({
    sensorData: many(sensorData),
  }),
);

export const sensorDataToDataContainerRelation = relations(
  sensorData,
  ({ one }) => ({
    dataContainer: one(dataContainer, {
      fields: [sensorData.containerId],
      references: [dataContainer.id],
    }),
  }),
);

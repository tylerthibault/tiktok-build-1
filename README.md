# Motorcycle Ride Planner

A modern motorcycle trip planner built with Next.js, TypeScript, PostgreSQL, Prisma, and Tailwind CSS.

## Foundation

- Next.js 16 App Router
- TypeScript
- Tailwind CSS 4
- PostgreSQL
- Prisma ORM 7
- Local PostgreSQL via Docker Compose
- Automatic production database migrations
- Database health endpoint at /api/health

## Database initialization and migrations

Database schema changes are tracked in `prisma/migrations`.

Every production start runs:

~~~bash
prisma migrate deploy
~~~

before Next.js starts. Prisma checks the database migration history and:

- creates the schema on a brand-new database
- applies only pending migrations on an existing database
- does nothing when the database is already current
- fails startup if a migration cannot be safely applied

This means Coolify deployments self-initialize against the configured `DATABASE_URL`.

To inspect migration state manually:

~~~bash
npm run db:status
~~~

## Local development

1. Install dependencies:

~~~bash
npm install
~~~

2. Create your environment file:

~~~bash
cp .env.example .env
~~~

3. Start PostgreSQL:

~~~bash
npm run db:up
~~~

4. Apply committed migrations and generate Prisma Client:

~~~bash
npm run db:deploy
npm run db:generate
~~~

5. Start the application:

~~~bash
npm run dev
~~~

Open http://localhost:3000.

To verify the database connection, open http://localhost:3000/api/health.

## Creating future migrations

After changing `prisma/schema.prisma` during development:

~~~bash
npm run db:migrate -- --name describe_the_change
~~~

Commit both the schema change and the new migration folder. Production should use `prisma migrate deploy`, never `prisma migrate dev`.

## Initial data model

The starter schema includes users, motorcycles, rides, and ordered ride stops. Stop types cover the MVP categories: start, destination, gas, food, scenic, rest, and custom.

## MVP

1. Create a ride
2. Pick a starting point
3. Add destinations and stops
4. Reorder stops
5. See the route on a map
6. See distance and estimated riding time
7. Add gas, food, scenic, and rest stops
8. Save the trip
9. Mark the trip as completed
10. Log actual mileage afterward

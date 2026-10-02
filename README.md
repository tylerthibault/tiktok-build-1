# Motorcycle Ride Planner

A modern motorcycle trip planner built with Next.js, TypeScript, PostgreSQL, Prisma, and Tailwind CSS.

## Foundation

- Next.js 16 App Router
- TypeScript
- Tailwind CSS 4
- PostgreSQL
- Prisma ORM 7
- Local PostgreSQL via Docker Compose
- Database health endpoint at /api/health

## Getting started

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

4. Generate Prisma Client and create the first migration:

~~~bash
npm run db:generate
npm run db:migrate -- --name init
~~~

5. Start the application:

~~~bash
npm run dev
~~~

Open http://localhost:3000.

To verify the database connection, open http://localhost:3000/api/health.

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

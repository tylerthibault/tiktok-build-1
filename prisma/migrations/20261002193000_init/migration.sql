-- CreateEnum
CREATE TYPE "RideStatus" AS ENUM ('DRAFT', 'PLANNED', 'COMPLETED');

-- CreateEnum
CREATE TYPE "StopType" AS ENUM ('START', 'DESTINATION', 'GAS', 'FOOD', 'SCENIC', 'REST', 'CUSTOM');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Motorcycle" (
    "id" TEXT NOT NULL,
    "ownerId" TEXT,
    "nickname" TEXT,
    "year" INTEGER,
    "make" TEXT NOT NULL,
    "model" TEXT NOT NULL,
    "tankCapacityGallons" DECIMAL(6,2),
    "averageMpg" DECIMAL(6,2),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Motorcycle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ride" (
    "id" TEXT NOT NULL,
    "ownerId" TEXT,
    "motorcycleId" TEXT,
    "name" TEXT NOT NULL,
    "rideDate" TIMESTAMP(3),
    "status" "RideStatus" NOT NULL DEFAULT 'DRAFT',
    "plannedDistanceMiles" DECIMAL(9,2),
    "plannedDurationMinutes" INTEGER,
    "actualDistanceMiles" DECIMAL(9,2),
    "completedAt" TIMESTAMP(3),
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Ride_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RideStop" (
    "id" TEXT NOT NULL,
    "rideId" TEXT NOT NULL,
    "sortOrder" INTEGER NOT NULL,
    "type" "StopType" NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT,
    "latitude" DECIMAL(9,6),
    "longitude" DECIMAL(9,6),
    "durationMinutes" INTEGER NOT NULL DEFAULT 0,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RideStop_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "Motorcycle_ownerId_idx" ON "Motorcycle"("ownerId");

-- CreateIndex
CREATE INDEX "Ride_ownerId_idx" ON "Ride"("ownerId");

-- CreateIndex
CREATE INDEX "Ride_motorcycleId_idx" ON "Ride"("motorcycleId");

-- CreateIndex
CREATE INDEX "Ride_status_idx" ON "Ride"("status");

-- CreateIndex
CREATE UNIQUE INDEX "RideStop_rideId_sortOrder_key" ON "RideStop"("rideId", "sortOrder");

-- CreateIndex
CREATE INDEX "RideStop_rideId_idx" ON "RideStop"("rideId");

-- AddForeignKey
ALTER TABLE "Motorcycle" ADD CONSTRAINT "Motorcycle_ownerId_fkey"
FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ride" ADD CONSTRAINT "Ride_ownerId_fkey"
FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ride" ADD CONSTRAINT "Ride_motorcycleId_fkey"
FOREIGN KEY ("motorcycleId") REFERENCES "Motorcycle"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RideStop" ADD CONSTRAINT "RideStop_rideId_fkey"
FOREIGN KEY ("rideId") REFERENCES "Ride"("id") ON DELETE CASCADE ON UPDATE CASCADE;

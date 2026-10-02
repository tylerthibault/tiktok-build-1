import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Ride Planner",
  description: "Plan motorcycle rides, stops, and mileage.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}

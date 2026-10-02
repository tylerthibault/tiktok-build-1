const mvpItems = [
  "Create and save rides",
  "Choose a start and destinations",
  "Add and reorder stops",
  "Map the route",
  "Track distance and ride time",
  "Gas, food, scenic, and rest stops",
  "Complete rides",
  "Log actual mileage",
];

export default function Home() {
  return (
    <main className="min-h-screen bg-[#0b0d10] text-white">
      <section className="mx-auto flex min-h-screen w-full max-w-6xl flex-col justify-center px-6 py-16 sm:px-10">
        <div className="mb-8 flex items-center gap-3 text-sm font-medium text-zinc-400">
          <span className="inline-block h-2.5 w-2.5 rounded-full bg-emerald-400" />
          Foundation ready
        </div>

        <div className="max-w-3xl">
          <p className="mb-4 text-sm font-semibold uppercase tracking-[0.24em] text-orange-400">
            Motorcycle Ride Planner
          </p>
          <h1 className="text-5xl font-semibold tracking-tight sm:text-7xl">
            Plan the ride.
            <span className="block text-zinc-500">Enjoy the road.</span>
          </h1>
          <p className="mt-6 max-w-2xl text-lg leading-8 text-zinc-400">
            The project foundation is set up with Next.js, TypeScript,
            PostgreSQL, Prisma, and Tailwind CSS. The next step is the actual
            ride-planning experience.
          </p>
        </div>

        <div className="mt-12 grid gap-4 md:grid-cols-[1.2fr_0.8fr]">
          <div className="rounded-3xl border border-white/10 bg-white/[0.04] p-7">
            <p className="text-sm font-medium text-zinc-400">MVP scope</p>
            <div className="mt-5 grid gap-3 sm:grid-cols-2">
              {mvpItems.map((item) => (
                <div
                  key={item}
                  className="flex items-center gap-3 rounded-2xl bg-black/20 px-4 py-3 text-sm text-zinc-200"
                >
                  <span className="text-orange-400">✓</span>
                  {item}
                </div>
              ))}
            </div>
          </div>

          <div className="rounded-3xl border border-white/10 bg-orange-500 p-7 text-black">
            <p className="text-sm font-semibold uppercase tracking-wider">
              Stack
            </p>
            <div className="mt-8 space-y-3 text-2xl font-semibold">
              <p>Next.js 16</p>
              <p>TypeScript</p>
              <p>PostgreSQL</p>
              <p>Prisma ORM</p>
              <p>Tailwind CSS</p>
            </div>
          </div>
        </div>
      </section>
    </main>
  );
}

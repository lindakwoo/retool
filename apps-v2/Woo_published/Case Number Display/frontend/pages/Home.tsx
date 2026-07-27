import { useState } from 'react'
import { useGreeting } from '../hooks/useGreeting'

export default function Home() {
  const [name, setName] = useState('world')
  const greeting = useGreeting(name)

  return (
    <div className="min-h-screen bg-background flex flex-col items-center justify-center gap-6 p-8">
      <div className="bg-card text-card-foreground border rounded-xl shadow-sm p-8 w-full max-w-sm flex flex-col gap-4">
        <h1 className="text-2xl font-bold text-foreground">useGreeting demo</h1>

        <label className="flex flex-col gap-1">
          <span className="text-sm text-muted-foreground">Name</span>
          <input
            className="border rounded-md px-3 py-2 bg-background text-foreground focus:outline-none focus:ring-2 focus:ring-ring"
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="Enter a name"
          />
        </label>

        <div className="rounded-lg bg-primary/10 text-primary px-4 py-3 text-lg font-medium">
          {greeting}
        </div>
      </div>
    </div>
  )
}

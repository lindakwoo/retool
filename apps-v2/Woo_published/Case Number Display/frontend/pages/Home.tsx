import { useState, useEffect } from 'react'
import { useGreeting } from '../hooks/useGreeting'
import { useGetGreeting } from '../hooks/backend/functions'

export default function Home() {
  const [name, setName] = useState('world')
  const greeting = useGreeting(name)

  const { data: backendData, loading: backendLoading, error: backendError, trigger } = useGetGreeting()

  useEffect(() => { trigger({}) }, [])

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

      {/* Backend serverless-function wrapper demo */}
      <div className="bg-card text-card-foreground border rounded-xl shadow-sm p-8 w-full max-w-sm flex flex-col gap-4">
        <h2 className="text-2xl font-bold text-foreground">useGetGreeting demo</h2>
        <p className="text-sm text-muted-foreground">
          Called via the auto-generated hook from{' '}
          <code className="font-mono text-xs bg-muted px-1 py-0.5 rounded">
            /frontend/hooks/backend/functions
          </code>
        </p>

        <div className="rounded-lg bg-primary/10 text-primary px-4 py-3 text-lg font-medium">
          {backendLoading && 'Loading…'}
          {backendError && <span className="text-destructive">{backendError}</span>}
          {!backendLoading && !backendError && (backendData?.message ?? '—')}
        </div>
      </div>
    </div>
  )
}

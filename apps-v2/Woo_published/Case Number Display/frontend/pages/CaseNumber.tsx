import { useSearchParams } from 'react-router-dom'

export default function CaseNumber() {
  const [searchParams] = useSearchParams()
  const caseNumber = searchParams.get('caseNumber')

  return (
    <div className="flex items-center justify-center min-h-screen bg-background">
      <div className="p-8 rounded-lg border bg-card text-card-foreground shadow-sm max-w-md w-full text-center">
        {caseNumber ? (
          <p className="text-2xl font-semibold text-foreground">
            Hello, your case number is{' '}
            <span className="text-primary font-bold">{caseNumber}</span>
          </p>
        ) : (
          <p className="text-muted-foreground text-lg">
            No case number provided. Add{' '}
            <code className="bg-muted px-1 py-0.5 rounded text-sm font-mono">
              ?caseNumber=YOUR_CASE
            </code>{' '}
            to the URL.
          </p>
        )}
      </div>
    </div>
  )
}

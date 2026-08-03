/** @jsxRuntime automatic */
/* eslint-disable react-perf/jsx-no-new-object-as-prop */

import { StarterCanvas } from './components/StarterCanvas'

export default function App() {
  return (
    <div
      className="bg-green-500 dark:bg-green-600"
      style={{
        fontFamily: 'sans-serif',
        padding: 0,
        margin: 0,
        position: 'relative',
        width: '100vw',
        height: '100vh',
        overflow: 'hidden',
      }}
    >
      <h1 className="text-4xl font-bold text-foreground p-6">test of non source control publish</h1>
      <StarterCanvas fadeIn={false} />
    </div>
  )
}
/* eslint-enable react-perf/jsx-no-new-object-as-prop */

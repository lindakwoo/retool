/** @jsxRuntime automatic */
/* eslint-disable react-perf/jsx-no-new-object-as-prop */

import { StarterCanvas } from './components/StarterCanvas'

export default function App() {
  return (
    <div
      style={{
        fontFamily: 'sans-serif',
        padding: 0,
        margin: 0,
        background: '#22C55E',
        position: 'relative',
        width: '100vw',
        height: '100vh',
        overflow: 'hidden',
      }}
    >
      <h1>third time</h1>
      <StarterCanvas fadeIn={false} />
    </div>
  )
}
/* eslint-enable react-perf/jsx-no-new-object-as-prop */

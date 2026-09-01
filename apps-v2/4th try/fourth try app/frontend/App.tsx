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
        background: '#FFC0CB',
        position: 'relative',
        width: '100vw',
        height: '100vh',
        overflow: 'hidden',
      }}
    >
      <StarterCanvas fadeIn={false} />
      <span
        style={{
          position: 'absolute',
          top: 16,
          left: 16,
          padding: '4px 12px',
          borderRadius: 9999,
          background: '#FFC0CB',
          color: '#000',
          fontSize: 13,
          fontWeight: 600,
          letterSpacing: 0.2,
        }}
      >
        fourth try
      </span>
    </div>
  )
}
/* eslint-enable react-perf/jsx-no-new-object-as-prop */

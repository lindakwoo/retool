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
        background: '#F0EFEE', // StarterCanvas u_gray
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
          background: 'rgba(0,0,0,0.65)',
          color: '#fff',
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

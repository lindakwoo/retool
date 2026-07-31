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
        background: 'green',
        position: 'relative',
        width: '100vw',
        height: '100vh',
        overflow: 'hidden',
      }}
    >
      <h1>hello woo</h1>
      <h1>goodbye woo</h1>
      <StarterCanvas fadeIn={false} />
    </div>
  )
}
/* eslint-enable react-perf/jsx-no-new-object-as-prop */

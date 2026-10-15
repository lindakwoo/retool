import { Routes, Route } from 'react-router-dom'
import CaseNumber from './pages/CaseNumber'
import Home from './pages/Home'

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<Home />} />
      <Route path="*" element={<CaseNumber />} />
    </Routes>
  )
}

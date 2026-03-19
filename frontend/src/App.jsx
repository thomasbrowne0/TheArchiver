import { useState } from 'react'
import Header from './components/layout/Header'
import SearchBar from './components/layout/SearchBar'
import PersonGrid from './components/persons/PersonGrid'
import Modal from './components/ui/Modal'
import PersonExpanded from './components/profile/PersonExpanded'
import { usePersons } from './hooks/usePersons'
import './App.css'

export default function App() {
  const { persons, loading, error, filter, setFilter } = usePersons()
  const [selectedPersonId, setSelectedPersonId] = useState(null)

  return (
    <div className="app">
      <Header personCount={loading ? null : persons.length} />
      <SearchBar filter={filter} onFilterChange={setFilter} />

      <main className="app-main">
        {error ? (
          <div className="app-error">
            <span className="app-error-icon">⚠</span>
            <p>Could not connect to archive. Is the backend running?</p>
            <code>{error.message}</code>
          </div>
        ) : (
          <PersonGrid
            persons={persons}
            loading={loading}
            onSelectPerson={setSelectedPersonId}
          />
        )}
      </main>

      {selectedPersonId !== null && (
        <Modal onClose={() => setSelectedPersonId(null)}>
          <PersonExpanded personId={selectedPersonId} />
        </Modal>
      )}
    </div>
  )
}

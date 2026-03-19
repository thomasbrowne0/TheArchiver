import { useState } from 'react'
import Header from './components/layout/Header'
import SearchBar from './components/layout/SearchBar'
import PersonGrid from './components/persons/PersonGrid'
import Modal from './components/ui/Modal'
import PersonExpanded from './components/profile/PersonExpanded'
import AIQueryBar from './components/ai/AIQueryBar'
import { usePersons } from './hooks/usePersons'
import './App.css'

export default function App() {
  const { persons, loading, error, filter, setFilter, setAiFilter, clearAiFilter, hasAiFilter } = usePersons()
  const [selectedPersonId, setSelectedPersonId] = useState(null)

  function handleAiResult(aiFilter) {
    setAiFilter({
      statuses:     aiFilter.statuses     ?? [],
      terms:        aiFilter.terms        ?? [],
      location:     aiFilter.location     ?? '',
      no_platforms: aiFilter.no_platforms ?? false,
      sort_by:      aiFilter.sort_by      ?? null,
      sort_dir:     aiFilter.sort_dir     ?? 'asc',
      limit:        aiFilter.limit        ?? null,
      random:       aiFilter.random       ?? false,
    })
  }

  function handleAiClear() {
    clearAiFilter()
  }

  return (
    <div className="app">
      <Header personCount={loading ? null : persons.length} />
      <AIQueryBar
        onResult={handleAiResult}
        onClear={handleAiClear}
        hasActiveFilter={hasAiFilter}
      />
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

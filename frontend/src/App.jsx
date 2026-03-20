import { useState } from 'react'
import Header from './components/layout/Header'
import SearchBar, { COMPANY_STATUS_OPTIONS } from './components/layout/SearchBar'
import PersonGrid from './components/persons/PersonGrid'
import CompanyGrid from './components/companies/CompanyGrid'
import Modal from './components/ui/Modal'
import PersonExpanded from './components/profile/PersonExpanded'
import CompanyExpanded from './components/profile/CompanyExpanded'
import AIQueryBar from './components/ai/AIQueryBar'
import LoginModal from './components/auth/LoginModal'
import UserSettings from './components/auth/UserSettings'
import { usePersons } from './hooks/usePersons'
import { useCompanies } from './hooks/useCompanies'
import { useAuth } from './hooks/useAuth'
import './App.css'

export default function App() {
  const [mode, setMode] = useState('persons')

  const { persons, loading: personsLoading, error: personsError, filter: personFilter, setFilter: setPersonFilter, setAiFilter, clearAiFilter, hasAiFilter } = usePersons()
  const { companies, loading: companiesLoading, error: companiesError, filter: companyFilter, setFilter: setCompanyFilter } = useCompanies()

  const { session, login, logout, deleteMyAccount, isLoggedIn } = useAuth()

  const [selectedPersonId, setSelectedPersonId] = useState(null)
  const [selectedCompanyId, setSelectedCompanyId] = useState(null)
  const [settingsOpen, setSettingsOpen] = useState(false)

  function handleAiResult(aiFilter) {
    setAiFilter({
      statuses:             aiFilter.statuses             ?? [],
      status_exclude:       aiFilter.status_exclude       ?? [],
      terms:                aiFilter.terms                ?? [],
      name_starts_with:     aiFilter.name_starts_with     ?? '',
      name_contains:        aiFilter.name_contains        ?? '',
      gender:               aiFilter.gender               ?? '',
      location:             aiFilter.location             ?? '',
      no_platforms:         aiFilter.no_platforms         ?? false,
      has_platforms:        aiFilter.has_platforms        ?? [],
      only_these_platforms: aiFilter.only_these_platforms ?? false,
      min_platforms:        aiFilter.min_platforms        ?? null,
      max_platforms:        aiFilter.max_platforms        ?? null,
      last_active_after:    aiFilter.last_active_after    ?? '',
      last_active_before:   aiFilter.last_active_before   ?? '',
      archived_after:       aiFilter.archived_after       ?? '',
      archived_before:      aiFilter.archived_before      ?? '',
      has_personal_url:     aiFilter.has_personal_url     ?? null,
      sort_by:              aiFilter.sort_by              ?? null,
      sort_dir:             aiFilter.sort_dir             ?? 'asc',
      limit:                aiFilter.limit                ?? null,
      random:               aiFilter.random               ?? false,
    })
  }

  const currentCount = mode === 'persons'
    ? (personsLoading ? null : persons.length)
    : (companiesLoading ? null : companies.length)

  const currentError = mode === 'persons' ? personsError : companiesError

  return (
    <div className="app">
      {!isLoggedIn && <LoginModal onLogin={login} />}

      <Header
        count={currentCount}
        mode={mode}
        onModeChange={setMode}
        session={session}
        onOpenSettings={() => setSettingsOpen(true)}
      />

      {mode === 'persons' && (
        <AIQueryBar
          onResult={handleAiResult}
          onClear={clearAiFilter}
          hasActiveFilter={hasAiFilter}
        />
      )}

      <SearchBar
        filter={mode === 'persons' ? personFilter : companyFilter}
        onFilterChange={mode === 'persons' ? setPersonFilter : setCompanyFilter}
        statusOptions={mode === 'persons' ? undefined : COMPANY_STATUS_OPTIONS}
      />

      <main className="app-main">
        {currentError ? (
          <div className="app-error">
            <span className="app-error-icon">⚠</span>
            <p>Could not connect to archive. Is the backend running?</p>
            <code>{currentError.message}</code>
          </div>
        ) : mode === 'persons' ? (
          <PersonGrid
            persons={persons}
            loading={personsLoading}
            onSelectPerson={setSelectedPersonId}
          />
        ) : (
          <CompanyGrid
            companies={companies}
            loading={companiesLoading}
            onSelectCompany={setSelectedCompanyId}
          />
        )}
      </main>

      {selectedPersonId !== null && (
        <Modal onClose={() => setSelectedPersonId(null)}>
          <PersonExpanded personId={selectedPersonId} />
        </Modal>
      )}

      {selectedCompanyId !== null && (
        <Modal onClose={() => setSelectedCompanyId(null)}>
          <CompanyExpanded companyId={selectedCompanyId} />
        </Modal>
      )}

      {settingsOpen && session && (
        <Modal onClose={() => setSettingsOpen(false)}>
          <UserSettings
            session={session}
            onDeleteAccount={deleteMyAccount}
            onLogout={logout}
            onClose={() => setSettingsOpen(false)}
            onViewRecord={(id) => { setSettingsOpen(false); setSelectedPersonId(id) }}
          />
        </Modal>
      )}
    </div>
  )
}

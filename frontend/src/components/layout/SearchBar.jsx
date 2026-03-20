import './SearchBar.css'

export const PERSON_STATUS_OPTIONS = [
  { value: '', label: 'ALL STATUS' },
  { value: 'active',   label: 'ACTIVE' },
  { value: 'absent',   label: 'ABSENT' },
  { value: 'deceased', label: 'DECEASED' },
]

export const COMPANY_STATUS_OPTIONS = [
  { value: '', label: 'ALL STATUS' },
  { value: 'active',   label: 'ACTIVE' },
  { value: 'absent',   label: 'ABSENT' },
  { value: 'bankrupt', label: 'BANKRUPT' },
]

export default function SearchBar({ filter, onFilterChange, statusOptions = PERSON_STATUS_OPTIONS }) {
  return (
    <div className="searchbar">
      <div className="searchbar-inner">
        <div className="searchbar-input-wrap">
          <span className="searchbar-icon">⌕</span>
          <input
            className="searchbar-input"
            type="text"
            placeholder="Search records by name..."
            value={filter.term}
            onChange={e => onFilterChange({ ...filter, term: e.target.value })}
          />
          {filter.term && (
            <button className="searchbar-clear" onClick={() => onFilterChange({ ...filter, term: '' })}>✕</button>
          )}
        </div>
        <div className="searchbar-status-group">
          {statusOptions.map(opt => (
            <button
              key={opt.value}
              className={`searchbar-status-btn ${filter.status === opt.value ? 'active' : ''} status-${opt.value}`}
              onClick={() => onFilterChange({ ...filter, status: opt.value })}
            >
              {opt.label}
            </button>
          ))}
        </div>
      </div>
    </div>
  )
}

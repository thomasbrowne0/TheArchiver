import PersonCard from './PersonCard'
import './PersonGrid.css'

function SkeletonCard() {
  return (
    <div className="skeleton-card">
      <div className="skeleton-header">
        <div className="skeleton-circle" />
        <div className="skeleton-lines">
          <div className="skeleton-line skeleton-line--wide" />
          <div className="skeleton-line skeleton-line--short" />
        </div>
      </div>
      <div className="skeleton-body">
        <div className="skeleton-line" />
        <div className="skeleton-line skeleton-line--mid" />
        <div className="skeleton-line skeleton-line--short" />
      </div>
    </div>
  )
}

export default function PersonGrid({ persons, loading, onSelectPerson }) {
  if (loading) {
    return (
      <div className="person-grid">
        {Array.from({ length: 6 }).map((_, i) => <SkeletonCard key={i} />)}
      </div>
    )
  }

  if (persons.length === 0) {
    return (
      <div className="person-grid-empty">
        <span className="person-grid-empty-icon">⊘</span>
        <p>No records match your search.</p>
      </div>
    )
  }

  return (
    <div className="person-grid">
      {persons.map(p => (
        <PersonCard key={p.id} person={p} onClick={() => onSelectPerson(p.id)} />
      ))}
    </div>
  )
}

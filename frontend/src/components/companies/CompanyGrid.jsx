import CompanyCard from './CompanyCard'
import './CompanyGrid.css'

function SkeletonCard() {
  return (
    <div className="skeleton-card">
      <div className="skeleton-header">
        <div className="skeleton-square" />
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

export default function CompanyGrid({ companies, loading, onSelectCompany }) {
  if (loading) {
    return (
      <div className="company-grid">
        {Array.from({ length: 6 }).map((_, i) => <SkeletonCard key={i} />)}
      </div>
    )
  }

  if (companies.length === 0) {
    return (
      <div className="company-grid-empty">
        <span className="company-grid-empty-icon">⊘</span>
        <p>No companies match your search.</p>
      </div>
    )
  }

  return (
    <div className="company-grid">
      {companies.map(c => (
        <CompanyCard key={c.id} company={c} onClick={() => onSelectCompany(c.id)} />
      ))}
    </div>
  )
}

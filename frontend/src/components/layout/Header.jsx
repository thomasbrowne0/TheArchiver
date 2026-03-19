import './Header.css'

export default function Header({ personCount }) {
  return (
    <header className="header">
      <div className="header-inner">
        <div className="header-brand">
          <span className="header-bracket">[</span>
          <span className="header-title">THE ARCHIVER</span>
          <span className="header-bracket">]</span>
        </div>
        <div className="header-meta">
          <span className="header-tag">DIGITAL FOOTPRINT ARCHIVE</span>
          <span className="header-divider">·</span>
          <span className="header-count">{personCount ?? '—'} RECORDS</span>
        </div>
      </div>
    </header>
  )
}

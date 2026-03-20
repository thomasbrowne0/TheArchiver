import './Header.css'

export default function Header({ count, mode, onModeChange, session, onOpenSettings }) {
  return (
    <header className="header">
      <div className="header-inner">
        <div className="header-brand">
          <div className="header-brand-title">
            <span className="header-bracket">[</span>
            <span className="header-title">THE ARCHIVER</span>
            <span className="header-bracket">]</span>
          </div>
          <span className="header-tag">DIGITAL FOOTPRINT ARCHIVE</span>
        </div>

        <nav className="header-nav">
          <button
            className={`header-nav-btn ${mode === 'persons' ? 'active' : ''}`}
            onClick={() => onModeChange('persons')}
          >
            PERSONS
          </button>
          <button
            className={`header-nav-btn ${mode === 'companies' ? 'active' : ''}`}
            onClick={() => onModeChange('companies')}
          >
            COMPANIES
          </button>
        </nav>

        <div className="header-meta">
          <span className="header-count">{count ?? '—'} RECORDS</span>
          {session && (
            <>
              <span className="header-divider">·</span>
              <button className="header-user-btn" onClick={onOpenSettings} title="Account settings">
                <img
                  className="header-user-avatar"
                  src={`https://api.dicebear.com/7.x/personas/svg?seed=${encodeURIComponent(session.name)}`}
                  alt={session.name}
                />
                <span className="header-user-name">{session.name.split(' ')[0]}</span>
                <span className="header-user-icon">⚙</span>
              </button>
            </>
          )}
        </div>
      </div>
    </header>
  )
}

import { useState, useRef, useEffect } from 'react'
import './PlatformTab.css'

const VISIBLE_LIMIT = 4

export default function PlatformTab({ profiles, activeProfileId, onSelect }) {
  const [dropdownOpen, setDropdownOpen] = useState(false)
  const dropdownRef = useRef(null)

  const visible  = profiles.slice(0, VISIBLE_LIMIT)
  const overflow = profiles.slice(VISIBLE_LIMIT)
  const overflowHasActive = overflow.some(p => p.id === activeProfileId)

  useEffect(() => {
    if (!dropdownOpen) return
    function handleClick(e) {
      if (dropdownRef.current && !dropdownRef.current.contains(e.target)) {
        setDropdownOpen(false)
      }
    }
    document.addEventListener('mousedown', handleClick)
    return () => document.removeEventListener('mousedown', handleClick)
  }, [dropdownOpen])

  function handleSelect(id) {
    onSelect(id)
    setDropdownOpen(false)
  }

  return (
    <div className="platform-tab">
      {visible.map(prof => (
        <button
          key={prof.id}
          className={`pt-btn ${prof.id === activeProfileId ? 'active' : ''}`}
          style={prof.id === activeProfileId ? { borderColor: prof.platform_color, color: prof.platform_color } : {}}
          onClick={() => handleSelect(prof.id)}
        >
          {prof.platform_label}
          {!prof.is_active && <span className="pt-inactive-dot" />}
        </button>
      ))}

      {overflow.length > 0 && (
        <div className="pt-overflow" ref={dropdownRef}>
          <button
            className={`pt-btn pt-more-btn ${overflowHasActive ? 'active' : ''}`}
            onClick={() => setDropdownOpen(o => !o)}
            title={overflow.map(p => p.platform_label).join(', ')}
          >
            ···&nbsp;{overflow.length} more
            {overflowHasActive && <span className="pt-more-active-dot" />}
          </button>

          {dropdownOpen && (
            <div className="pt-dropdown">
              {overflow.map(prof => (
                <button
                  key={prof.id}
                  className={`pt-dropdown-item ${prof.id === activeProfileId ? 'active' : ''}`}
                  style={prof.id === activeProfileId ? { color: prof.platform_color } : {}}
                  onClick={() => handleSelect(prof.id)}
                >
                  <span className="pt-dropdown-dot" style={{ background: prof.platform_color }} />
                  {prof.platform_label}
                  {!prof.is_active && <span className="pt-inactive-dot" />}
                </button>
              ))}
            </div>
          )}
        </div>
      )}
    </div>
  )
}

import DigitalStatusBadge from './DigitalStatusBadge'
import './PersonCard.css'

const PLATFORM_COLORS = {
  instagram: '#E1306C',
  facebook:  '#1877F2',
  twitter:   '#1DA1F2',
  reddit:    '#FF4500',
}

function formatDate(dateStr) {
  if (!dateStr) return '—'
  return new Date(dateStr).toLocaleDateString('en-GB', { year: 'numeric', month: 'short', day: 'numeric' })
}

export default function PersonCard({ person, onClick }) {
  const profiles = person.profiles || []

  return (
    <div
      className={`person-card person-card--${person.digital_status}`}
      onClick={onClick}
      role="button"
      tabIndex={0}
      onKeyDown={e => e.key === 'Enter' && onClick()}
    >
      <div className="pc-header">
        <div className="pc-avatar-wrap">
          <img
            className="pc-avatar"
            src={person.avatar_url || `https://api.dicebear.com/7.x/personas/svg?seed=${encodeURIComponent(person.full_name)}`}
            alt={person.full_name}
            onError={e => { e.target.src = `https://api.dicebear.com/7.x/initials/svg?seed=${encodeURIComponent(person.full_name)}` }}
          />
          <div className={`pc-avatar-ring pc-avatar-ring--${person.digital_status}`} />
        </div>
        <div className="pc-header-info">
          <h3 className="pc-name">{person.full_name}</h3>
          <DigitalStatusBadge status={person.digital_status} />
        </div>
      </div>

      <div className="pc-body">
        {person.location && (
          <div className="pc-row">
            <span className="pc-label">LOCATION</span>
            <span className="pc-value">{person.location}</span>
          </div>
        )}
        {person.birth_date && (
          <div className="pc-row">
            <span className="pc-label">BORN</span>
            <span className="pc-value">{formatDate(person.birth_date)}</span>
          </div>
        )}
        {person.is_deceased && person.death_date && (
          <div className="pc-row">
            <span className="pc-label">DIED</span>
            <span className="pc-value pc-value--deceased">{formatDate(person.death_date)}</span>
          </div>
        )}
        <div className="pc-row">
          <span className="pc-label">ARCHIVED</span>
          <span className="pc-value">{formatDate(person.archived_at)}</span>
        </div>
      </div>

      <div className="pc-footer">
        <div className="pc-platforms">
          {profiles.slice(0, 4).map(prof => (
            <span
              key={prof.id || prof.platform_name}
              className="pc-platform-dot"
              style={{ background: PLATFORM_COLORS[prof.platform_name] || '#888' }}
              title={prof.platform_label}
            />
          ))}
          {person.platform_count > 4 && (
            <span className="pc-platform-more">+{person.platform_count - 4}</span>
          )}
        </div>
        <button className="pc-view-btn">VIEW RECORD →</button>
      </div>
    </div>
  )
}

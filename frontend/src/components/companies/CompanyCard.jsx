import DigitalStatusBadge from '../persons/DigitalStatusBadge'
import './CompanyCard.css'

const PLATFORM_COLORS = {
  instagram: '#E1306C',
  facebook:  '#1877F2',
  twitter:   '#1DA1F2',
  reddit:    '#FF4500',
  snapchat:  '#FFDD00',
  linkedin:  '#0A66C2',
  youtube:   '#FF0000',
  tiktok:    '#69C9D0',
  pinterest: '#E60023',
}

const TYPE_LABELS = {
  corporation:    'CORP',
  startup:        'STARTUP',
  ngo:            'NGO',
  agency:         'AGENCY',
  small_business: 'SMB',
}

function formatDate(dateStr) {
  if (!dateStr) return '—'
  return new Date(dateStr).toLocaleDateString('en-GB', { year: 'numeric', month: 'short', day: 'numeric' })
}

export default function CompanyCard({ company, onClick }) {
  const profiles = company.profiles || []

  return (
    <div
      className={`company-card company-card--${company.digital_status}`}
      onClick={onClick}
      role="button"
      tabIndex={0}
      onKeyDown={e => e.key === 'Enter' && onClick()}
    >
      <div className="cc-header">
        <div className="cc-logo-wrap">
          <img
            className="cc-logo"
            src={`https://api.dicebear.com/7.x/identicon/svg?seed=${encodeURIComponent(company.name)}`}
            alt={company.name}
          />
          <div className={`cc-logo-ring cc-logo-ring--${company.digital_status}`} />
        </div>
        <div className="cc-header-info">
          <h3 className="cc-name">{company.name}</h3>
          <div className="cc-badges">
            <span className={`cc-type-badge cc-type--${company.company_type}`}>
              {TYPE_LABELS[company.company_type] || company.company_type.toUpperCase()}
            </span>
            <DigitalStatusBadge status={company.digital_status} />
          </div>
        </div>
      </div>

      <div className="cc-body">
        {company.industry && (
          <div className="cc-row">
            <span className="cc-label">INDUSTRY</span>
            <span className="cc-value">{company.industry}</span>
          </div>
        )}
        {company.headquarters && (
          <div className="cc-row">
            <span className="cc-label">HQ</span>
            <span className="cc-value">{company.headquarters}</span>
          </div>
        )}
        {company.founded_year && (
          <div className="cc-row">
            <span className="cc-label">FOUNDED</span>
            <span className="cc-value">{company.founded_year}</span>
          </div>
        )}
        <div className="cc-row">
          <span className="cc-label">ARCHIVED</span>
          <span className="cc-value">{formatDate(company.archived_at)}</span>
        </div>
      </div>

      <div className="cc-footer">
        <div className="cc-platforms">
          {profiles.slice(0, 4).map(prof => (
            <span
              key={prof.id || prof.platform_name}
              className="cc-platform-dot"
              style={{ background: PLATFORM_COLORS[prof.platform_name] || '#888' }}
              title={prof.platform_label}
            />
          ))}
          {company.platform_count > 4 && (
            <span className="cc-platform-more">+{company.platform_count - 4}</span>
          )}
        </div>
        <button className="cc-view-btn">VIEW RECORD →</button>
      </div>
    </div>
  )
}

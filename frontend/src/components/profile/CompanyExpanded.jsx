import { useState } from 'react'
import { useCompanyDetail } from '../../hooks/useCompanyDetail'
import DigitalStatusBadge from '../persons/DigitalStatusBadge'
import PlatformTab from './PlatformTab'
import PlatformProfile from './PlatformProfile'
import './CompanyExpanded.css'

const TYPE_LABELS = {
  corporation:    'Corporation',
  startup:        'Startup',
  ngo:            'NGO',
  agency:         'Agency',
  small_business: 'Small Business',
}

function formatDate(dateStr) {
  if (!dateStr) return '—'
  return new Date(dateStr).toLocaleDateString('en-GB', { year: 'numeric', month: 'long', day: 'numeric' })
}

function SkeletonExpanded() {
  return (
    <div className="ce-skeleton">
      <div className="ce-skeleton-logo" />
      <div className="ce-skeleton-lines">
        <div className="ce-skeleton-line ce-skeleton-line--wide" />
        <div className="ce-skeleton-line ce-skeleton-line--mid" />
        <div className="ce-skeleton-line ce-skeleton-line--short" />
      </div>
    </div>
  )
}

export default function CompanyExpanded({ companyId }) {
  const { company, loading, error } = useCompanyDetail(companyId)
  const [activeProfileId, setActiveProfileId] = useState(null)

  if (loading) return <SkeletonExpanded />
  if (error)   return <div className="ce-error">Failed to load record: {error.message}</div>
  if (!company) return null

  const profiles = company.profiles || []
  const resolvedActiveId = activeProfileId ?? profiles[0]?.id ?? null
  const activeProfile = profiles.find(p => p.id === resolvedActiveId)

  return (
    <div className="company-expanded">
      {/* Left: identity panel */}
      <div className="ce-identity">
        <div className="ce-logo-wrap">
          <img
            className="ce-logo"
            src={`https://api.dicebear.com/7.x/identicon/svg?seed=${encodeURIComponent(company.name)}`}
            alt={company.name}
          />
          <div className={`ce-logo-ring ce-logo-ring--${company.digital_status}`} />
        </div>

        <h2 className="ce-name">{company.name}</h2>
        <DigitalStatusBadge status={company.digital_status} />

        <div className="ce-info-block">
          {company.company_type && (
            <div className="ce-info-row">
              <span className="ce-info-label">TYPE</span>
              <span className="ce-info-value">{TYPE_LABELS[company.company_type] || company.company_type}</span>
            </div>
          )}
          {company.industry && (
            <div className="ce-info-row">
              <span className="ce-info-label">INDUSTRY</span>
              <span className="ce-info-value">{company.industry}</span>
            </div>
          )}
          {company.headquarters && (
            <div className="ce-info-row">
              <span className="ce-info-label">HQ</span>
              <span className="ce-info-value">{company.headquarters}</span>
            </div>
          )}
          {company.founded_year && (
            <div className="ce-info-row">
              <span className="ce-info-label">FOUNDED</span>
              <span className="ce-info-value">{company.founded_year}</span>
            </div>
          )}
          {company.website_url && (
            <div className="ce-info-row">
              <span className="ce-info-label">WEBSITE</span>
              <a
                href={company.website_url}
                target="_blank"
                rel="noopener noreferrer"
                className="ce-info-value ce-info-link"
                onClick={e => e.stopPropagation()}
              >
                {company.website_url.replace(/^https?:\/\//, '')}
              </a>
            </div>
          )}
          {company.vat_number && (
            <div className="ce-info-row">
              <span className="ce-info-label">VAT</span>
              <span className="ce-info-value ce-info-mono">{company.vat_number}</span>
            </div>
          )}
          <div className="ce-info-row">
            <span className="ce-info-label">ARCHIVED</span>
            <span className="ce-info-value">{formatDate(company.archived_at)}</span>
          </div>
          <div className="ce-info-row">
            <span className="ce-info-label">PLATFORMS</span>
            <span className="ce-info-value">{profiles.length}</span>
          </div>
        </div>

        {company.notes && (
          <div className="ce-notes">
            <span className="ce-notes-label">ARCHIVIST NOTES</span>
            <p className="ce-notes-text">{company.notes}</p>
          </div>
        )}
      </div>

      {/* Right: platform data */}
      <div className="ce-platforms">
        {profiles.length === 0 ? (
          <div className="ce-no-platforms">No platform profiles archived.</div>
        ) : (
          <>
            <PlatformTab
              profiles={profiles}
              activeProfileId={resolvedActiveId}
              onSelect={setActiveProfileId}
            />
            {activeProfile && (
              <PlatformProfile profile={activeProfile} />
            )}
          </>
        )}
      </div>
    </div>
  )
}

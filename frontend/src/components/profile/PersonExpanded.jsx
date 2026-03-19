import { useState } from 'react'
import { usePersonDetail } from '../../hooks/usePersonDetail'
import DigitalStatusBadge from '../persons/DigitalStatusBadge'
import PlatformTab from './PlatformTab'
import PlatformProfile from './PlatformProfile'
import PostFeed from './PostFeed'
import './PersonExpanded.css'

function formatDate(dateStr) {
  if (!dateStr) return '—'
  return new Date(dateStr).toLocaleDateString('en-GB', { year: 'numeric', month: 'long', day: 'numeric' })
}

function SkeletonExpanded() {
  return (
    <div className="pe-skeleton">
      <div className="pe-skeleton-avatar" />
      <div className="pe-skeleton-lines">
        <div className="pe-skeleton-line pe-skeleton-line--wide" />
        <div className="pe-skeleton-line pe-skeleton-line--mid" />
        <div className="pe-skeleton-line pe-skeleton-line--short" />
      </div>
    </div>
  )
}

export default function PersonExpanded({ personId }) {
  const { person, posts, loading, error } = usePersonDetail(personId)
  const [activeProfileId, setActiveProfileId] = useState(null)

  if (loading) return <SkeletonExpanded />
  if (error)   return <div className="pe-error">Failed to load record: {error.message}</div>
  if (!person) return null

  const profiles = person.profiles || []
  const resolvedActiveId = activeProfileId ?? profiles[0]?.id ?? null
  const activeProfile = profiles.find(p => p.id === resolvedActiveId)

  return (
    <div className="person-expanded">
      {/* Left: identity panel */}
      <div className="pe-identity">
        <div className="pe-avatar-wrap">
          <img
            className="pe-avatar"
            src={person.avatar_url || `https://api.dicebear.com/7.x/personas/svg?seed=${encodeURIComponent(person.full_name)}`}
            alt={person.full_name}
            onError={e => { e.target.src = `https://api.dicebear.com/7.x/initials/svg?seed=${encodeURIComponent(person.full_name)}` }}
          />
          <div className={`pe-avatar-ring pe-avatar-ring--${person.digital_status}`} />
        </div>

        <h2 className="pe-name">{person.full_name}</h2>
        <DigitalStatusBadge status={person.digital_status} />

        <div className="pe-info-block">
          {person.location && (
            <div className="pe-info-row">
              <span className="pe-info-label">LOCATION</span>
              <span className="pe-info-value">{person.location}</span>
            </div>
          )}
          {person.birth_date && (
            <div className="pe-info-row">
              <span className="pe-info-label">BORN</span>
              <span className="pe-info-value">{formatDate(person.birth_date)}</span>
            </div>
          )}
          {person.is_deceased && person.death_date && (
            <div className="pe-info-row">
              <span className="pe-info-label">DIED</span>
              <span className="pe-info-value pe-info-value--deceased">{formatDate(person.death_date)}</span>
            </div>
          )}
          <div className="pe-info-row">
            <span className="pe-info-label">ARCHIVED</span>
            <span className="pe-info-value">{formatDate(person.archived_at)}</span>
          </div>
          <div className="pe-info-row">
            <span className="pe-info-label">PLATFORMS</span>
            <span className="pe-info-value">{profiles.length}</span>
          </div>
        </div>

        {person.notes && (
          <div className="pe-notes">
            <span className="pe-notes-label">ARCHIVIST NOTES</span>
            <p className="pe-notes-text">{person.notes}</p>
          </div>
        )}
      </div>

      {/* Right: platform data */}
      <div className="pe-platforms">
        {profiles.length === 0 ? (
          <div className="pe-no-platforms">No platform profiles archived.</div>
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
            <div className="pe-posts-section">
              <h4 className="pe-posts-heading">ARCHIVED POSTS</h4>
              <PostFeed posts={posts} platformName={activeProfile?.platform_name} />
            </div>
          </>
        )}
      </div>
    </div>
  )
}

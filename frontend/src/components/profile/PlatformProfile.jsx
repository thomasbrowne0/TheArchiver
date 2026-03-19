import './PlatformProfile.css'

function fmtNum(n) {
  if (n == null) return '—'
  if (n >= 1000000) return (n / 1000000).toFixed(1) + 'M'
  if (n >= 1000)    return (n / 1000).toFixed(1) + 'K'
  return n.toLocaleString()
}

function fmtDate(d) {
  if (!d) return 'Unknown'
  return new Date(d).toLocaleDateString('en-GB', { year: 'numeric', month: 'short', day: 'numeric' })
}

export default function PlatformProfile({ profile }) {
  if (!profile) return null

  return (
    <div className="platform-profile">
      <div className="pp-header">
        <div className="pp-platform-tag" style={{ borderColor: profile.platform_color, color: profile.platform_color }}>
          {profile.platform_label}
        </div>
        <span className={`pp-status ${profile.is_active ? 'active' : 'inactive'}`}>
          <span className="pp-status-dot" />
          {profile.is_active ? 'ACTIVE' : 'INACTIVE'}
        </span>
      </div>

      <div className="pp-identity">
        <span className="pp-username">{profile.username}</span>
        {profile.display_name && profile.display_name !== profile.username && (
          <span className="pp-display-name">{profile.display_name}</span>
        )}
      </div>

      {profile.bio && (
        <p className="pp-bio">{profile.bio}</p>
      )}

      <div className="pp-stats">
        <div className="pp-stat">
          <span className="pp-stat-value">{fmtNum(profile.follower_count)}</span>
          <span className="pp-stat-label">Followers</span>
        </div>
        <div className="pp-stat-divider" />
        <div className="pp-stat">
          <span className="pp-stat-value">{fmtNum(profile.following_count)}</span>
          <span className="pp-stat-label">Following</span>
        </div>
        <div className="pp-stat-divider" />
        <div className="pp-stat">
          <span className="pp-stat-value">{fmtNum(profile.post_count)}</span>
          <span className="pp-stat-label">Posts</span>
        </div>
      </div>

      {profile.last_seen_at && (
        <div className="pp-last-seen">
          <span className="pp-last-seen-label">LAST SEEN</span>
          <span className="pp-last-seen-value">{fmtDate(profile.last_seen_at)}</span>
        </div>
      )}
    </div>
  )
}

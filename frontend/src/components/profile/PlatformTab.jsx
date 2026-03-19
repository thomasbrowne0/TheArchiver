import './PlatformTab.css'

export default function PlatformTab({ profiles, activeProfileId, onSelect }) {
  return (
    <div className="platform-tab">
      {profiles.map(prof => (
        <button
          key={prof.id}
          className={`pt-btn ${prof.id === activeProfileId ? 'active' : ''}`}
          style={prof.id === activeProfileId ? { borderColor: prof.platform_color, color: prof.platform_color } : {}}
          onClick={() => onSelect(prof.id)}
        >
          {prof.platform_label}
          {!prof.is_active && <span className="pt-inactive-dot" />}
        </button>
      ))}
    </div>
  )
}

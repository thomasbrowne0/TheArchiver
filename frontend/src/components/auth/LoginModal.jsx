import { useState } from 'react'
import './LoginModal.css'

const PROVIDERS = [
  {
    id:      'hackbook',
    name:    'Hackbook',
    color:   '#1877F2',
    bgColor: 'rgba(24,119,242,0.12)',
    icon:    'f',
    iconFont:'Georgia, serif',
    desc:    'Connect with your social profile',
  },
  {
    id:      'hackx',
    name:    'HackX',
    color:   '#e7e9ea',
    bgColor: 'rgba(231,233,234,0.08)',
    icon:    '𝕏',
    iconFont:'var(--font-mono)',
    desc:    'Connect with your public identity',
  },
  {
    id:      'hackgle',
    name:    'Hackgle',
    color:   '#FF0000',
    bgColor: 'rgba(255,0,0,0.10)',
    icon:    '▶',
    iconFont:'var(--font-mono)',
    desc:    'Connect with your video presence',
  },
]

export default function LoginModal({ onLogin }) {
  const [loading, setLoading]   = useState(false)
  const [activeId, setActiveId] = useState(null)
  const [error, setError]       = useState(null)

  async function handleSelect(providerId) {
    if (loading) return
    setLoading(true)
    setActiveId(providerId)
    setError(null)
    try {
      await onLogin(providerId)
    } catch (err) {
      setError(err.message || 'Something went wrong. Try again.')
      setLoading(false)
      setActiveId(null)
    }
  }

  const activeProvider = PROVIDERS.find(p => p.id === activeId)

  return (
    <div className="login-overlay">
      <div className="login-card">
        <div className="login-top">
          <div className="login-archive-brand">
            <span className="login-bracket">[</span>
            <span className="login-archive-name">THE ARCHIVER</span>
            <span className="login-bracket">]</span>
          </div>
          <h1 className="login-headline">CONNECT TO THE ARCHIVE</h1>
          <p className="login-subtext">
            Choose a platform to connect with. Your digital footprint will be
            automatically archived. You can opt out at any time.
          </p>
        </div>

        {loading ? (
          <div className="login-generating">
            <div className="login-spinner" style={{ borderTopColor: activeProvider?.color }} />
            <p className="login-generating-text">
              Generating your archive entry via{' '}
              <span style={{ color: activeProvider?.color }}>{activeProvider?.name}</span>...
            </p>
            <p className="login-generating-sub">The AI is building your profile. This takes a moment.</p>
          </div>
        ) : (
          <div className="login-providers">
            {PROVIDERS.map(p => (
              <button
                key={p.id}
                className="login-provider-btn"
                style={{ '--provider-color': p.color, '--provider-bg': p.bgColor }}
                onClick={() => handleSelect(p.id)}
              >
                <div className="login-provider-icon" style={{ background: p.color }}>
                  <span style={{ fontFamily: p.iconFont }}>{p.icon}</span>
                </div>
                <div className="login-provider-info">
                  <span className="login-provider-name">Continue with {p.name}</span>
                  <span className="login-provider-desc">{p.desc}</span>
                </div>
                <span className="login-provider-arrow">→</span>
              </button>
            ))}
          </div>
        )}

        {error && <p className="login-error">{error}</p>}

        <p className="login-consent">
          By connecting, you consent to your profile being permanently archived.
        </p>
      </div>
    </div>
  )
}

import { useState } from 'react'
import './UserSettings.css'

export default function UserSettings({ session, onDeleteAccount, onLogout, onClose, onViewRecord }) {
  const [confirming, setConfirming] = useState(false)
  const [deleting, setDeleting]    = useState(false)
  const [error, setError]          = useState(null)

  async function handleDelete() {
    if (!confirming) {
      setConfirming(true)
      return
    }
    setDeleting(true)
    setError(null)
    try {
      await onDeleteAccount(session.personId)
      onClose()
    } catch (err) {
      setError(err.message)
      setDeleting(false)
    }
  }

  return (
    <div className="user-settings">
      <div className="us-header">
        <img
          className="us-avatar"
          src={`https://api.dicebear.com/7.x/personas/svg?seed=${encodeURIComponent(session.name)}`}
          alt={session.name}
        />
        <div className="us-identity">
          <h2 className="us-name">{session.name}</h2>
          <span className="us-tag">CONNECTED VIA HACKBOOK</span>
        </div>
      </div>

      <div className="us-section">
        <p className="us-section-title">YOUR ARCHIVE RECORD</p>
        <p className="us-section-body">
          Your data is archived and visible to all users of The Archiver.
          You connected via Hackbook and consented to data retention.
        </p>
        <button
          className="us-view-btn"
          onClick={() => onViewRecord(session.personId)}
        >
          VIEW MY RECORD →
        </button>
      </div>

      <div className="us-section us-danger-section">
        <p className="us-section-title">OPT OUT</p>
        {!confirming ? (
          <>
            <p className="us-section-body">
              Permanently delete your archive record. This cannot be undone.
            </p>
            <button className="us-delete-btn" onClick={handleDelete}>
              DELETE MY RECORD
            </button>
          </>
        ) : (
          <>
            <p className="us-confirm-text">
              This will permanently remove your profile, platform data, and all archived activity.
              Are you sure?
            </p>
            <div className="us-confirm-actions">
              <button
                className="us-delete-btn us-delete-btn--confirm"
                onClick={handleDelete}
                disabled={deleting}
              >
                {deleting ? 'DELETING...' : 'YES, DELETE EVERYTHING'}
              </button>
              <button
                className="us-cancel-btn"
                onClick={() => setConfirming(false)}
                disabled={deleting}
              >
                CANCEL
              </button>
            </div>
          </>
        )}
        {error && <p className="us-error">{error}</p>}
      </div>

      <button className="us-logout-btn" onClick={onLogout}>
        DISCONNECT
      </button>
    </div>
  )
}

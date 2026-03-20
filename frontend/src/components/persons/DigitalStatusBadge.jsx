import './DigitalStatusBadge.css'

const STATUS_MAP = {
  active:   { label: 'ACTIVE',   cls: 'active' },
  absent:   { label: 'ABSENT',   cls: 'absent' },
  deceased: { label: 'DECEASED', cls: 'deceased' },
  bankrupt: { label: 'BANKRUPT', cls: 'bankrupt' },
}

export default function DigitalStatusBadge({ status }) {
  const s = STATUS_MAP[status] || STATUS_MAP.absent
  return (
    <span className={`dsb dsb--${s.cls}`}>
      <span className="dsb-dot" />
      {s.label}
    </span>
  )
}

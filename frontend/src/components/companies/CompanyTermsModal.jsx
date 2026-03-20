import { useState } from 'react'
import './CompanyTermsModal.css'

export default function CompanyTermsModal({ onAccept }) {
  const [optOutSent, setOptOutSent] = useState(false)

  return (
    <div className="cterms-overlay">
      <div className="cterms-card">
        <div className="cterms-brand">
          <span className="cterms-bracket">[</span>
          <span className="cterms-brand-name">THE ARCHIVER</span>
          <span className="cterms-bracket">]</span>
        </div>

        <h1 className="cterms-headline">COMPANY DATA NOTICE</h1>

        <div className="cterms-sections">
          <section className="cterms-section">
            <h2 className="cterms-section-title">HOW COMPANIES ARE LISTED</h2>
            <p className="cterms-section-body">
              Company data is collected via automated scraping of public digital platforms.
              When a company's online presence is detected, we notify them at their official
              contact address. They are informed that their public digital footprint has been
              archived here and are given the opportunity to respond.
            </p>
          </section>

          <section className="cterms-section">
            <h2 className="cterms-section-title">OPT OUT</h2>
            <p className="cterms-section-body">
              If your company is listed and you wish to opt out, you may request removal
              below. An executive officer should contact us from their official company
              email domain:
            </p>
            <code className="cterms-email">optout@scaliverse.dk</code>

            {!optOutSent ? (
              <button
                className="cterms-optout-btn"
                onClick={() => setOptOutSent(true)}
              >
                REQUEST OPT-OUT
              </button>
            ) : (
              <p className="cterms-success">
                ✓ Opt-out request sent. Your company will be removed from The Archiver
                within 2 business days.
              </p>
            )}
          </section>
        </div>

        <button className="cterms-accept-btn" onClick={onAccept}>
          UNDERSTOOD — VIEW COMPANIES →
        </button>
      </div>
    </div>
  )
}

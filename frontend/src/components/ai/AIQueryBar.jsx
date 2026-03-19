import { useState } from 'react'
import { postAiQuery } from '../../api/archiveApi'
import './AIQueryBar.css'

const SUGGESTIONS = [
  'Who has been absent digitally lately?',
  'Show me deceased records',
  'How many people are actively posting?',
  'Find Marcus Venn',
  'Who has the most platforms?',
]

export default function AIQueryBar({ onResult, onClear, hasActiveFilter }) {
  const [input, setInput]     = useState('')
  const [loading, setLoading] = useState(false)
  const [answer, setAnswer]   = useState(null)
  const [error, setError]     = useState(null)

  async function handleSubmit(e) {
    e.preventDefault()
    const q = input.trim()
    if (!q) return

    setLoading(true)
    setError(null)
    setAnswer(null)

    try {
      const result = await postAiQuery(q)
      setAnswer(result.answer)
      onResult(result.filter)
    } catch (err) {
      setError(err.message)
    } finally {
      setLoading(false)
    }
  }

  function handleClear() {
    setInput('')
    setAnswer(null)
    setError(null)
    onClear()
  }

  function handleSuggestion(s) {
    setInput(s)
  }

  return (
    <div className="ai-bar">
      <div className="ai-bar-inner">
        <div className="ai-bar-label">
          <span className="ai-bar-icon">◈</span>
          <span className="ai-bar-label-text">AI QUERY</span>
        </div>

        <form className="ai-bar-form" onSubmit={handleSubmit}>
          <input
            className="ai-bar-input"
            type="text"
            placeholder="Ask anything about the archive…"
            value={input}
            onChange={e => setInput(e.target.value)}
            disabled={loading}
          />
          <button
            className="ai-bar-submit"
            type="submit"
            disabled={loading || !input.trim()}
          >
            {loading ? <span className="ai-bar-spinner" /> : 'ASK →'}
          </button>
          {(answer || hasActiveFilter) && (
            <button
              type="button"
              className="ai-bar-clear"
              onClick={handleClear}
            >
              CLEAR
            </button>
          )}
        </form>

        {!answer && !loading && (
          <div className="ai-suggestions">
            {SUGGESTIONS.map(s => (
              <button
                key={s}
                className="ai-suggestion-pill"
                onClick={() => handleSuggestion(s)}
                type="button"
              >
                {s}
              </button>
            ))}
          </div>
        )}

        {error && (
          <div className="ai-bar-error">
            <span>⚠ {error}</span>
          </div>
        )}

        {answer && (
          <div className="ai-bar-answer">
            <span className="ai-bar-answer-icon">◈</span>
            <p className="ai-bar-answer-text">{answer}</p>
          </div>
        )}
      </div>
    </div>
  )
}

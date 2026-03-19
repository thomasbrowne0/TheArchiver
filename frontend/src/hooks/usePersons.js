import { useState, useEffect } from 'react'
import { getPersons } from '../api/archiveApi'

export function usePersons() {
  const [persons, setPersons]   = useState([])
  const [loading, setLoading]   = useState(true)
  const [error, setError]       = useState(null)
  const [filter, setFilter]     = useState({ term: '', status: '' })

  useEffect(() => {
    getPersons()
      .then(setPersons)
      .catch(setError)
      .finally(() => setLoading(false))
  }, [])

  const filtered = persons.filter(p => {
    const matchesTerm   = !filter.term   || p.full_name.toLowerCase().includes(filter.term.toLowerCase())
    const matchesStatus = !filter.status || p.digital_status === filter.status
    return matchesTerm && matchesStatus
  })

  return { persons: filtered, loading, error, filter, setFilter }
}

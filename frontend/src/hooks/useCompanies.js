import { useState, useEffect, useMemo } from 'react'
import { getCompanies } from '../api/archiveApi'

export function useCompanies() {
  const [allCompanies, setAllCompanies] = useState([])
  const [loading, setLoading]           = useState(true)
  const [error, setError]               = useState(null)
  const [filter, setFilter]             = useState({ term: '', status: '' })

  useEffect(() => {
    getCompanies()
      .then(setAllCompanies)
      .catch(setError)
      .finally(() => setLoading(false))
  }, [])

  const companies = useMemo(() => {
    return allCompanies.filter(c => {
      const matchesTerm   = !filter.term   || c.name.toLowerCase().includes(filter.term.toLowerCase())
      const matchesStatus = !filter.status || c.digital_status === filter.status
      return matchesTerm && matchesStatus
    })
  }, [allCompanies, filter])

  return { companies, loading, error, filter, setFilter }
}

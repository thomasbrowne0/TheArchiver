import { useState, useEffect } from 'react'
import { getCompany } from '../api/archiveApi'

export function useCompanyDetail(companyId) {
  const [company, setCompany] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError]     = useState(null)

  useEffect(() => {
    if (!companyId) return
    setLoading(true)
    setError(null)
    setCompany(null)
    getCompany(companyId)
      .then(setCompany)
      .catch(setError)
      .finally(() => setLoading(false))
  }, [companyId])

  return { company, loading, error }
}

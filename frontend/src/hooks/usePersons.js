import { useState, useEffect, useMemo } from 'react'
import { getPersons } from '../api/archiveApi'

const EMPTY_AI = {
  statuses:             [],
  terms:                [],
  name_starts_with:     '',
  location:             '',
  no_platforms:         false,
  has_platforms:        [],
  only_these_platforms: false,
  sort_by:              null,   // 'name' | 'birth_date' | 'archived_at' | 'platform_count'
  sort_dir:             'asc',  // 'asc' | 'desc'
  limit:                null,   // number | null
  random:               false,
}

export function usePersons() {
  const [allPersons, setAllPersons] = useState([])
  const [loading, setLoading]       = useState(true)
  const [error, setError]           = useState(null)
  const [filter, setFilter]         = useState({ term: '', status: '' })
  const [aiFilter, setAiFilter]     = useState(EMPTY_AI)

  useEffect(() => {
    getPersons()
      .then(setAllPersons)
      .catch(setError)
      .finally(() => setLoading(false))
  }, [])

  const persons = useMemo(() => {
    let list = allPersons.filter(p => {
      const name = p.full_name.toLowerCase()

      // Manual search bar
      const matchesTerm   = !filter.term   || name.includes(filter.term.toLowerCase())
      const matchesStatus = !filter.status || p.digital_status === filter.status

      // AI: status array (OR)
      const matchesAiStatus = aiFilter.statuses.length === 0
        || aiFilter.statuses.includes(p.digital_status)

      // AI: name terms array (OR)
      const matchesAiTerms = aiFilter.terms.length === 0
        || aiFilter.terms.some(t => name.includes(t.toLowerCase()))

      // AI: name starts with letter
      const matchesNameStarts = !aiFilter.name_starts_with
        || name.startsWith(aiFilter.name_starts_with.toLowerCase())

      // AI: location substring
      const matchesLocation = !aiFilter.location
        || (p.location || '').toLowerCase().includes(aiFilter.location.toLowerCase())

      // AI: no social media presence
      const matchesNoPlatforms = !aiFilter.no_platforms || (p.platform_count ?? 0) === 0

      // AI: platform presence — person must have ALL listed platforms
      const pNames = p.platform_names || []
      const matchesHasPlatforms = aiFilter.has_platforms.length === 0
        || aiFilter.has_platforms.every(pl => pNames.includes(pl))

      // AI: exclusive platform match — person must have ONLY the listed platforms
      const matchesOnlyPlatforms = !aiFilter.only_these_platforms
        || (matchesHasPlatforms && pNames.every(pl => aiFilter.has_platforms.includes(pl)))

      return matchesTerm && matchesStatus && matchesAiStatus && matchesAiTerms
        && matchesNameStarts && matchesLocation && matchesNoPlatforms
        && matchesHasPlatforms && matchesOnlyPlatforms
    })

    // Sort
    if (aiFilter.sort_by) {
      list = [...list].sort((a, b) => {
        let av, bv
        switch (aiFilter.sort_by) {
          case 'name':           av = a.full_name;      bv = b.full_name;      break
          case 'birth_date':     av = a.birth_date;     bv = b.birth_date;     break
          case 'archived_at':    av = a.archived_at;    bv = b.archived_at;    break
          case 'platform_count': av = a.platform_count; bv = b.platform_count; break
          default: return 0
        }
        if (av == null) return 1
        if (bv == null) return -1
        const cmp = av < bv ? -1 : av > bv ? 1 : 0
        return aiFilter.sort_dir === 'desc' ? -cmp : cmp
      })
    }

    // Random shuffle before limit
    if (aiFilter.random) {
      list = [...list].sort(() => Math.random() - 0.5)
    }

    // Limit
    if (aiFilter.limit && aiFilter.limit > 0) {
      list = list.slice(0, aiFilter.limit)
    }

    return list
  }, [allPersons, filter, aiFilter])

  function clearAiFilter() { setAiFilter(EMPTY_AI) }

  const hasAiFilter = aiFilter.statuses.length > 0
    || aiFilter.terms.length > 0
    || !!aiFilter.name_starts_with
    || !!aiFilter.location
    || aiFilter.no_platforms
    || aiFilter.has_platforms.length > 0
    || !!aiFilter.sort_by
    || !!aiFilter.limit
    || aiFilter.random

  return { persons, loading, error, filter, setFilter, aiFilter, setAiFilter, clearAiFilter, hasAiFilter }
}

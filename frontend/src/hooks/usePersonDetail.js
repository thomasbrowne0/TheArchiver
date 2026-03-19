import { useState, useEffect } from 'react'
import { getPerson, getPersonPosts } from '../api/archiveApi'

export function usePersonDetail(personId) {
  const [person, setPerson]   = useState(null)
  const [posts, setPosts]     = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError]     = useState(null)

  useEffect(() => {
    if (!personId) return
    setLoading(true)
    setError(null)

    Promise.all([getPerson(personId), getPersonPosts(personId)])
      .then(([p, po]) => {
        setPerson(p)
        setPosts(po)
      })
      .catch(setError)
      .finally(() => setLoading(false))
  }, [personId])

  return { person, posts, loading, error }
}

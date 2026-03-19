const BASE = import.meta.env.VITE_API_URL || 'http://localhost:4000'

async function apiFetch(path) {
  const res = await fetch(`${BASE}${path}`)
  if (!res.ok) {
    const body = await res.json().catch(() => ({}))
    throw new Error(body.error || `HTTP ${res.status}`)
  }
  return res.json()
}

export const getPersons    = ()           => apiFetch('/api/persons')
export const getPerson     = (id)         => apiFetch(`/api/persons/${id}`)
export const getPersonPosts = (id, plat) =>
  apiFetch(`/api/persons/${id}/posts${plat ? `?platform=${plat}` : ''}`)
export const getPlatforms  = ()           => apiFetch('/api/platforms')

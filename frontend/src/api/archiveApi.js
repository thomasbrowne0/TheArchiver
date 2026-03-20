const BASE = import.meta.env.VITE_API_URL

if (!BASE) {
  throw new Error('Missing VITE_API_URL. Set it in the frontend environment.')
}

async function apiFetch(path, options = {}) {
  const res = await fetch(`${BASE}${path}`, {
    headers: { 'Content-Type': 'application/json', ...options.headers },
    ...options,
  })
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

export const getCompanies = ()   => apiFetch('/api/companies')
export const getCompany   = (id) => apiFetch(`/api/companies/${id}`)

export const postProviderLogin = (provider) =>
  apiFetch('/api/auth/login', { method: 'POST', body: JSON.stringify({ provider }) })

export const deleteAccount = (personId) =>
  apiFetch('/api/auth/account', { method: 'DELETE', body: JSON.stringify({ personId }) })

export async function postAiQuery(question) {
  const res = await fetch(`${BASE}/api/ai/query`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ question }),
  })
  if (!res.ok) {
    const body = await res.json().catch(() => ({}))
    throw new Error(body.error || `HTTP ${res.status}`)
  }
  return res.json()
}

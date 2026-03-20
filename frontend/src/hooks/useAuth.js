import { useState, useCallback } from 'react'
import { postProviderLogin, deleteAccount } from '../api/archiveApi'

const STORAGE_KEY = 'archiver_session'

function loadSession() {
  try { return JSON.parse(localStorage.getItem(STORAGE_KEY)) } catch { return null }
}

export function useAuth() {
  const [session, setSession] = useState(loadSession)

  const login = useCallback(async (provider) => {
    const person = await postProviderLogin(provider)
    const s = { personId: person.id, name: person.full_name, provider }
    localStorage.setItem(STORAGE_KEY, JSON.stringify(s))
    setSession(s)
    return person
  }, [])

  const logout = useCallback(() => {
    localStorage.removeItem(STORAGE_KEY)
    setSession(null)
  }, [])

  const deleteMyAccount = useCallback(async (personId) => {
    await deleteAccount(personId)
    localStorage.removeItem(STORAGE_KEY)
    setSession(null)
  }, [])

  return { session, login, logout, deleteMyAccount, isLoggedIn: !!session }
}

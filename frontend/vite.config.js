import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig(({ mode }) => {
  const env = { ...process.env, ...loadEnv(mode, process.cwd(), '') }
  const appHost = env.VITE_APP_HOST || env.VITE_API_HOST || 'localhost'
  const allowedHosts = (env.VITE_ALLOWED_HOSTS || appHost)
    .split(',')
    .map((host) => host.trim())
    .filter(Boolean)

  return {
    plugins: [react()],
    server: {
      host: env.VITE_DEV_SERVER_HOST || '0.0.0.0',
      port: Number(env.FRONTEND_PORT || 5173),
      strictPort: true,
      allowedHosts,
      watch: {
        usePolling: true,
      },
    },
  }
})

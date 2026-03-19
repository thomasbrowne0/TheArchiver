import { useState } from 'react'
import './PostFeed.css'

function timeAgo(dateStr) {
  if (!dateStr) return ''
  const diff = Date.now() - new Date(dateStr).getTime()
  const mins  = Math.floor(diff / 60000)
  const hours = Math.floor(diff / 3600000)
  const days  = Math.floor(diff / 86400000)
  const months = Math.floor(days / 30)
  const years  = Math.floor(days / 365)
  if (years  > 0) return `${years}y ago`
  if (months > 0) return `${months}mo ago`
  if (days   > 0) return `${days}d ago`
  if (hours  > 0) return `${hours}h ago`
  return `${mins}m ago`
}

function PostCard({ post }) {
  const [expanded, setExpanded] = useState(false)
  const isLong = post.content && post.content.length > 200

  return (
    <div className="post-card">
      <div className="post-header">
        <span className={`post-type post-type--${post.post_type}`}>{post.post_type?.toUpperCase()}</span>
        <span className="post-time">{timeAgo(post.posted_at)}</span>
      </div>

      {post.content && (
        <p className={`post-content ${!expanded && isLong ? 'truncated' : ''}`}>
          {post.content}
        </p>
      )}

      {isLong && (
        <button className="post-expand" onClick={() => setExpanded(v => !v)}>
          {expanded ? 'Show less' : 'Show more'}
        </button>
      )}

      <div className="post-footer">
        <span className="post-stat">♥ {post.likes_count?.toLocaleString() ?? 0}</span>
        <span className="post-stat">💬 {post.comments_count?.toLocaleString() ?? 0}</span>
      </div>
    </div>
  )
}

export default function PostFeed({ posts, platformName }) {
  const filtered = platformName
    ? posts.filter(p => p.platform_name === platformName)
    : posts

  if (filtered.length === 0) {
    return (
      <div className="post-feed-empty">
        <span>No archived posts on this platform.</span>
      </div>
    )
  }

  return (
    <div className="post-feed">
      {filtered.map(p => <PostCard key={p.post_id} post={p} />)}
    </div>
  )
}

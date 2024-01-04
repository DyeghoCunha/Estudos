import React from 'react'
import styles from "./Post.module.css"


function Post(props) {
  return (
    <div className={styles.post}>
      <p className={styles.author}>{props.author}</p>
      <p className={styles.text}>{props.body}</p>
    </div>
  )
}

export default Post;
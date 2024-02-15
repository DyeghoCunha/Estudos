import { getMeal } from "@/lib/meals"
import styles from "./page.module.css"
import Image from "next/image"
import { notFound } from "next/navigation"
export default function MealDetailPage({ params }) {
  const meal = getMeal(params.mealSlug)

  if (!meal) {
    notFound()
  }
     meal.instructions = meal.instructions.replace(/\n/g, "<br/>")
  

 

  return (

    <>
      <header className={styles.header}>
        <div className={styles.image}>
          <Image fill src={meal.image} />
        </div>
        <div className={styles.headerText}>
          <h1>{meal.title}</h1>

          <p className={styles.creator}>
            by <a href={`mailto:${meal.creator_email}`}>{meal.creator}</a>
          </p>
          <p className={styles.summary}>{meal.summary}</p>

        </div>
      </header >
      <main className={styles.main}>
        <p className={styles.instructions} dangerouslySetInnerHTML={{
          __html: meal.instructions,
        }}></p>

      </main>
    </>
  )
}

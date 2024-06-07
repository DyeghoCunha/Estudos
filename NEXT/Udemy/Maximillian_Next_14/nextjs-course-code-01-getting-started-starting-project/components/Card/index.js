import styles from "./list.module.css"

export default function Card() {

    
    return (
        <div className={styles.flipCard}>
            <div className={styles.flipCardInner}>
                <div className={styles.flipCardFront}>
                    <h1>Conteudo 1 </h1>
                </div>
                <div className={styles.flipCardBack}>
                    <h1>Conteudo 2 </h1>
                </div>
            </div>
        </div>
    );
}


import Link from "next/link";
import logoImg from "@/assets/logo.png"
import styles from "./main-header.module.css"
import Image from "next/image"
import NavLink from "../nav-link/nav-link";

export default function MainHeader() {

  return (
    <header className={styles.header}>
      <Link className={styles.logo} href="/">
        <Image src={logoImg} alt="A plate" priority />
        NextLevel Food
      </Link>
      <nav className={styles.nav}>
        <ul>
          <li>
            <NavLink href="/meals">Browse Meals</NavLink>
          </li>
          <li>
            <NavLink href="/community">Food Community</NavLink>
          </li>
        </ul>
      </nav>
    </header>
  )
}

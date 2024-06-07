import {useRouter, withRouter} from "next/router"

export default function PortifolioProjectPage() {
   const router = useRouter();

  console.log(router.pathname) 
  console.log(router.query) 
  return (
    <div>
      <h1>
        The Portifolio Project Page 
        
      </h1>
      <p>{router.query.projectid}</p>
    </div>
  )
}

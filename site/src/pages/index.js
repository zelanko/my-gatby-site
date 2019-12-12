import React from "react"
import { Link } from "gatsby"

import Layout from "../components/layout"
import Image from "../components/image"
import SEO from "../components/seo"

const IndexPage = () => (
  <Layout>
    <SEO title="Home" />
    <h1>Hi people. I am Ari.</h1>
    <p>Welcome to my new Gatsby site!</p>
    <Link to="/page-2/" onClick="{function(){alert('hi');}}">Go to page 2</Link>
  </Layout>
)

export default IndexPage

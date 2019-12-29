module.exports = {
  siteMetadata: {
    title: `Ari Zelanko - Professional Software Engineer`,
    description: `This website is meant to be about me. Using gatsbyjs and react to generate it.`,
    author: `@ari_zelanko`,
  },
  plugins: [
    {
      resolve: `gatsby-plugin-google-analytics`,
      options: {
        trackingId: "UA-155092329-1",
      },
    },
    `gatsby-plugin-react-helmet`,
    `gatsby-transformer-sharp`,
    `gatsby-plugin-sharp`,
    {
      resolve: `gatsby-plugin-manifest`,
      options: {
        name: `ari_zelanko`,
        short_name: `ari_zelanko`,
        start_url: `/`,
        background_color: `#663399`,
        theme_color: `#663399`,
        display: `minimal-ui`,
      },
    },
    `gatsby-plugin-offline`,
  ],
}

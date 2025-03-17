class Queries{
  static const String trendingAnime = '''
    query GetAnimeDetails{
      Page (perPage: 10){
        media(sort: [TRENDING_DESC],isAdult: false, type: ANIME){
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';
  static const String popularAnime = '''
    query GetAnimeDetails{
      Page (perPage: 10){
        media(sort: [POPULARITY_DESC],isAdult: false, type: ANIME){
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';
  static const String recentlyReleasedAnimes = '''
    query GetAnimeDetails{
      Page (perPage: 10){
        media(type: ANIME, status: RELEASING, sort: START_DATE_DESC,isAdult: false) {
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';
  static String searchQuery() => '''
    query SearchAnime(\$search: String){
      Page (perPage: 10){
        media(search: \$search,sort: [POPULARITY_DESC],isAdult: false, type: ANIME){
          id
          idMal
          startDate {
            day
            month
            year
          }
          endDate {
            day
            month
            year
          }
          season
          type
          format
          status
          episodes
          duration
          isAdult
          meanScore
          popularity
          genres
          trailer {
            id
            site
            thumbnail
          }
          title {
            native
            english
            romaji
          }
          coverImage {
            medium
            large
            extraLarge
          }
          bannerImage
          description
          characters (){
            edges {
              id
              name
              role
              node {
                age
                name {
                  first
                  last
                }
                image {
                  large
                  medium
                }
              }
              voiceActors {
                name {
                  first
                  last
                }
                image {
                  medium
                  large
                }
              }
            }
          }  
        }
      }
    }
  ''';
}

